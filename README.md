# 🛠️ FixMyDevice - صلّحي جهازي

<p align="center">
  <b>A Modern, Cross-Platform Home Appliance Maintenance Application UI/UX built with Flutter & Dart.</b>
</p>

---

## 📱 About The Project

**FixMyDevice** is a comprehensive, production-ready on-demand mobile application concept tailored for booking home appliance repair services (Air Conditioners, Washing Machines, Refrigerators, Stoves, Screens, and Small Devices). 

Designed with a clean, modern aesthetic inspired by top-tier Figma UI kits, the application delivers an intuitive Arabic-first (RTL) experience with seamless booking steps, transparent cost estimations, and real-time order tracking.

---

## ✨ Key Features & User Flow

- **🚀 Seamless Onboarding & Auth**: Interactive onboarding carousel with Arabic typography (Zain Font) and smooth authentication flow (Phone login & OTP verification).
- **🏠 Intuitive Home Dashboard**:
  - Dynamic location display (Sheikh Zayed, Giza).
  - Search bar for quick appliance & issue filtering.
  - Promotional discount banners with coupon redemption (`SUMMER25`).
  - Appliance category grid with clean visual hierarchy.
  - Emergency 60-minute visit request banner.
- **📅 4-Step Booking Journey**:
  1. **Appliance & Brand Selection**: Choose subtypes (e.g., Split, Window) and top brands (LG, Carrier, Sharp, Samsung, Tornado) with optional model/capacity input.
  2. **Fault Details & Media Upload**: Select common issues, write extra fault details, and attach audio notes or device photos.
  3. **Schedule & Location**: Toggle between Scheduled vs. Emergency visits, pick appointment dates, select time slots, and verify the service address.
  4. **Checkout & Bill Summary**: Transparent cost breakdown (inspection fees, applied coupons, net total) and flexible payment selection (Cash on visit, Credit Cards, Vodafone Cash / InstaPay).
- **📍 Real-Time Order Tracking**: 5-step status stepper (Confirmed ➔ Tech Assigned ➔ On the Way ➔ Repairing ➔ Completed) with direct call/chat technician access.
- **⭐ Technician Rating & Feedback**: Multi-criteria star rating, pre-defined compliment tags, and written feedback.
- **📦 Order Management**: Dual-tabbed view separating active ongoing repairs from past completed service history.
- **👤 User Profile & Settings**: Clean profile dashboard for managing saved addresses, previous receipts, and application preferences.

---

## 🎨 Design & Architecture Highlights

- **Arabic-First UX**: Full RTL layout with typography powered by **Google Fonts (Zain)**.
- **Modular Structure**: Feature-first, clean folder architecture ready for API integration and state management scaling (BLoC / Cubit).
- **Design Tokens**: Centralized color palette featuring deep primary blues (`#1E40AF`), clean surfaces, and clear visual contrast.

---

## 🗂️ Project Structure

```text
lib/
├── core/
│   └── theme/               # Color tokens, styles & theme configurations
├── features/
│   ├── splash/              # Splash screen
│   ├── onboarding/          # Walkthrough pages
│   ├── auth/                # Login & OTP screens
│   ├── home/                # Home dashboard & categories
│   ├── booking/             # 4-Step booking & fault flows
│   ├── orders/              # Active & past order management
│   ├── chat/                # Direct technician communication
│   ├── main_layout/         # Persistent bottom navigation shell
│   └── profile/             # Profile management
└── main.dart                # Entry point & localization setup
