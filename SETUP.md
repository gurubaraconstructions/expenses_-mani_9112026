# Gurubara Construction App — Owner-only password login

Firebase project: `gurubaraexpense`  
Functions region: `asia-south1`  
Website hosting: Vercel (standalone HTML; WordPress is not required)

## Login behavior

- Only the **owner** can sign in.
- Initial owner password: **978666**.
- After signing in, open **Change owner password** to set a new password.
- Supervisors and accountant do not have separate logins in this version. The owner operates the app and records both sites' information.
- Owner can access Polachery and Kundrathur.
- Passwords are verified by Firebase Cloud Functions and stored as salted password hashes. The password is not stored in the HTML or Firestore as plain text.

## Important: deploying the app

Uploading the website to Vercel alone does not deploy Firebase Functions or Firestore rules. The login will not work until the Firebase backend and rules are deployed and the owner has been created/reset.

### 1. Prepare Firebase

1. Open Firebase Console and select project `gurubaraexpense`.
2. Confirm Firestore Database exists.
3. Install Node.js 20 and Firebase CLI if not already installed:
   ```bash
   npm install -g firebase-tools
   firebase login
   ```
4. Open a terminal in this project folder. Confirm `.firebaserc` points to `gurubaraexpense`.
5. Set backend secrets (use private random values; never publish them):
   ```bash
   firebase functions:secrets:set PIN_PEPPER
   firebase functions:secrets:set OWNER_BOOTSTRAP_SECRET
   ```
   Save the `OWNER_BOOTSTRAP_SECRET` privately. You must enter it in the temporary owner setup page.
6. Deploy the backend and Firestore security rules:
   ```bash
   cd functions
   npm install
   cd ..
   firebase deploy --only functions,firestore:rules
   ```
   Cloud Functions deployment may require Firebase's Blaze billing plan. Review billing before enabling it.

### 2. Create or reset the owner password

1. Temporarily deploy the project website including `bootstrap.html`.
2. Open `https://YOUR-VERCEL-DOMAIN/bootstrap.html`.
3. Enter the owner display name, the initial password `978666`, and the `OWNER_BOOTSTRAP_SECRET` created above.
4. The page creates the owner if no owner exists. If an owner already exists, it securely resets that owner's password using the setup secret.
5. After success, remove `bootstrap.html` from the website/project and redeploy. Do not leave the bootstrap page public.

### 3. Deploy the main app to Vercel

1. Import the `gurubara_firebase_app` folder into Vercel as a project.
2. Framework Preset: **Other**.
3. Build Command: leave blank.
4. Output Directory: `.`.
5. Deploy `index.html` as the website home page.
6. Open the website and sign in with the owner password `978666` (unless changed in bootstrap setup).
7. Use **Change owner password** in the app to change it. Keep the new password private.

## Security and staff access

This build intentionally disables supervisor/accountant PIN login. Firestore rules allow only the authenticated owner to access app records. If staff need to enter data from their own phones, this owner-only configuration must be changed to individual staff identities and site-based permissions; do not share the owner's password.

## Existing data

This build uses the collections `attendance`, `materials`, `subcontractorStages`, `payments`, and `expenses`. Older collections such as `daily_expenses` and `daily_attendance` are not automatically migrated. Back up existing data before changing production rules or replacing the live site.
