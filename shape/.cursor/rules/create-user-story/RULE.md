---
description: Generate user stories following Nova process structure and format
globs:
  - "shape/4_user-stories/**"
alwaysApply: false
---

# Rule: Generating User Stories

## Goal

To guide an AI assistant in creating detailed user stories in Markdown format following the Nova process structure. User stories should be clear, actionable, and include comprehensive acceptance criteria that can guide implementation.

## Story ID System

Every user story must have a unique **Story ID** that consists of the Epic ID plus a sequential number:

### Story ID Format

```
[EPIC_ID]-[XX]
```

Where:
- `EPIC_ID` = 3-letter epic identifier (e.g., `ATH`, `ENR`, `POV`)
- `XX` = 2-digit sequential number (e.g., `01`, `02`, `03`)

**Examples:** `ATH-01`, `ATH-02`, `ENR-05`, `POV-03`

### Story ID Guidelines

| Guideline | Example |
|-----------|---------|
| Use the parent epic's ID | Epic `ATH` → Stories `ATH-01`, `ATH-02` |
| Use 2-digit numbers (zero-padded) | `01`, `02`, ... `09`, `10`, `11` |
| Sequence reflects priority/order | Lower numbers = higher priority or earlier in workflow |
| Group related stories sequentially | Request access: `ATH-02`, `ATH-03`; Approvals: `ATH-04`, `ATH-05` |

### Filename Convention

User story files follow this naming pattern:

```
[epic_id]_[XX]_[story_name].md
```

Where:
- `epic_id` = lowercase epic ID (e.g., `ath`, `enr`, `pov`)
- `XX` = 2-digit sequence number matching the Story ID
- `story_name` = snake_case story name

**Examples:**
- `ath_01_passwordless_authentication.md` (Story ID: ATH-01)
- `enr_03_face_sheet_upload_ocr.md` (Story ID: ENR-03)
- `pov_02_patient_list_expanded_thumbnail.md` (Story ID: POV-02)

### Determining Story Sequence

When assigning story IDs within an epic, consider:

1. **Dependencies** — Stories that must be built first get lower numbers
2. **Workflow order** — Follow the natural user flow (e.g., login before dashboard)
3. **Grouping** — Keep related stories sequential (e.g., all "request access" stories together)
4. **Priority** — Higher business priority = lower number

## Process

1. **Review PRD:** Before creating user stories, the AI *must* read the PRD in `shape/1_big-picture/prd.md` to understand the product context, features, and user personas.
2. **Review Context Documents:** If available, review documents in `shape/context/` (SOW, product briefs, discovery notes) to understand specific requirements and feature details.
3. **Check Epic Context:** Determine which epic this user story belongs to. If working in an epic directory (e.g., `shape/4_user-stories/authentication/`), use that epic. If not, check for the epic details file (e.g., `ath_00_epic_details.md`) in the current directory or ask the user which epic this story belongs to.
4. **Review Epic Details:** Read the epic details file to understand the epic's scope, context, and existing user stories with their IDs.
5. **Determine Story ID:** Check existing story IDs in the epic and assign the next sequential number. If reordering, propose new IDs based on priority/dependencies.
6. **Identify Feature:** The user provides a feature name or description from the PRD or context documents, or requests a new user story.
7. **Map to Context Documents:** If the feature exists in context documents (SOW, etc.), reference specific requirements to inform the user story details.
8. **Look Up Estimate (if available):** If an estimation sheet exists in `shape/context/`, find the estimate for this story (see "Estimation Lookup" section below).
9. **Ask Clarifying Questions:** If needed, ask clarifying questions to understand the specific user need, edge cases, and acceptance criteria.
10. **Generate User Story:** Create a user story following the structure outlined below, incorporating the Story ID and any available requirements/estimates.
11. **Save User Story:** Save as `[epic_id]_[XX]_[story_name].md` (e.g., `ath_02_request_access.md`).
12. **Update Epic Details:** Add the new story to the User Stories table in the epic details file.

## Estimation Lookup (Optional)

If an estimation sheet exists in `shape/context/` (e.g., `estimates.csv` or similar), include a **Dev Days** or **Story Points** estimate in the user story.

### How to Find the Estimate

1. **Check for estimation sheet** in `shape/context/`
2. **Match the user story** to a row based on feature area and functionality
3. **Extract the estimate** value from the matched row

### Mapping Guidelines

- **One-to-one mapping**: If a user story maps directly to one row, use that row's estimate
- **Multiple rows**: If a user story combines multiple features, sum the estimates from all applicable rows
- **Partial row**: If a user story is only part of a feature row, estimate the fraction
- **No match found**: If no row matches, ask the user for an estimate or leave blank
- **No estimation sheet**: If no estimation sheet exists, omit the estimate field or ask the user

