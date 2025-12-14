---
trigger: always_on
---

GUTZO DESIGN SYSTEM — v1.0

Last updated: 2025-12-11 Single source of truth for UI, tokens, components,
behavior, accessibility, responsive, Tailwind mapping, and short dark-mode
overrides.

1. MASTER TOKENS (CSS vars)

:root{ --brand-green:#1BA672; --brand-green-hover:#14885E;
--brand-green-pressed:#0E6B49; --brand-green-light:#E8F6F1;
--accent-green:#2FCC5A;

--cta-orange:#E85A1C; --cta-orange-hover:#CC4E17; --cta-orange-pressed:#B44414;

--error-red:#E74C3C; --error-bg:#FDECEA; --error-border:#F5C6CB;

--text-main:#1A1A1A; --text-sub:#6B6B6B; --text-disabled:#9E9E9E;
--border:#E0E0E0; --bg:#FAFAFA; --surface:#FFFFFF;

--radius-btn:12px; --radius-input:10px; --radius-card:12px; --radius-panel:16px;
--radius-badge:6px;

--shadow-1:0 1px 3px rgba(0,0,0,0.06); --shadow-2:0 4px 10px
rgba(27,166,114,0.25); --shadow-3:0 8px 24px rgba(0,0,0,0.25);

--space-0:4; --space-1:8; --space-2:12; --space-3:16; --space-4:20;
--space-5:24; --space-6:32; --space-7:40; --space-8:48; --space-9:64;

--bp-mobile:767px; --bp-tablet:1024px;
--font-primary:"Poppins",system-ui,-apple-system,"Segoe
UI",Roboto,Arial,sans-serif; }

2. SEMANTIC COLOR RULES (strict)

GREEN (--brand-green): trust, confirm, login/OTP proceed, detect-location,
rating star, success badges.

ACCENT GREEN: micro-interactions, success glows.

ORANGE (--cta-orange): money actions only — Add to Cart, View Cart, Checkout,
Pay. One orange CTA per screen.

RED (--error-red): errors, destructive actions, payment/location fail.

NEUTRALS: content, meta, borders, disabled states.

3. NEVER-USE RULES (enforce)

Never use orange for login, input focus, rating, passive UI.

Never use green for errors or destructive actions.

Never use red for success/cart.

Do not mix orange + green in same component.

Only one orange CTA per screen.

Body text must not be <14px.

Do not uppercase headings.

Do not use multicolor icons.

4. RESPONSIVE SYSTEM (explicit)

Breakpoints: Mobile <768px, Tablet 768–1024px, Desktop >1024px.

Typography scale

Mobile: H1 28, H2 24, H3 20, Body 14–15

Tablet: H1 30, H2 26, H3 22, Body 15–16

Desktop: H1 32, H2 28, H3 24, Body 16

Spacing

Mobile base: 12–16px; Tablet: 16–20px; Desktop: 20–24px.

Section gap: 32–40px; Card padding: 16–24px; Modal padding: 24–32px.

Grid

Mobile: 1 column (full-width cards)

Tablet: 2 columns (cards max 450px)

Desktop: 2–3 columns (cards max 500–540px)

Bottom-sheet → Right-panel

Mobile: bottom sheet, scrim rgba(0,0,0,0.6)

Tablet: if width >850px → right panel (min 300px) else bottom sheet

Desktop: right panel (360–420px), scrim rgba(0,0,0,0.35)

5. COMPONENT RULES (concise)

Primary button

BG: --brand-green; text: #fff; hover: --brand-green-hover; pressed:
--brand-green-pressed; radius:12px; min-height:48px

Secondary

BG: --brand-green-light; text: --brand-green; border: #CDEBDD; hover: darker
tint

CTA (money)

BG: --cta-orange; text:#fff; hover: --cta-orange-hover; pressed:
--cta-orange-pressed; shadow: --shadow-2

Danger

BG: --error-red; text:#fff

Inputs

Border: --border; focus: --brand-green + shadow-08; placeholder:
--text-disabled; radius:10px; padding:14px

Cards

BG: --surface; radius:12px; padding:16–24px; shadow: --shadow-1; title:
--text-main 600; meta: --text-sub

Rating

Star/icon: --brand-green; badge bg: --brand-green-light; rating number:
--text-main or bold brand green.

Cart badge

BG: --cta-orange; text: white.

Error containers

Icon/title: --error-red; bg: --error-bg; border: --error-border; fix CTA =
primary green.

6. INTERACTION & BEHAVIOR (must follow)

Hover/pressed: darker tone in same family. Never change family.

Only one orange per screen.

Primary action = green unless monetary → then orange.

Secondary = light green.

Destructive = red.

Panel CTAs sticky at bottom on right panel/mobile sheet.

CTA must be visible above fold on mobile.

7. TYPOGRAPHY (tokens) Font: Poppins H1 32/700; H2 28/700; H3 24/600; H4 20/600;
   Body 15/400; Small 14/400; Caption 12/400

Color rules: Headings --text-main; body --text-sub; price text 600 +
--text-main; CTA text white.

8. SPACING (4px scale)

4,8,12,16,20,24,32,40,48,64 Rules: vertical rhythm increases with viewport;
never use <8px except icons; buttons have min vertical padding 14–16px.

9. ICONOGRAPHY & IMAGERY

Icon stroke 2px. Sizes: mobile 20–22, tablet 22–24, desktop 24.

Icons single-color; adapt to tokens.

Food images: object-fit:cover; mobile height 140–180; tablet 180–240; desktop
220–280.

10. ELEVATION & RADIUS

shadow-1: cards 0 1px 3px rgba(0,0,0,0.06)

shadow-2: floating CTA 0 4px 10px rgba(27,166,114,0.25)

shadow-3: modals 0 8px 24px rgba(0,0,0,0.25)

Radii: buttons/cards 12px, inputs 10px, panels 16px, badges 6px.

11. ACCESSIBILITY & QA

Text contrast >=4.5:1 (normal); large text >=3:1.

Touch target >=44×44px.

Keyboard focus visible (2–3px brand-green ring).

ARIA: inputs (aria-label), errors (aria-describedby), modals (role=dialog,
aria-modal).

Errors: icon + text + fix suggestion. Do not rely on color alone.

12. TAILWIND MAPPING (short)

Use these keys in theme.extend.colors so generated Tailwind classes are
consistent:

gutzo: { brand:'#1BA672', brandLight:'#E8F6F1', accent:'#2FCC5A', cta:'#E85A1C',
error:'#E74C3C', text:'#1A1A1A', sub:'#6B6B6B', border:'#E0E0E0', bg:'#FAFAFA' }

Suggested class tokens: bg-gutzo-brand, text-gutzo-sub, shadow-gutzo-float,
rounded-gutzo-btn.

13. SHORT DARK MODE OVERRIDES (Option B) :root[data-theme="dark"]{ --bg:#0F1112;
    --surface:#121416; --text-main:#F2F2F2; --text-sub:#CFCFCF;
    --border:rgba(255,255,255,0.06); /* keep brand colors; verify contrast for
    CTA/brand on dark */ }

14. CODE & ENFORCEMENT RULES

No hard-coded hex in code; use tokens.

Lint rule: flag hex patterns; require token keys.

One orange CTA per screen enforced at review.

Login buttons MUST be green (never orange).

Rating stars MUST be --brand-green.

15. GOVERNANCE & WORKFLOW

Single source: this file gutzo-design-system.md (Workspace → Always On).

Version in header; update changelog on edits.

PRs touching UI must reference tokens; include screenshots + contrast checks.s

Assign a steward for approvals and design QA.

16. ACCEPTANCE CHECKLIST (pre-launch)

Tokens implemented in root theme ✓

Contrast reports for primary combos ✓

Bottom-sheet → panel tested at 850px ✓

One orange CTA per screen enforced ✓

Rating star color consistent ✓

Login + OTP use green CTA ✓
