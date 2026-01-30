# Application Page Flow

This document provides a visual representation of the application's pages and the navigation paths between them.

## Main Page Navigation

```mermaid
flowchart TD
    HomePage --> LoginPage
    HomePage --> SignupPage
    HomePage --> AboutPage
    HomePage --> FeaturesPage
    
    LoginPage --> DashboardPage
    SignupPage --> VerificationPage
    VerificationPage --> DashboardPage
    
    DashboardPage --> ProfilePage
    DashboardPage --> SettingsPage
    DashboardPage --> ProjectsPage
    
    ProjectsPage --> ProjectDetailPage
    ProjectDetailPage --> TasksPage
    ProjectDetailPage --> TeamPage
    ProjectDetailPage --> DocumentsPage
```

## User Authentication Flow

```mermaid
flowchart TD
    HomePage --> LoginPage
    LoginPage --> DashboardPage
    LoginPage --> ForgotPasswordPage
    ForgotPasswordPage --> ResetPasswordPage
    ResetPasswordPage --> LoginPage
    
    HomePage --> SignupPage
    SignupPage --> VerificationPage
    VerificationPage --> CompleteProfilePage
    CompleteProfilePage --> DashboardPage
```

## Account Management Flow

```mermaid
flowchart TD
    DashboardPage --> ProfilePage
    ProfilePage --> EditProfilePage
    
    DashboardPage --> SettingsPage
    SettingsPage --> SecurityPage
    SettingsPage --> NotificationsPage
    SettingsPage --> BillingPage
    
    SecurityPage --> ChangePasswordPage
    BillingPage --> PaymentMethodsPage
    BillingPage --> SubscriptionPage
```

## Notes

- This flowchart represents the primary pages and navigation paths in the application
- Focus on page-to-page transitions rather than detailed component interactions
- Update this flowchart whenever new pages are added or navigation paths change

## Best Practices

- Keep page navigation intuitive and consistent
- Minimize the number of clicks to reach important pages
- Ensure users can easily navigate back to key pages (like Dashboard)
- Use clear and descriptive page names in both the diagram and application
