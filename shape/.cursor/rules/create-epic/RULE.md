---
description: Generate epics from PRD features following Nova process structure
globs:
  - "shape/4_user-stories/**"
alwaysApply: false
---

# Rule: Generating Epics

## Goal

To guide an AI assistant in creating epic directories and epic details files from PRD features. Epics represent major feature areas that will be broken down into user stories. Each epic lives in its own directory within `shape/4_user-stories/`.

## Epic ID System

Every epic must have a unique **Epic ID** — a 3-letter uppercase identifier that is used for:
- Referencing the epic in documentation and communication
- Prefixing user story IDs (e.g., `ATH-01`, `ATH-02`)
- Naming the epic details file (e.g., `ath_00_epic_details.md`)

### Epic ID Guidelines

| Guideline | Example |
|-----------|---------|
| Use 3 uppercase letters | `ATH`, `ENR`, `POV` |
| Make it memorable and meaningful | Authentication → `ATH` |
| Avoid ambiguity with other epics | Use `ENR` for Enrollment (not `PEN` which could be confused with Patient) |
| Check existing IDs first | Review `shape/context/epics.md` for existing IDs |

### Existing Epic IDs

Before creating a new epic, check for existing epics in `shape/4_user-stories/` to avoid ID conflicts. Consider maintaining a list of epic IDs in `shape/context/epics.md` for larger projects.

### Epic ID Examples

| Epic Name | Epic ID | Rationale |
|-----------|---------|-----------|
| Authentication | ATH | Clear abbreviation |
| Patient Enrollment | ENR | Focus on "enrollment" action |
| Patient Overview | POV | Matches "Overview" |
| Patient Detail | PDT | "Patient Detail" |
| Client Reporting | CRP | "Client Reporting Portal" |
| General Documents | DOC | Focus on documents |

## Process

1. **Review PRD:** Before creating an epic, the AI *must* read the PRD in `shape/1_big-picture/prd.md` to identify the feature that will become the epic.
2. **Review Context Documents:** If available, review documents in `shape/context/` (SOW, product briefs, discovery notes) to identify detailed requirements and user stories related to this epic.
3. **Identify Feature:** The user provides a feature number or name from the PRD, or requests a new epic.
4. **Map Features to User Stories:** Review context documents and extract specific features/functionality that will become user stories. Consider:
   - Features grouped by user type or portal
   - Features grouped by functional area (Authentication, Dashboard, etc.)
   - Features that are shared across user types
5. **Create Epic Directory:** Create a directory named `[epic-name]` using kebab-case (e.g., `authentication`, `user-dashboard`, `reporting`).
6. **Generate Epic Details:** Create `epic_details.md` following the structure outlined below, incorporating user stories identified from the PRD and context documents.
7. **Save Epic:** Save the `epic_details.md` file inside the epic directory.

## Epic Directory Structure

```
shape/4_user-stories/
├── [epic-name]/
│   ├── [epic_id]_00_epic_details.md
│   ├── [epic_id]_01_user_story_1.md
│   ├── [epic_id]_02_user_story_2.md
│   └── ...
```

**Naming Convention:**
- Directory: kebab-case (e.g., `patient-enrollment`)
- Epic details file: `[epic_id]_00_epic_details.md` (e.g., `enr_00_epic_details.md`)
- User story files: `[epic_id]_XX_story_name.md` where `XX` is a 2-digit sequence number

## Epic Details Structure

The generated epic details file must follow this exact structure:

```markdown
# Epic: [Epic Name]

**Epic ID:** [3-letter ID, e.g., ATH]

## Description
[Copy the description from the PRD feature. This should be the detailed description of what this feature does and how it works.]

## Why It Matters
[Copy the "Why it matters" section from the PRD feature. This should explain the business value and user benefit, connecting to objectives. Expand this section to include high-level context about the epic's scope, how the user stories work together, and any important integration or architectural considerations.]

## User Stories

| ID | Story Name | Description |
|----|------------|-------------|
| [[EPIC_ID]-01]([epic_id]_01_story_name.md) | [Story Name] | [Brief description] |
| [[EPIC_ID]-02]([epic_id]_02_story_name.md) | [Story Name] | [Brief description] |
| [Continue with sequential IDs...] | | |

## What's Not Included

- [Only include items that are visually or structurally part of this feature but explicitly excluded from scope]
- [This section should be minimal - only call out exclusions that would otherwise be confusing]
- [May be empty if there are no confusing exclusions]
- [Future enhancements that are deferred to later phases]

## Related Epics

- [Epic Name](../[epic-name]/epic_details.md): [Brief description of how this epic relates]
- [Another Epic](../[epic-name]/epic_details.md): [Relationship description]

## PRD Reference

This epic corresponds to **[Feature [Number]: [Feature Name]](../../1_big-picture/prd.md#feature-[number]-[feature-name-kebab-case])** from the PRD.
```

