⚡ Fast Agil — Queue Management & Appointment App

A mobile application built with FlutterFlow & Firebase to digitize and streamline the queue management system for Agil Energy kiosks across Tunisia.


📱 Overview
Fast Agil replaces physical queues at Agil kiosks with a smart mobile experience. Clients can join a queue remotely, book appointments, and track their position in real time — eliminating waiting time and improving the overall experience.
The 3 Kiosk Services Supported
ServiceDescription🪪 Carte ÉlectroniqueRechargeable electronic card for fuel purchases📒 Carnet de TicketsTicket booklet redeemable for fuel💵 Bon ValeurMonetary voucher usable at the pump

✨ Features

🔐 Authentication — Email-based registration & login (Google auth is also available)
📍 Kiosk Discovery — Locate nearest Agil kiosks with real-time distance calculation
🎟️ Virtual Ticketing — Join a queue and receive a digital ticket with QR code
📅 Appointment Booking — Schedule a visit with date & time slot selection
📊 Live Queue Tracking — Real-time position updates in the queue
🕓 History — Full history of past tickets and appointments
⭐ Feedback — Rate your experience after each visit
👤 Profile Management — Edit profile, change password, upload avatar via Cloudinary


🛠️ Tech Stack
LayerTechnologyFrontendFlutterFlow (No-Code / Flutter)BackendFirebase FirestoreAuthenticationFirebase Phone Auth (OTP)Push NotificationsFirebase Cloud Messaging (FCM)Image StorageCloudinary (unsigned upload preset)Maps & Kiosk DataSerpApi (Google Maps scraping)

🗄️ Database Schema
Collections

users — Client profiles with FCM token
kiosks — All Agil kiosks across Tunisia (imported via SerpApi)
tickets — Virtual queue tickets
appointments — Scheduled visits
notifications — Push notification logs
feedbacks — Post-visit ratings and comments
services — The 3 service types offered


📂 App Structure
Fast Agil/
├── Onboarding          → Splash, Welcome, Register, Login
├── Core Flow
│   ├── Home Dashboard
│   ├── Kiosk List & Detail
│   ├── Service Selection
│   ├── Ticket Confirmation & Queue Tracking
│   └── Appointment Calendar & Confirmation
└── Profile
    ├── Profile & Edit Profile
    ├── Notifications
    ├── Feedback
    └── Settings
    ├── My Tickets
│   └── My Appointments

🚀 Getting Started
Prerequisites

Flutter SDK (stable)
Firebase project configured
FlutterFlow Pro account
Cloudinary account (unsigned preset)

Run Locally
bash git clone https://github.com/louaycodes/fastagil.git
cd fastagil
flutter pub get
flutter run
Firebase Setup

Create a Firebase project
Enable Firestore, Phone Auth, FCM
Download google-services.json and place in android/app/
Download GoogleService-Info.plist and place in ios/Runner/


📊 Kiosk Data Import
Kiosk data was scraped from Google Maps using SerpApi and imported into Firestore via a Node.js script:
bashcd import-agil
npm install firebase-admin
node import.js

🎨 Brand Colors
ColorHexUsageAgil Yellow#F5A800Primary, buttons, accentsNavy Blue#003B7ASecondary, textWhite#FFFFFFBackgroundDark#1A1A1AText primary

👨‍💻 Developer
Louay Zorai — Cloud Architectures Engineering Student @ ESPRIT, Tunisia

📄 License
This project was developed as part of an academic internship project. All rights reserved.