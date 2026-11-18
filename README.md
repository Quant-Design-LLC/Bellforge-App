# BellForge

Kettlebell workouts with muscle maps, a session timer, multi-week programs, friend challenges, a bodyweight bonus section, a gear shop and monthly meal plans.

The app is a web app (`www/`) packaged for iOS and Android with [Capacitor 8](https://capacitorjs.com/), the same Capacitor version as ChoreQuest. iOS builds run on GitHub Actions (started manually) and upload to TestFlight.

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

### iOS: GitHub Actions to TestFlight (same setup as ChoreQuest)

`.github/workflows/ios-testflight.yml` builds, signs and uploads to TestFlight. It runs only when you start it:
**GitHub > Actions > "iOS Build + TestFlight" > Run workflow**.

Signing uses fastlane match with the shared `Quant-Design-LLC/upkeepiq-match` repo (`fastlane/Fastfile`,
`fastlane/Matchfile`), exactly like ChoreQuest. The version comes from `package.json`; the build number is the
workflow run number.

Repository secrets (**Settings > Secrets and variables > Actions**), same names and values as ChoreQuest:

| Secret | What it is |
|---|---|
| `APPSTORE_API_KEY_P8` | Full text of the App Store Connect API key `.p8` file, including the BEGIN/END lines |
| `APPSTORE_API_KEY_ID` | The key's ID |
| `APPSTORE_API_ISSUER_ID` | Issuer ID (App Store Connect > Users and Access > Integrations) |
| `APPSTORE_TEAM_ID` | `F9GFFNU83K` |
| `MATCH_PASSWORD` | Passphrase for the match repo |
| `MATCH_GIT_TOKEN` | GitHub token with access to `upkeepiq-match` (or set `MATCH_GIT_URL` to the full URL with token) |

One-time Apple setup: register the bundle ID `com.quants.bellforge` (developer.apple.com > Identifiers) and
create the app in App Store Connect with that bundle ID. After the first successful run, set `readonly: true`
in `fastlane/Fastfile`.

### Android: GitHub Actions (optional)

`android-release.yml` builds a signed AAB when started manually. Local builds from Android Studio are the usual path.

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
2. Raise the version numbers: in `android/app/build.gradle`, add 1 to `bfLocalVersion` (Play rejects a number it has already seen). iOS build numbers are set by the workflow.
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

## Accounts (Supabase)

Accounts, friends, shared challenges and cloud backup use the Supabase project
`kwxwcuvsaldmebqfxwxy` (URL and publishable key are in `www/index.html`; the publishable key is
safe to ship in the app). Never put the service_role / secret key in this repo.

- Database setup: paste `supabase/schema.sql` into Supabase > SQL Editor and run it. It is safe to run again.
- Authentication > Sign In / Providers > Email: keep Email enabled and turn **Confirm email off** until
  custom SMTP is set up (Supabase's built-in email only sends to your own team).
- The Supabase JS client is bundled at `www/vendor/supabase.js` (v2.119.0), so the app needs no CDN.
- Meal plan inputs are never uploaded; the backup excludes them.