## User Story Structure

The generated user story must follow this exact structure:

```markdown
# User Story: [Feature Name]

**Story ID:** [EPIC_ID]-[XX]
**Estimate (Dev Days):** [X.X]

**As a** [user persona/role]
**I want** [goal/desired action]
**So that** [benefit/value/outcome]

## Context
[2-4 sentences explaining the business context, why this story exists, and any relevant background information. Reference the epic and PRD feature using relative markdown links if applicable (e.g., "This user story is part of the [Authentication epic](../authentication/epic_details.md) and relates to [Feature 3: Authentication](../../1_big-picture/prd.md#feature-3-authentication).")]

## Scenarios

### Happy Path
1. [Step-by-step numbered list of the primary user flow]
2. [Each step should be specific and actionable]
3. [Continue until the user achieves their goal]

### Edge Cases
- **[Edge case name]**: [Description of how the system should handle this edge case]
- **[Another edge case]**: [Description]
- [Continue listing all relevant edge cases]

## Acceptance Criteria
- [ ] [Specific, testable criterion that must be met]
- [ ] [Another specific criterion]
- [ ] [Continue with all acceptance criteria]
- [ ] [Each criterion should be independently verifiable]

## Design References
- [Screen Name]([Figma URL or design link]) - [Brief description if needed]
- [Another Screen]([Figma URL]) - [Brief description if needed]
- [Include links to design mockups for all screens/pages involved in this user story]
- [List all screens/pages the user interacts with, including confirmation pages, error pages, and interstitial screens]
- [Note: This section combines what was previously "Key Screens" and "Design References" - no separate Key Screens section needed]

## Out of Scope
- [Feature/functionality explicitly not included in this story]
- [Another out-of-scope item]
- [Be explicit about what is NOT part of this story to prevent scope creep]
- [If referencing a "separate user story" that doesn't exist yet, note that it's planned but not yet created]

## Related Stories
- DEPENDENCY - [[EPIC_ID]-[XX]: Story Name]([epic_id]_[XX]_story_name.md) - [Brief description]
- RELATED - [[EPIC_ID]-[XX]: Another Story]([epic_id]_[XX]_story_name.md) - [Description]
- TODO: [Story name] - [Description] (Add story when created)
- [Include stories that are dependencies (must be completed before this one) or contextually related]
- [If a related story doesn't exist yet, mark it as "TODO: Add story when created"]
- [Make sure to identify the relationship between the stories. If it's a dependency please add "DEPENDENCY" before the story link, likewise RELATED if it's related.]

## Questions
- [ ] [Open question that needs to be answered]
- [ ] [Another question]
- [Use this section to track questions that arise during story creation]
```

## Important Guidelines

### User Story Format (As a/I want/So that)
- **As a**: Use the specific user persona from the PRD (e.g., "healthcare provider staff member", "patient", "program administrator")
- **I want**: Be specific about the action or capability (e.g., "to request access to a patient access program portal")
- **So that**: Clearly state the value or outcome (e.g., "I can enroll and manage patients in the program")

### Context Section
- Reference the epic this story belongs to using a relative markdown link with the correct filename (e.g., "This user story is part of the [Authentication epic](ath_00_epic_details.md)")
- Reference the PRD feature this story relates to using a relative markdown link (e.g., "This story relates to [Feature 3: Authentication](../../1_big-picture/prd.md#feature-3-authentication)")
- Explain the business need
- Include any relevant technical context (e.g., integrations, multi-tenancy, external systems)
- Keep it concise (2-4 sentences)

### Scenarios
- **Happy Path**: Should be a complete, numbered step-by-step flow from start to finish
- **Edge Cases**: Include validation errors, duplicate data, missing permissions, etc.
- **Do NOT include system unavailability edge cases** (e.g., email service failures, system downtime) - these are rare and not a focus for v1
- Be specific about error messages and user feedback

### Acceptance Criteria
- Each criterion must be independently testable and directly related to helping the user achieve their goal
- Use checkboxes `- [ ]` for tracking implementation
- Focus on functional requirements, business rules, validation logic, and system behaviors
- **Do NOT include basic UI navigation** (e.g., "button redirects to page", "link navigates to page") - these are documented in designs
- **Do NOT include obvious UI copy or messaging** - designs document the exact copy
- Include validation rules, business logic, and system integrations
- Include responsive design requirements if applicable (but not basic "page is responsive" - be specific about breakpoints or behaviors)
- Include accessibility requirements if applicable
- Reference white-labeling/branding requirements if applicable (but not basic "page displays branding" - be specific about what branding elements)

