# Outstanding Questions

This document tracks all outstanding questions from user stories across all epics. Use this as a living document to capture decisions, track open questions, and ensure nothing falls through the cracks.

---

## How to Use This Template

1. **Organize by Epic** — Group questions under their parent epic for easy navigation
2. **Include User Story Context** — Always reference the user story so readers understand the context
3. **Track Resolution Status** — Use checkboxes to mark resolved vs. outstanding items
4. **Document Decisions** — When questions are resolved, record the decision with `→ **Answer**`
5. **Tag Question Types** — Use `[Technical]`, `[Business]`, `[Design]`, `[Security]` prefixes for categorization
6. **Update Regularly** — Review and update this document after each stakeholder meeting

---

## [Epic Name]

---

### [User Story Title]

**User Story:** As a [user type], I want to [action] so that [benefit].

**Resolved:**
- [x] [Question that was answered] → **[Decision/Answer]**
- [x] [Another resolved question] → **[Decision/Answer]**

**Outstanding Questions:**
- [ ] [Open question requiring stakeholder input]
- [ ] [Technical] [Technical question requiring architecture decision]
- [ ] [Business] [Business logic question]
- [ ] [Design] [UX/UI question]
- [ ] [Security] [Security-related question]

---

## Example: Authentication Epic

---

### User Login

**User Story:** As a registered user, I want to log into the application so that I can access my personalized content and features.

**Resolved:**
- [x] What authentication method should we use? → **Magic link (passwordless) authentication**
- [x] What should be the magic link expiration time? → **30 minutes**
- [x] Should we support "remember me" functionality? → **No, security requirements prohibit persistent sessions**

**Outstanding Questions:**
- [ ] [Security] Is MFA required? If so, what factors are acceptable (SMS, authenticator app, email)?
- [ ] [Technical] What rate limiting should be applied to login attempts?
- [ ] [Business] How should we handle users who request access but are on a deny list?

---

### User Registration

**User Story:** As a new user, I want to request access to the application so that I can create an account and use the platform.

**Resolved:**
- [x] What fields are required for registration? → **First Name, Last Name, Email, Phone, Organization**
- [x] Should registration require approval? → **Yes, manual review by admin team**
- [x] What happens to duplicate registration requests? → **Show generic confirmation, admin handles manually**

**Outstanding Questions:**
- [ ] [Technical] What field validations are required (character limits, format validation)?
- [ ] [Business] What is the expected turnaround time for approval?
- [ ] [Design] Should users see their approval status on the registration confirmation page?

---

### Session Management

**User Story:** As an authenticated user, I want my session to be managed securely so that my account is protected from unauthorized access.

**Resolved:**
- [x] Session timeout duration? → **10 minutes of inactivity for standard users, 30 minutes for admin users**
- [x] Should users be warned before session timeout? → **Yes, 2-minute warning modal**

**Outstanding Questions:**
- [ ] [Technical] How should we handle in-progress form submissions when session expires?
- [ ] [Security] Should we invalidate all sessions when password is changed?

---

## Example: Dashboard Epic

---

### Home Page

**User Story:** As a logged-in user, I want to see a personalized dashboard so that I can quickly access relevant information and actions.

**Resolved:**
- [x] What widgets should appear on the dashboard? → **Recent activity, quick actions, notifications**
- [x] Should dashboard be customizable? → **Not in v1, consider for future release**

**Outstanding Questions:**
- [ ] [Design] How many items should display in each widget before pagination/scrolling?
- [ ] [Business] What defines "recent" activity? (last 7 days, last 30 days, last N items?)
- [ ] [Technical] What is the expected data load? (affects caching and performance strategy)

---

### Notifications Banner

**User Story:** As a user, I want to see important announcements in a banner so that I stay informed about system updates and important information.

**Resolved:**
- [x] Where should banners appear? → **Top of dashboard, persistent until dismissed**

**Outstanding Questions:**
- [ ] [Business] Can there be multiple active banners simultaneously?
- [ ] [Business] Who can create/manage banners? (admin only, or content editors?)
- [ ] [Design] Should banners support rich content (links, buttons) or text only?
- [ ] [Technical] Should banner dismissal be persisted per user?

---

## Question Categories Reference

| Tag | Description | Typical Stakeholder |
|-----|-------------|---------------------|
| `[Technical]` | Architecture, implementation, performance questions | Engineering Lead |
| `[Business]` | Business logic, workflows, rules questions | Product Owner |
| `[Design]` | UX/UI, interaction, visual design questions | Design Lead |
| `[Security]` | Authentication, authorization, compliance questions | Security Team |
| `[Integration]` | Third-party services, APIs, data sync questions | Technical Lead |
| `[Data]` | Data modeling, storage, migration questions | Data Architect |

---

## Tips for Managing Outstanding Questions

1. **Don't let questions block progress** — Document them and continue with assumptions when possible
2. **Assign owners** — Add `@name` mentions or owner columns for accountability
3. **Set deadlines** — Questions blocking implementation should have target resolution dates
4. **Escalate blockers** — If a question blocks multiple stories, escalate to stakeholders immediately
5. **Review in standups** — Use this document as a reference in planning and standup meetings
6. **Archive resolved epics** — Once an epic is complete, consider moving resolved questions to an archive section
