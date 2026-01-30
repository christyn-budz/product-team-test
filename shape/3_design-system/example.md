# Design Decisions

> **Note:** This is an example template with sample values. Replace these colors, fonts, and specifications with your project's actual design decisions.

A concise guide to the application's visual style. Use these decisions consistently throughout the interface.

## Color Palette

**Primary Colors:**
- Brand Primary: `#4A7AFF` - Main brand color, primary buttons
- Brand Secondary: `#6C47FF` - Secondary actions, highlights

**Neutral Colors:**
- Black: `#000000` - Headings, text, icons
- Dark Gray: `#333333` - Primary text
- Medium Gray: `#666666` - Secondary text
- Light Gray: `#CCCCCC` - Borders, dividers
- Off-White: `#F5F5F5` - Backgrounds, cards
- White: `#FFFFFF` - Page backgrounds

**Semantic Colors:**
- Success: `#4CAF50` - Confirmations, success states
- Warning: `#FF9800` - Warnings, caution states
- Error: `#F44336` - Errors, destructive actions
- Info: `#2196F3` - Information, help text

## Typography

**Font Family:** Inter (with system fallbacks)

**Text Styles:**
- H1: 32px (2rem), bold (700), page titles
- H2: 24px (1.5rem), bold (700), section headings
- H3: 20px (1.25rem), semibold (600), subsection headings
- Body: 16px (1rem), regular (400), main content
- Small: 14px (0.875rem), regular (400), secondary text
- Button: 16px (1rem), medium (500), button labels

## Spacing

- XS: 4px (0.25rem) - Minimal spacing, icons
- Small: 8px (0.5rem) - Tight spacing, compact elements
- Medium: 16px (1rem) - Standard spacing, form fields
- Large: 24px (1.5rem) - Section padding, card padding
- XL: 32px (2rem) - Section margins, page padding
- 2XL: 48px (3rem) - Large separations

## Border Radius

- None: 0 - Tables, alerts
- Small: 4px (0.25rem) - Inputs, buttons
- Medium: 8px (0.5rem) - Cards, modals
- Large: 16px (1rem) - Feature cards, profile images
- Full: 9999px - Pills, badges, avatars

## Key Components

**Buttons:**
- Primary: Brand Primary background, white text, small radius
- Secondary: White background, Brand Primary text and border
- Danger: Error color background, white text
- Text: No background, Brand Primary text, no border

**Inputs:**
- White background, Medium Gray border (1px)
- Small radius, black text
- Focus: Brand Primary border (2px)

**Cards:**
- White background, medium radius
- Optional Light Gray border, large padding
- Medium shadow (0 4px 6px rgba(0, 0, 0, 0.1))

**Navigation:**
- Desktop: Horizontal navbar with Brand Primary highlights
- Mobile: Hamburger menu with slide-out drawer

## Accessibility

- Text contrast ratio: 4.5:1 minimum
- Clear focus states on interactive elements
- Support text resizing to 200%

## Technical Stack

- CSS Framework: Tailwind CSS
- Interactive Components: Flowbite
