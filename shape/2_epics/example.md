# Epic: [Epic Name]

**Epic ID:** [3-letter ID, e.g., ATH]

## Description
[Copy the description from the PRD feature. This should be the detailed description of what this feature does and how it works.]

## Why It Matters
[Copy the "Why it matters" section from the PRD feature. Expand to include high-level context about the epic's scope, how user stories work together, and any important integration or architectural considerations.]

## User Stories

| ID | Story Name | Description |
|----|------------|-------------|
| [[EPIC_ID]-01]([epic_id]_01_story_name.md) | [Story Name] | [Brief description] |
| [[EPIC_ID]-02]([epic_id]_02_story_name.md) | [Story Name] | [Brief description] |

## What's Not Included

- [Items visually/structurally part of this feature but explicitly excluded from scope]
- [Future enhancements deferred to later phases]

## Related Epics

- [Epic Name](../[epic-name]/epic_details.md): [Brief description of relationship]

## PRD Reference

This epic corresponds to **[Feature [Number]: [Feature Name]](../../1_big-picture/prd.md#feature-[number]-[feature-name-kebab-case])** from the PRD.

---

## Example: User Authentication

# Epic: User Authentication

**Epic ID:** ATH

## Description
A secure authentication system that allows users to register, log in, and manage their credentials. The system supports email/password authentication with optional social login providers (Google, GitHub). All authentication flows include proper security measures including rate limiting, secure password storage, and session management.

## Why It Matters
Authentication is the foundation of user identity and security for the application. Without secure authentication, we cannot provide personalized experiences, protect user data, or implement role-based access control. This epic establishes the core identity patterns that all other features will depend on, including session handling and user context that powers dashboards, settings, and collaborative features.

## User Stories

| ID | Story Name | Description |
|----|------------|-------------|
| [ATH-01](ath_01_user_registration.md) | User Registration | New users can create an account with email and password |
| [ATH-02](ath_02_user_login.md) | User Login | Existing users can log in with their credentials |
| [ATH-03](ath_03_password_reset.md) | Password Reset | Users can reset forgotten passwords via email |
| [ATH-04](ath_04_social_login.md) | Social Login | Users can authenticate using Google or GitHub |
| [ATH-05](ath_05_session_management.md) | Session Management | System manages user sessions with proper timeout and refresh |
| [ATH-06](ath_06_email_verification.md) | Email Verification | New users verify their email address before full access |

## What's Not Included

- Two-factor authentication (2FA) - Planned for Phase 2
- Single sign-on (SSO) for enterprise customers - Separate enterprise epic
- Admin user management - Covered in Admin Portal epic

## Related Epics

- [User Profile](../user-profile/epic_details.md): Depends on authentication for user identity
- [Admin Portal](../admin-portal/epic_details.md): Requires authentication for admin access control
- [Notifications](../notifications/epic_details.md): Uses authenticated user context for delivery preferences

## PRD Reference

This epic corresponds to **[Feature 1: User Authentication](../../1_big-picture/prd.md#feature-1-user-authentication)** from the PRD.
