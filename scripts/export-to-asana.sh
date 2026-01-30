#!/bin/bash

# Nova to Asana CSV Exporter
# Exports epics and user stories to Asana-compatible CSV format
# Epics become parent tasks, user stories become subtasks

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SHAPE_DIR="$PROJECT_ROOT/shape"
EPICS_DIR="$SHAPE_DIR/2_epics"
STORIES_DIR="$SHAPE_DIR/4_user-stories"
OUTPUT_DIR="$PROJECT_ROOT/exports"
OUTPUT_FILE="$OUTPUT_DIR/asana-import.csv"

# Create exports directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Function to escape CSV fields (handle commas, quotes, newlines)
# Asana supports multi-line text in quoted CSV fields, so we preserve newlines
escape_csv() {
    local field="$1"
    # If field contains comma, quote, newline, or leading/trailing spaces, wrap in quotes
    if [[ "$field" == *","* ]] || [[ "$field" == *'"'* ]] || [[ "$field" == " "* ]] || [[ "$field" == *" " ]] || [[ "$field" == *$'\n'* ]]; then
        # Double any existing quotes
        field="${field//\"/\"\"}"
        field="\"$field\""
    fi
    printf '%s' "$field"
}

# Function to extract title from markdown file (first H1)
# Cleans up common patterns like "Epic: " or "User Story: " prefixes
extract_title() {
    local file="$1"
    local title
    title=$(grep -m 1 "^# " "$file" 2>/dev/null | sed 's/^# //' || echo "")
    # Remove common prefixes and template brackets
    title=$(echo "$title" | sed -E 's/^(Epic|User Story): ?//')
    # Remove template placeholders like [Feature Name]
    if [[ "$title" == "["*"]" ]]; then
        # If title is just a placeholder, try to get a better one from filename
        title=""
    fi
    echo "$title"
}

# Function to extract Epic ID from markdown file
extract_epic_id() {
    local file="$1"
    local epic_id
    # Look for Epic ID pattern, extract just the ID (e.g., ATH)
    epic_id=$(grep -m 1 "^\*\*Epic ID:\*\*" "$file" 2>/dev/null | sed 's/\*\*Epic ID:\*\* *//' | grep -oE '^[A-Z]{2,4}' || echo "")
    echo "$epic_id"
}

# Function to extract description section from markdown
# Preserves formatting with newlines for Asana import
extract_description() {
    local file="$1"
    local in_description=false
    local description=""
    local blank_line_pending=false
    
    while IFS= read -r line; do
        if [[ "$line" == "## Description" ]]; then
            in_description=true
            continue
        fi
        if [[ "$in_description" == true ]]; then
            # Stop at next heading
            if [[ "$line" == "## "* ]]; then
                break
            fi
            if [[ -z "$line" ]]; then
                # Track blank lines to preserve paragraph breaks
                if [[ -n "$description" ]]; then
                    blank_line_pending=true
                fi
            else
                if [[ -n "$description" ]]; then
                    if [[ "$blank_line_pending" == true ]]; then
                        description="$description"$'\n\n'"$line"
                        blank_line_pending=false
                    else
                        description="$description"$'\n'"$line"
                    fi
                else
                    description="$line"
                fi
            fi
        fi
    done < "$file"
    
    printf '%s' "$description"
}

# Function to extract user story statement (As a... I want... So that...)
# Preserves line breaks for readability in Asana
extract_user_story_statement() {
    local file="$1"
    local statement=""
    local in_statement=false
    
    while IFS= read -r line; do
        if [[ "$line" == "**As a**"* ]] || [[ "$line" == "**As an**"* ]]; then
            in_statement=true
        fi
        if [[ "$in_statement" == true ]]; then
            # Clean up markdown bold syntax
            local clean_line
            clean_line=$(echo "$line" | sed 's/\*\*//g')
            if [[ -n "$clean_line" ]]; then
                if [[ -n "$statement" ]]; then
                    statement="$statement"$'\n'"$clean_line"
                else
                    statement="$clean_line"
                fi
            fi
            # Stop after "So that" line
            if [[ "$line" == "**So that**"* ]]; then
                break
            fi
        fi
    done < "$file"
    
    printf '%s' "$statement"
}

# Function to extract acceptance criteria
# Preserves list format with bullet points for Asana
extract_acceptance_criteria() {
    local file="$1"
    local in_criteria=false
    local criteria=""
    
    while IFS= read -r line; do
        if [[ "$line" == "## Acceptance Criteria" ]]; then
            in_criteria=true
            continue
        fi
        if [[ "$in_criteria" == true ]]; then
            # Stop at next heading
            if [[ "$line" == "## "* ]]; then
                break
            fi
            # Extract checkbox items, convert to bullet points
            if [[ "$line" == "- [ ]"* ]] || [[ "$line" == "- [x]"* ]]; then
                local item
                item=$(echo "$line" | sed 's/- \[.\] //')
                if [[ -n "$criteria" ]]; then
                    criteria="$criteria"$'\n'"• $item"
                else
                    criteria="• $item"
                fi
            fi
        fi
    done < "$file"
    
    printf '%s' "$criteria"
}

