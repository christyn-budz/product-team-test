---
description: Generate PRD following Nova process structure with feature-focused approach
globs:
  - "shape/1_big-picture/**"
alwaysApply: false
---
# Rule: Generating a Product Requirements Document (PRD)

## Goal

To guide an AI assistant in creating a detailed Product Requirements Document (PRD) in Markdown format following the Nova process structure. The PRD should be clear, actionable, and suitable for guiding the creation of user stories and epics.

## Process

1. **Receive Initial Prompt:** The user provides a brief description or request for a new product or major enhancement.
2. **Ask Clarifying Questions:** Before writing the PRD, the AI *must* ask clarifying questions to gather sufficient detail. The goal is to understand the product vision, objectives, and feature priorities. Make sure to provide options in letter/number lists so the user can respond easily with selections.
3. **Generate PRD:** Based on the initial prompt and the user's answers to the clarifying questions, generate a PRD using the structure outlined below.
4. **Save PRD:** Save the generated document as `prd.md` inside the `shape/1_big-picture/` directory (replacing any existing PRD).

## Clarifying Questions (Examples)

The AI should adapt its questions based on the prompt, but here are key areas to explore:

### Product Vision
- **Problem Statement:** "What specific problem does this product solve? Who experiences this problem?"
- **Market Opportunity:** "What gap in the market does this address?"
- **Success Vision:** "What does success look like for this product in 6-12 months?"

### Business Objectives
- **Primary Goals:** "What are the top 3-5 measurable business objectives? (e.g., revenue targets, user acquisition, operational efficiency)"
- **Key Metrics:** "How will we measure success? What KPIs matter most?"
- **Timeline:** "What's the target timeline for MVP and subsequent phases?"

### Users & Personas
- **Primary Users:** "Who is the primary target user? What are their characteristics, needs, and pain points?"
- **Secondary Users:** "Are there other user types we need to consider? (e.g., admins, support staff)"
- **User Journey:** "What's the typical user journey from discovery to value realization?"

### Feature Prioritization
- **Core Features:** "What are the absolute must-have features for MVP?"
- **Nice-to-Have Features:** "What features would enhance the product but aren't critical for launch?"
- **Future Enhancements:** "What features should we plan for in future phases?"
- **Feature Dependencies:** "Are there features that depend on each other?"

### Technical & Operational
- **Integrations:** "What external systems or APIs need to be integrated?"
- **Constraints:** "Are there technical, regulatory, or business constraints we must consider?"
- **Budget/Resources:** "What's the budget and team size for this project?"

### Scope Management
- **Out of Scope:** "What functionality should we explicitly NOT include in the initial release?"
- **Phase 2 Features:** "What features should we defer to a second phase?"
- **Non-Goals:** "What are we consciously choosing not to do and why?"

## PRD Structure

The generated PRD must follow this exact structure:

```markdown
# Product Requirements Document - [Product Name]

## Brief Product Overview
[Concise description of the product and the problem it solves for users and the business - 3-5 sentences that capture the essence]

## Objectives
1. **[Primary Objective]**: [Specific, measurable outcome with target metric]
2. **[Secondary Objective]**: [Specific, measurable outcome with target metric]
3. **[Additional Objectives]**: [Continue as needed, typically 3-5 total]

## End Users
- **Primary User Persona**: [Name]
  - [Detailed description including demographics, needs, pain points, technical comfort level]
  - [Key behaviors and preferences]
  - [What they value most in a solution]

- **Secondary User Persona**: [Name]
  - [Similar detailed description]
  - [How their needs differ from primary users]

- **Tertiary User Persona**: [If applicable]
  - [Brief description of occasional or edge-case users]

## Approach Overview
[Description of the product approach, core functionality flow, and how it will solve the stated problem. Include high-level architecture decisions, key user workflows, and differentiation from existing solutions. This should be 1-2 paragraphs.]

## Feature List

### [Number]. **[Feature Name]**
   - Description: [Detailed description of what this feature does and how it works - be specific about functionality]
   - Priority: [High/Medium/Low]
   - Why it matters: [Business value and user benefit - connect to objectives]

[Continue for all features, numbered sequentially. Group related features together. For complex features, include sub-points describing specific capabilities.]

## Technical Requirements

### Core Infrastructure
- **Application Framework**: [e.g., Ruby on Rails, Next.js, Django]
- **Authentication**: [Specific approach, e.g., Devise, NextAuth, Auth0]
- **Database**: [e.g., PostgreSQL, MySQL, MongoDB]
- **Hosting**: [e.g., Heroku, AWS, Vercel, GCP]
- **File Storage**: [e.g., Amazon S3, GCS, Cloudinary]
- **Payment Processing**: [If applicable, e.g., Stripe, PayPal]
- **[Other Infrastructure]**: [As needed]

### Frontend Stack
- **Templating/Framework**: [e.g., ERB, React, Vue, Svelte]
- **JavaScript**: [e.g., Stimulus, vanilla JS, TypeScript]
- **CSS Framework**: [e.g., Tailwind CSS, Bootstrap, custom]
- **Component Library**: [e.g., Flowbite, shadcn/ui, MUI]
- **Mobile**: [Responsive design approach or native app]

### Backend Integrations
- **[Integration Name]**: [Purpose and brief description]
- **Email**: [e.g., SendGrid, Postmark, AWS SES]
- **[Other APIs]**: [List all external APIs with purpose]

### Security & Compliance
- **Data Protection**: [Encryption, access controls]
- **Compliance**: [Any regulatory requirements, e.g., HIPAA, GDPR, SOC 2]
- **Authentication**: [Session management approach]

## Success Metrics
- **[Metric Category]**: [Specific metric with target, e.g., "Digital self-service adoption: 60% of interactions"]
- **[Metric Category]**: [Another metric with target]
- [Continue with 3-5 key metrics tied to objectives]

## Constraints & Assumptions
- **Timeline**: [Development timeline and key milestones]
- **Budget**: [Budget constraints if applicable]
- **Team**: [Team structure and resources]
- **Technical**: [Any technical constraints]
- **Business**: [Business constraints or dependencies]

## Risk Mitigation
- **[Risk Type]**: [Description and mitigation strategy]
- **[Risk Type]**: [Description and mitigation strategy]
- [Include 3-5 key risks with mitigation plans]

## Stretch Goals / Future Enhancements
- **[Feature Name]**: [Description of future feature and why it's deferred]
- **[Feature Name]**: [Another future enhancement]
- [List features explicitly planned for Phase 2 or beyond]
```

## Important Notes

1. **User Stories**: Do NOT include detailed user stories in the PRD. User stories will be created separately in `shape/4_user-stories/` based on the features defined in the PRD.

2. **Feature Focus**: The feature list is the heart of the PRD. Each feature should be described with enough detail to understand its purpose and value, but not implementation specifics.

3. **Measurable Objectives**: All objectives should include specific, measurable targets where possible.

4. **Technical Decisions**: Include high-level technical decisions that impact the product approach, but avoid implementation details.

5. **Living Document**: The PRD may be updated as the product evolves, but major changes should be tracked.

## Output

- **Format**: Markdown (`.md`)
- **Location**: `shape/1_big-picture/`
- **Filename**: `prd.md`

## Final Instructions

1. Always start with clarifying questions to understand the full scope
2. Focus on the "what" and "why", not the "how" (implementation details)
3. Ensure all features connect back to stated objectives
4. Keep descriptions clear and concise for all stakeholders
5. After generating the PRD, remind the user that user stories should be created next in `shape/4_user-stories/`
