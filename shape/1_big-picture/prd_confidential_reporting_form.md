# Product Requirements Document — Confidential Reporting Form (Speak Up)

## Brief Product Overview

A confidential web-based system that allows New York Cruise Lines employees and third parties to report concerns directly to the Chairman. Reports may cover possible dishonesty, malpractice, legal/regulatory/policy violations, questionable accounting, or internal control issues. The system supports both anonymous submissions and identified submissions (with optional contact details for follow-up). It is designed to protect reporters from retaliation and to exclude use for emergency life-or-property situations, which must be reported through appropriate emergency channels.

## Objectives

1. **Enable safe, confidential reporting** — Provide a single, trusted channel for employees and third parties to raise concerns to the Chairman with measurable uptake (e.g., volume of submissions, completion rate).
2. **Support anonymous and identified reporting** — Allow users to submit without name or contact details, or to provide contact information for a prompt and thorough investigation.
3. **Preserve integrity and compliance** — Ensure submissions are stored and routed securely, with clear policy messaging (no retaliation for good-faith reports; disciplinary action for malicious or self-serving reports).
4. **Clarify scope** — Make it explicit that the system is not for emergencies; emergencies must be reported to the appropriate party for immediate response.

## End Users

- **Primary User Persona**: New York Cruise Lines employees (office, vessel, seasonal) who observe or suspect misconduct, policy violations, or control issues and want to report without fear of victimization, retaliation, discrimination, or disadvantage.
- **Secondary User Persona**: Third parties (contractors, vendors, partners, guests) who have concerns about the company’s conduct and want a direct, confidential channel to the Chairman.

## Approach Overview

A single-page confidential reporting form (“What’s the issue?”) with clear, reassuring copy (e.g., “Your submission is completely confidential”). The form captures: subject, optional name/email, an explicit “Remain anonymous” option, the brand/entity the report refers to (e.g., Circle Line Sightseeing or other NYCL brands), date of incident, detailed comment, and optional file upload. Submissions are sent to a secure backend and routed to the Chairman (or designated office). The UI and copy reinforce confidentiality, anonymity support, non-retaliation policy, and the exclusion of emergency use.

## Feature List

1. **Confidential submission form (“What’s the issue?”)**
   - Description: Single form with required fields (Subject, Brand referring to, Comment), optional Name/Email, “Remain anonymous” checkbox, Date of Incident, and file upload. Submit action sends data to a secure endpoint.
   - Priority: High
   - Why it matters: Core mechanism for capturing concerns and fulfilling the business requirement of a direct channel to the Chairman.

2. **Anonymous reporting**
   - Description: “Remain anonymous” checkbox; when selected, name and email are not collected or are excluded from submission. System must not log or store identifying information for anonymous submissions.
   - Priority: High
   - Why it matters: Essential for users who fear retaliation; explicitly required by the client.

3. **Brand / entity selector**
   - Description: Required dropdown “Brand Referring To” (e.g., Circle Line Sightseeing and other New York Cruise Lines brands) so reports can be categorized and routed correctly.
   - Priority: High
   - Why it matters: Ensures reports are attributed to the correct part of the organization for investigation.

4. **Optional contact information**
   - Description: Optional Name and Email fields; copy encourages providing contact details for follow-up when the user is comfortable.
   - Priority: High
   - Why it matters: Enables the company to conduct a prompt and thorough investigation when the reporter agrees to be contacted.

5. **Policy and scope messaging**
   - Description: In-page copy stating: (1) submissions are confidential; (2) no retaliation for good-faith concerns; (3) disciplinary action for malicious or personal-gain reports; (4) do not use for emergencies—use appropriate emergency channels for imminent threat to life or property.
   - Priority: High
   - Why it matters: Legal and cultural requirement; sets correct expectations and limits use of the system.

6. **Date of incident**
   - Description: Optional or required date field (dd/mm/yyyy) with date picker for when the incident occurred.
   - Priority: Medium
   - Why it matters: Helps investigations and record-keeping.

7. **File upload**
   - Description: “Upload” / “Select file” control allowing one or more attachments (within defined size/type limits) to support the report with evidence.
   - Priority: Medium
   - Why it matters: Improves quality and usefulness of reports for investigators.

8. **Secure submission and routing**
   - Description: Form submissions (and optional attachments) are transmitted and stored securely and routed to the Chairman or designated office; access is restricted and auditable.
   - Priority: High
   - Why it matters: Confidentiality and trust depend on secure handling of sensitive reports.

## Out of Scope (Explicit)

- **Emergency reporting**: The system must not be used for circumstances presenting an imminent threat to life or property. Product copy and possibly validation (e.g., disclaimer) must direct users to the appropriate emergency channel instead.

## Non-Functional Requirements

- **Confidentiality**: No logging of IP or other identifiers for anonymous submissions where technically feasible; strict access control and audit logging for stored reports.
- **Accessibility**: Form must be usable with keyboard and screen readers (WCAG 2.x AA as target).
- **Responsive design**: Usable on desktop and mobile (employees and third parties may report from various devices).
- **Brand alignment**: Visual design (e.g., dark blue background, white text, padlock/submit icon) should align with the provided reference and New York Cruise Lines branding.

## Tech Stack

- **Back-end**: [To be defined — e.g., Node/Express, Rails, or serverless API]
- **Front-end**: [To be defined — e.g., React, Vue, or server-rendered form]
- **Styling**: [To be defined — align with reference: dark blue background, white text, clear hierarchy]
- **Database**: [To be defined — secure store for submissions; consider encryption at rest]
- **File storage**: [To be defined — e.g., S3, GCS; access-controlled, linked to submission ID only where appropriate]
- **Email / notifications**: [To be defined — e.g., confirmation to user if contact given; internal alert to Chairman/office]
- **Hosting**: [To be defined — secure, compliant hosting]

## Success Criteria

- Employees and third parties can submit a concern anonymously or with contact details.
- Submissions clearly indicate brand and include subject, comment, and optional date and attachments.
- All in-scope policy and scope messaging is visible and understood before submit.
- No use of the system for emergencies without clear in-product guidance to use emergency channels instead.
- Submissions are stored and routed securely to the Chairman (or designee) with no unauthorized access.
