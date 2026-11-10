# Gurubara Construction App — PIN-only Firebase setup

Project: `gurubaraexpense` · Region: `asia-south1`

## What this update changes
- Replaces email/password login with an individual **4-digit PIN**.
- Every person has a separate Firebase Authentication identity (custom-token sign-in), so entries are attributed to the actual user UID.
- Owner creates staff users and assigns permissions from the app.
- Supervisor: exactly one site (Polachery OR Kundrathur).
- Accountant: both sites and weekly payments.
- Owner: both sites, dashboard, payments and user management.
- PIN lookup/verifier data is server-only in `pinCredentials`; the browser never reads it.
- PINs are HMAC-indexed and salted scrypt hashes; backend checks PINs and limits repeated login attempts.
- Owner can disable/enable staff accounts.

## Important before deployment
The configured PINs are 4 digits as requested. Owner and accountant have separate PINs. Both supervisors share one PIN; choose the assigned site on the login screen. This allows separate site profiles but cannot prove which person physically entered the PIN. Four-digit PINs are weaker than six-digit PINs. Never put PINs or setup secrets into `index.html`, GitHub, or Vercel environment variables. This app has not been deployed to your Firebase/Vercel accounts by this package operation.

## One-time Firebase setup
1. Open Firebase Console → project `gurubaraexpense`.
2. Confirm Firestore Database exists and Authentication is enabled. The app uses Firebase custom-token authentication; no email/password provider is needed.
3. Install Node.js 20 and Firebase CLI on your computer:
   ```bash
   npm install -g firebase-tools
   firebase login
   ```
4. Open a terminal in this project folder and set two backend secrets. Use long random values, not any staff PIN:
   ```bash
   firebase functions:secrets:set PIN_PEPPER
   firebase functions:secrets:set OWNER_BOOTSTRAP_SECRET
   ```
   Save the `OWNER_BOOTSTRAP_SECRET` privately; you will enter it once on the temporary bootstrap page. Never share it with staff.
5. Install and deploy backend functions plus Firestore rules:
   ```bash
   cd functions
   npm install
   cd ..
   firebase deploy --only functions,firestore:rules
   ```
   Cloud Functions deployment may require the Firebase project to be on the Blaze billing plan. Review Firebase's current billing requirements before deploying.
6. Temporarily host `bootstrap.html` and open `/bootstrap.html`. Enter the owner's display name, a new unique 6-digit owner PIN, and the one-time `OWNER_BOOTSTRAP_SECRET`.
7. After the page confirms owner creation, **delete `bootstrap.html` from the deployed website and project**. The bootstrap function also refuses to create a second owner.
8. Deploy `index.html` as the Vercel website root (Framework preset: Other; Build command blank; Output directory `.`). Keep `functions/`, `firestore.rules`, and `firebase.json` in your local project for future backend maintenance; do not expose `functions` source as public website content.
9. Open the website and sign in with the owner's PIN. In User management, create the accountant account using the accountant PIN. Create two supervisor accounts: one assigned to Polachery and one assigned to Kundrathur. Use the same supervisor PIN for both. The supervisors must choose their own site on the login screen.

## Vercel upload
- Extract the project ZIP.
- For Vercel, import the extracted `gurubara_firebase_app` folder as the project root. Set Framework Preset to **Other**, Build Command empty, Output Directory `.`.
- Before final production deployment, remove `bootstrap.html` after the owner is created.
- Deploy the Firebase backend and rules separately with the Firebase CLI commands above. Uploading to Vercel alone does not configure Firebase Functions or Firestore rules.

## Collections
- `users`: non-secret role/site profile and display name.
- `pinCredentials`: backend-only PIN lookup hash and salted verifier.
- `pinLoginLimits`: backend-only login throttling state.
- `attendance`, `materials`, `subcontractorStages`, `payments`, `expenses`: shared business records with `siteId`, `createdBy`, and timestamps.

## Existing data
This package uses the collections above. Records stored by the older app in `daily_expenses` / `daily_attendance` are not automatically migrated. Keep a backup before replacing the old deployment; ask for a migration if you need those records carried forward.

## Requested PIN assignment
- Owner: `0000` (set on the one-time bootstrap page).
- Accountant: `1111` (create the accountant account from Owner → User management).
- Supervisor: `9786` (create two separate supervisor profiles, one per site, using this same PIN).

Security note: because both supervisors share `9786`, the selected site determines the profile, but the system cannot reliably distinguish the two people if they share the PIN. Use separate PINs if individual accountability is required.
