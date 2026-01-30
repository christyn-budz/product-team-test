# User Story: [Feature Name]

**As a** [type of user]  
**I want** [goal/desire]  
**So that** [benefit/value]

## Context
[1-2 sentences providing background on why this feature is needed]

## Scenarios

### Happy Path
1. User navigates to [starting point]
2. User performs [action]
3. System responds with [result]
4. User achieves [goal]

### Edge Cases
- What happens if [condition]?
- What happens when [error state]?

## Acceptance Criteria
- [ ] User can [primary action]
- [ ] System validates [key requirement]
- [ ] User receives [feedback/confirmation]
- [ ] [Security/business rule] is enforced

## Key Screens
[List the main screens/pages involved without detailed field specifications]

## Questions
- [ ] [Any unknowns that need clarification]

---

## Example: Password Reset

**As a** registered user  
**I want** to reset my forgotten password  
**So that** I can regain access to my account without contacting support

## Context
Users occasionally forget their passwords and need a self-service way to regain access that doesn't burden our support team.

## Scenarios

### Happy Path
1. User clicks "Forgot password?" on login page
2. User enters their email address
3. System sends reset email with secure link
4. User clicks link and sets new password
5. User is logged in and redirected to dashboard

### Edge Cases
- Non-existent email: Show generic "If email exists, reset sent" message
- Expired link: Show friendly error with option to request new link
- User already logged in: Redirect to account settings

## Acceptance Criteria
- [ ] Reset link accessible from login page
- [ ] Email sent within 2 minutes of request
- [ ] Password requirements clearly shown (8+ chars, mixed case, number)
- [ ] Reset links expire after 24 hours
- [ ] Success confirmation shown after reset
- [ ] Only one active reset link per user at a time

## Key Screens
- Login page (with forgot password link)
- Request reset page (email entry)
- Reset password page (new password entry)
- Success/confirmation page

## Questions
- [ ] Should we notify users when a reset is requested for security?
- [ ] Do we want to implement rate limiting for reset requests?