# Function to determine epic from user story filename or content
# Returns the full epic display name (e.g., "[ATH] User Authentication")
get_epic_for_story() {
    local story_file="$1"
    local filename
    filename=$(basename "$story_file")
    
    # Try to extract epic prefix from filename (e.g., ath_01_user_login.md -> ATH)
    local epic_prefix
    epic_prefix=$(echo "$filename" | grep -oE '^[a-zA-Z]{2,4}' | tr '[:lower:]' '[:upper:]')
    
    if [[ -n "$epic_prefix" ]]; then
        # Look for matching epic
        for epic_file in "$EPICS_DIR"/*.md; do
            if [[ -f "$epic_file" ]]; then
                local epic_id
                epic_id=$(extract_epic_id "$epic_file")
                if [[ "$epic_id" == "$epic_prefix" ]]; then
                    local epic_title
                    epic_title=$(extract_title "$epic_file")
                    
                    # Build the full display name to match the epic's Name in CSV
                    if [[ -n "$epic_id" ]]; then
                        echo "[$epic_id] $epic_title"
                    else
                        echo "$epic_title"
                    fi
                    return
                fi
            fi
        done
    fi
    
    echo ""
}

# Function to extract story ID from filename
extract_story_id() {
    local file="$1"
    local filename
    filename=$(basename "$file" .md)
    
    # Try to extract ID pattern like ath_01 or ATH-01
    local story_id
    story_id=$(echo "$filename" | grep -oE '^[a-zA-Z]{2,4}[-_][0-9]+' | tr '[:lower:]' '[:upper:]' | tr '_' '-')
    
    if [[ -n "$story_id" ]]; then
        echo "$story_id"
    else
        # Return empty if it's just a generic filename
        if [[ "$filename" == "example" ]] || [[ "$filename" == "template" ]]; then
            echo ""
        else
            echo "$filename"
        fi
    fi
}

echo "Nova to Asana CSV Exporter"
echo "=========================="
echo ""

# Initialize CSV with Asana headers
# Supported columns: Name, Description, Type, Parent Task
echo "Name,Description,Type,Parent Task" > "$OUTPUT_FILE"

# Track exported items
epic_count=0
story_count=0

# First, export all epics as parent tasks
echo "Processing epics..."
if [[ -d "$EPICS_DIR" ]]; then
    for epic_file in "$EPICS_DIR"/*.md; do
        if [[ -f "$epic_file" ]]; then
            filename=$(basename "$epic_file")
            
            # Skip example files if you have real epics
            # Uncomment the next line to skip example.md
            # [[ "$filename" == "example.md" ]] && continue
            
            title=$(extract_title "$epic_file")
            epic_id=$(extract_epic_id "$epic_file")
            description=$(extract_description "$epic_file")
            
            # Skip if no meaningful title extracted (template files)
            if [[ -z "$title" ]] && [[ -z "$epic_id" ]]; then
                echo "  ⊘ Skipping $filename (no title or Epic ID found)"
                continue
            fi
            
            # Use Epic ID as fallback for title, or filename
            if [[ -z "$title" ]]; then
                if [[ -n "$epic_id" ]]; then
                    title="Epic $epic_id"
                else
                    title=$(basename "$epic_file" .md | tr '_-' ' ')
                fi
            fi
            
            # Add epic ID prefix if available
            if [[ -n "$epic_id" ]]; then
                display_name="[$epic_id] $title"
            else
                display_name="$title"
            fi
            
            name_escaped=$(escape_csv "$display_name")
            desc_escaped=$(escape_csv "$description")
            
            printf '%s,%s,Milestone,\n' "$name_escaped" "$desc_escaped" >> "$OUTPUT_FILE"
            echo "  ✓ Epic: $display_name"
            ((epic_count++))
        fi
    done
fi

# Then, export all user stories as subtasks
echo ""
echo "Processing user stories..."
if [[ -d "$STORIES_DIR" ]]; then
    for story_file in "$STORIES_DIR"/*.md; do
        if [[ -f "$story_file" ]]; then
            filename=$(basename "$story_file")
            
            # Skip example and template files
            # Uncomment to skip: [[ "$filename" == "example.md" ]] && continue
            [[ "$filename" == "outstanding_questions_example.md" ]] && continue
            
            title=$(extract_title "$story_file")
            story_id=$(extract_story_id "$story_file")
            user_story_statement=$(extract_user_story_statement "$story_file")
            acceptance_criteria=$(extract_acceptance_criteria "$story_file")
            parent_epic=$(get_epic_for_story "$story_file")
            
            # Skip if title is just a placeholder
            if [[ -z "$title" ]] || [[ "$title" == "["*"]" ]]; then
                echo "  ⊘ Skipping $filename (template file)"
                continue
            fi
            
            # Build display name with story ID
            if [[ -n "$story_id" ]]; then
                display_name="[$story_id] $title"
            else
                display_name="$title"
            fi
            
            # Build description from user story statement and acceptance criteria
            # Use newlines to preserve formatting in Asana
            full_description="$user_story_statement"
            if [[ -n "$acceptance_criteria" ]]; then
                full_description="$full_description"$'\n\n'"Acceptance Criteria:"$'\n'"$acceptance_criteria"
            fi
            
            name_escaped=$(escape_csv "$display_name")
            desc_escaped=$(escape_csv "$full_description")
            parent_escaped=$(escape_csv "$parent_epic")
            
            printf '%s,%s,,%s\n' "$name_escaped" "$desc_escaped" "$parent_escaped" >> "$OUTPUT_FILE"
            echo "  ✓ Story: $display_name"
            if [[ -n "$parent_epic" ]]; then
                echo "    └─ Parent: $parent_epic"
            fi
            ((story_count++))
        fi
    done
fi

echo ""
echo "=========================="
echo "Export complete!"
echo "  Epics exported: $epic_count"
echo "  Stories exported: $story_count"
echo "  Output file: $OUTPUT_FILE"
echo ""
echo "Import instructions:"
echo "  1. Go to your Asana project"
echo "  2. Click the dropdown arrow next to project name"
echo "  3. Select 'Import' > 'CSV'"
echo "  4. Upload $OUTPUT_FILE"
echo "  5. Map columns: Name, Description, Type, Parent Task"
