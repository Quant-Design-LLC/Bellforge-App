# BellForge

Kettlebell workouts with muscle maps, a session timer, multi-week programs, friend challenges, a bodyweight bonus section, a gear shop and monthly meal plans.

The app is a web app (`www/`) packaged for iOS and Android with [Capacitor 8](https://capacitorjs.com/), the same Capacitor version as ChoreQuest. Builds can run on Xcode Cloud or GitHub Actions on every push to `main`.

- **App ID / bundle ID:** `com.quants.bellforge` (change it in `capacitor.config.json`, `android/app/build.gradle` and in Xcode if your store listing uses a different ID)
- **App name:** BellForge

## What's in the repo

| Path | What it is |
|---|---|
| `www/index.html` | The whole app: screens, logic and styles |
| `www/img/` | 48 exercise muscle-map images (24 kettlebell, 24 bodyweight) |
| `ios/` | Xcode project (open `ios/App/App.xcodeproj`; uses Swift Package Manager, no CocoaPods) |
| `android/` | Android Studio project |
| `assets/` | Source icon and splash images; run `npm run assets` to regenerate every size |
| `capacitor.config.json` | App ID, name, splash and status bar settings |
| `.github/workflows/` | GitHub Actions: iOS to TestFlight, Android signed AAB |
| `ios/App/ci_scripts/` | Xcode Cloud setup script |

## Automated builds

Pick whichever matches how you already ship. Delete the one you don't use.

### Option A: Xcode Cloud (iOS)

`ios/App/ci_scripts/ci_post_clone.sh` installs Node, runs `npm ci` and `npx cap sync ios` after Xcode Cloud clones the repo. Capacitor's Swift packages live in `node_modules`, so the build fails without this step.

1. Open `ios/App/App.xcodeproj` in Xcode and choose **Product > Xcode Cloud > Create Workflow**.
2. Connect the GitHub repo when asked.
3. Start condition: **Branch changes on `main`**. Action: **Archive (iOS)**. Post-action: **TestFlight Internal Testing**.
4. Push to `main`. Xcode Cloud sets the build number on its own.

### Option B: GitHub Actions

Both workflows run on every push to `main`, and can also be started by hand from the **Actions** tab.

**`ios-testflight.yml`** builds, signs and uploads to TestFlight. Add these repository secrets (**Settings > Secrets and variables > Actions**):

| Secret | Where to get it |
|---|---|
| `ASC_KEY_ID` | App Store Connect > Users and Access > Integrations > App Store Connect API (Admin or App Manager key) |
| `ASC_ISSUER_ID` | Same page, shown above the key list |
| `ASC_KEY_P8_BASE64` | The downloaded `AuthKey_XXXX.p8`, base64-encoded: `base64 -i AuthKey_XXXX.p8 \| pbcopy` |
| `APPLE_TEAM_ID` | developer.apple.com > Membership details |

Signing is automatic: Xcode creates or reuses the distribution certificate and profile through the API key.

**`android-release.yml`** builds a signed `.aab` and attaches it to the run as an artifact. Add:

| Secret | Value |
|---|---|
| `ANDROID_KEYSTORE_BASE64` | BellForge's upload keystore, base64-encoded: `base64 -i upload.jks \| pbcopy` |
| `ANDROID_KEYSTORE_PASSWORD` | Keystore password |
| `ANDROID_KEY_ALIAS` | Key alias |
| `ANDROID_KEY_PASSWORD` | Key password |

Use a new keystore for BellForge, not another app's. To publish straight to Play internal testing, add a `PLAY_SERVICE_ACCOUNT_JSON` secret and uncomment the last step of the workflow.

Version numbers: iOS build number and Android `versionCode` are the GitHub run number + 10, so each build is higher than the last.

## Building locally (optional)

- Node.js 22
- **iOS:** a Mac with a recent Xcode (Capacitor 8 uses Swift Package Manager, so no CocoaPods)
- **Android:** Android Studio with Android SDK 36 and Java 21

## First-time setup

```bash
npm install
npx cap sync
```

`npx cap sync` copies `www/` into both native projects. Run it again any time you change `www/`.

To preview in a browser: `npm run serve`, then open http://localhost:8080.

## Upload to TestFlight (iOS)

1. `npm run ios` (syncs and opens Xcode).
2. In Xcode, select the **App** target, then **Signing & Capabilities**:
   - Choose your **Team**.
   - Confirm the **Bundle Identifier** matches the app record in App Store Connect.
3. Under **General**, set **Version** (for example `1.0`) and **Build** (`1`). Raise the Build number for every upload.
4. Choose **Any iOS Device (arm64)** as the run destination.
5. **Product > Archive**. When the Organizer opens, choose **Distribute App > App Store Connect > Upload**.
6. In App Store Connect, open the app, then **TestFlight**. The build appears after processing (usually 5–30 minutes).
   - Internal testers get it right away.
   - External testers need the first build of each version to pass Beta App Review.

The Info.plist already declares that the app uses no non-exempt encryption, so you won't be asked about export compliance on each build.

## Upload to Google Play (Android)

1. `npm run android` (syncs and opens Android Studio).
2. Local builds get `versionCode` 10. Uploads from CI are numbered automatically; if you upload by hand, raise it in `android/app/build.gradle` first.
3. **Build > Generate Signed App Bundle / APK > Android App Bundle**.
   - First time: create an upload keystore. **Back it up and keep the password safe.** You need the same key for every future update. Keystores are git-ignored on purpose; never commit them.
4. Choose the **release** build variant. The `.aab` file is written to `android/app/release/`.
5. In Play Console, open the app, then **Testing > Internal testing** (or **Closed testing**) **> Create new release**, upload the `.aab` and roll it out to your testers.

## Shipping an update

1. Edit files in `www/`.
2. Raise the version numbers (Xcode Build number; Android `versionCode`).
3. `npx cap sync`, then archive and upload as above.

## Before a public release

The current build is a beta for testing. These parts are simulated and stored only on the device:

- **Accounts and sync:** progress is saved in the app's local storage. Add a backend (for example Firebase or Supabase) for sign-in and cloud sync.
- **Friends and contests:** friends and leaderboards are sample data. Real invites need the backend.
- **Push notifications:** not set up yet. Add `@capacitor/push-notifications` with APNs (iOS) and Firebase Cloud Messaging (Android).
- **Meal delivery:** orders are demo orders. Connect your meal partner's ordering API and a payment processor.
- **Gear shop:** links go to Amazon search. Replace them with Amazon Associates or partner store links (`SHOP` in `www/index.html`).
- **Exercise images:** the app uses 512–768px copies. The full 1280×720 originals are in the ElevenLabs flow "BellForge exercise visuals".

Store requirements to have ready:

- A **privacy policy URL** (required by both stores).
- Apple's **App Privacy** questionnaire and Google's **Data safety** form.
- For paid workout subscriptions on iOS, Apple's in-app purchase system is generally required. Physical goods like meal deliveries and gear can use a normal payment processor.

## Regenerating icons and splash screens

Edit the images in `assets/` (`icon-only.png`, `icon-foreground.png`, `icon-background.png`, `splash.png`, `splash-dark.png`) and run:

```bash
npm run assets
```