### Design References
- Since full designs are available, keep this section concise - link to designs without unnecessary descriptions
- Link to Figma designs or other design tools for all screens/pages involved
- Use descriptive names for the links (e.g., "HCP Portal Logout", "Patient Request Access")
- Avoid redundant descriptions that are already clear from the design links
- Only include brief descriptions if needed to clarify which variant or state (e.g., "patient-specific version")
- If designs don't exist yet, note that in the Questions section

### Out of Scope
- Explicitly state what is NOT included in THIS specific user story to prevent scope creep
- **DO NOT** list other user stories as "out of scope" - other user stories are separate implementations, not out of scope
- Include future enhancements that are deferred or not in the SOW
- Include design decisions that exclude certain approaches (e.g., "Password-based authentication" if the system uses passwordless only - but note this is a design decision, not a separate user story)
- Focus on what is explicitly NOT part of this story's implementation, not what other stories will handle

### Related Stories
- Use this section to document relationships with other user stories
- Include both **dependencies** (stories that must be completed before this one) and **contextual relationships** (stories that are related but not necessarily dependencies)
- **Include the Story ID** in the link text (e.g., `[ATH-02: HCP Request Access](ath_02_hcp_request_access.md)`)
- Link to existing stories using relative markdown links with the new filename format
- For stories that don't exist yet, use the format: `TODO: [Story Name] - [Brief description] (Add story when created)`
- This helps developers understand the story's place in the larger system and identify dependencies
- **Do NOT list Authentication as a dependency** - authentication is a baseline requirement for all portal features and is assumed. If a story has specific authentication nuances, note them in acceptance criteria instead.
- Examples:
  - Dependency: `DEPENDENCY - [ENR-01: Initiate Patient Enrollment](../patient-enrollment/enr_01_initiate_patient_enrollment.md) - Must be completed before viewing patient detail`
  - Contextual: `RELATED - [ATH-04: HCP Receives Access Approval](ath_04_hcp_receives_access_approval.md) - Approval emails sent after request`

## Project-Specific Considerations

When creating user stories, consider these common patterns (customize based on your project):

1. **Branding/White-Labeling**: If the product supports multiple brands or tenants
2. **Multi-Tenant URLs**: If URLs determine which tenant/brand to display
3. **External Integrations**: If workflows create records in external systems (CRM, ERP, etc.)
4. **Email Notifications**: If user actions trigger emails (may be separate user stories)
5. **Responsive Design**: If features must work across desktop, tablet, and mobile
6. **Error Handling**: Always include friendly error messages and graceful degradation
7. **Accessibility**: Consider WCAG compliance requirements

## Epic Context

User stories are organized within epic directories. Each epic represents a major feature area from the PRD and contains:
- `[epic_id]_00_epic_details.md`: Overview of the epic, its scope, and user story table with IDs
- Individual user story files: `[epic_id]_XX_story_name.md` format

When creating a user story:
- If you're already in an epic directory, check existing stories to determine the next sequence number
- If no epic exists yet, create the epic first using the `create-epic.md` rule
- Reference the epic in the user story's Context section using the correct filename (e.g., `ath_00_epic_details.md`)
- After creating the story, update the epic details file to include the new story in its User Stories table

## Example Reference

See `shape/4_user-stories/example.md` for a template showing the user story format with proper structure and conventions.

## Output

- **Format**: Markdown (`.md`)
- **Location**: `shape/4_user-stories/[epic-name]/`
- **Filename**: `[epic_id]_[XX]_[story_name].md` (e.g., `ath_02_hcp_request_access.md`)
- **Story ID**: `[EPIC_ID]-[XX]` (e.g., `ATH-02`)

## Final Instructions

1. Always read the PRD first to understand context and user personas
2. Review context documents in `shape/context/` if available (SOW, product briefs, discovery notes)
3. Check for epic context - read the epic details file (e.g., `ath_00_epic_details.md`) if it exists
4. **Assign a Story ID** based on the epic ID and next available sequence number
5. **Use the correct filename format:** `[epic_id]_[XX]_[story_name].md`
6. Reference the epic in the user story's Context section with the updated filename
7. If context documents exist, incorporate relevant requirements into the user story
8. Include estimate if an estimation sheet exists in `shape/context/`
9. Ensure the user story aligns with features defined in the PRD and the epic's scope
10. Be specific and detailed in acceptance criteria
11. Include all edge cases and error scenarios
12. Reference design mockups when available
13. **Update the epic details file** to include the new story in the User Stories table