## Important Guidelines

### Epic Naming
- Use kebab-case for directory names (e.g., `authentication`, `hcp-portal`, `patient-portal`)
- Epic names should match or closely align with PRD feature names
- Keep names concise and descriptive

### Description Section
- Copy the exact description from the PRD feature
- This provides the detailed context of what the feature does

### Why It Matters Section
- Copy the exact "Why it matters" text from the PRD
- Expand this section to include high-level context about:
  - How the user stories work together
  - Important integration or architectural considerations
  - Cross-portal or cross-feature implications
  - Any key technical or business context that helps understand the epic's scope
- This maintains traceability to business objectives while providing necessary context

### User Stories Section
- **Identify user stories from context documents:** If available, review SOW, product briefs, or discovery notes to extract features/functionality that relate to this epic
- Use a table format with columns: ID, Story Name, Description
- Assign sequential story IDs based on the epic ID (e.g., `ATH-01`, `ATH-02`, `ATH-03`)
- Link each ID to the corresponding user story file using the naming convention `[epic_id]_XX_story_name.md`
- Include brief descriptions of what each user story covers
- Note when features are reused across portals (e.g., "Reuses HCP flows with patient-specific nuance")
- Consider priority/sequencing when assigning IDs — lower numbers should generally be implemented first
- **Do NOT include a narrative paragraph here** - that context belongs in the "Why It Matters" section

### What's Not Included Section
- **Purpose:** Call out anything that is visually or structurally part of this feature but is explicitly NOT included in this body of work
- **Only include items if their absence would be confusing** to someone building out this epic
- **Good example:** "Search functionality - being developed in a separate Search epic" (if search UI appears in the design but is handled elsewhere)
- **Good example:** "Bulk actions - deferred to Phase 2" (if the table UI has bulk action checkboxes but they won't be functional)
- **Do NOT add general features** that aren't part of this epic unless they would naturally seem like they should be included
- This section may be empty or minimal for many epics - that's fine

### Related Epics Section
- Reference other epics that have dependencies or relationships
- Use relative markdown links to the epic's `epic_details.md` file
- Format: `[Epic Name](../[epic-name]/epic_details.md)` (relative path from current epic directory)
- Explain how they relate (e.g., "depends on", "integrates with", "complements")

### PRD Reference Section
- Always include the feature number and name from the PRD
- Use a relative markdown link to the PRD file with an anchor to the specific feature section
- Format: `[Feature [Number]: [Feature Name]](../../1_big-picture/prd.md#feature-[number]-[feature-name-kebab-case])` (relative path from epic directory)
- Convert feature names to kebab-case for the anchor (e.g., "White Labeling" becomes "white-labeling")
- This maintains traceability between PRD and epics

## Epic Creation Workflow

1. **Identify PRD Feature:** Locate the feature in `shape/1_big-picture/prd.md`
2. **Review Context Documents:** If available, read documents in `shape/context/` (SOW, product briefs) to identify detailed requirements for this epic
3. **Check Existing Epic IDs:** Review existing epics in `shape/4_user-stories/` for existing Epic IDs to avoid conflicts
4. **Assign Epic ID:** Create a 3-letter uppercase identifier that is meaningful and not already in use
5. **Map Features to User Stories:** Extract specific features/functionality that will become user stories from the PRD and context documents
6. **Create Directory:** Create `shape/4_user-stories/[epic-name]/`
7. **Generate Epic Details:** Use the structure above, pulling information from the PRD and any context documents
8. **Save File:** Save as `[epic_id]_00_epic_details.md` in the epic directory (e.g., `ath_00_epic_details.md`)
9. **Remind User:** After creating the epic, remind the user that user stories should be created next within this epic directory using the user story rule

## Output

- **Format**: Markdown (`.md`)
- **Location**: `shape/4_user-stories/[epic-name]/`
- **Filename**: `[epic_id]_00_epic_details.md` (e.g., `ath_00_epic_details.md`)
- **Directory**: `[epic-name]` (kebab-case)
- **Epic ID**: 3-letter uppercase identifier (e.g., `ATH`)

## Final Instructions

1. Always read the PRD first to understand the feature context
2. Review context documents in `shape/context/` if available (SOW, product briefs, discovery notes)
3. Check existing epics in `shape/4_user-stories/` for Epic ID conflicts before creating a new one
4. Extract user story features from context documents when available
5. Use exact text from the PRD for Description and Why It Matters sections
6. Include a User Stories table with IDs and links in the epic details file
7. Only include "What's Not Included" items if they would be confusing to omit (e.g., visually present in designs but excluded from scope)
8. Reference related epics when dependencies exist
9. After generating the epic, remind the user that user stories should be created next within this epic directory

