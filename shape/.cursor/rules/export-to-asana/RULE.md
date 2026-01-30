---
description: Export epics and user stories to Asana-compatible CSV format
globs:
  - "shape/**"
  - "scripts/**"
  - "exports/**"
alwaysApply: false
---

# Rule: Export to Asana

## Goal

Run the Asana export script to generate a CSV file that can be imported into Asana with epics as milestones and user stories as subtasks.

## Trigger Phrases

This rule should activate when the user says something like:
- "Export to Asana"
- "Export epics and user stories to Asana CSV"
- "Generate Asana import"
- "Create Asana CSV"
- "Run the Asana export"

## Process

1. **Run the export script:**

```bash
./scripts/export-to-asana.sh
```

2. **Report the results** to the user, including:
   - Number of epics exported
   - Number of user stories exported
   - Location of the output file (`exports/asana-import.csv`)

3. **Provide import instructions:**
   - Go to your Asana project
   - Click the dropdown arrow next to the project name
   - Select **Import** → **CSV**
   - Upload `exports/asana-import.csv`
   - Map columns: Name, Description, Type, Parent Task

## Output

- **Format**: CSV
- **Location**: `exports/asana-import.csv`
- **Structure**: Epics as milestones, user stories as subtasks linked via Parent Task column

## Notes

- The script automatically skips template/example files
- User stories are linked to parent epics based on filename prefix (e.g., `ath_01_...` links to epic with ID `ATH`)
- The `exports/` directory is gitignored
