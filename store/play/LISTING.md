# BellForge: Google Play open testing

Everything Play Console asks for to publish BellForge as a public beta (Open testing), written for search, plus the App Store version and a plan for growing search ranking. Copy each section into the matching Play Console page.

---

## 1. Store listing (Grow users > Store presence > Main store listing)

Written for search. Google Play ranks apps using the **title, short description and full description**, so the main search terms appear in all three, worded naturally. Google penalizes keyword stuffing.

**Target search terms**
- **Primary:** kettlebell workout, kettlebell workouts, kettlebell
- **Secondary:** home workout, kettlebell workout plan, workout timer, strength training
- **Long-tail (less competition, where a new app can rank):** kettlebell muscle map, HIIT timer, EMOM, AMRAP, kettlebell swing, Turkish get-up, kettlebell challenge, fitness challenge with friends, beginner kettlebell, calisthenics, bodyweight workout, meal plan

**App name** (30 max, the strongest ranking signal)
```
BellForge: Kettlebell Workouts
```

**Short description** (80 max, the second strongest signal)
```
Kettlebell home workouts with muscle maps, a HIIT timer & fitness challenges
```

**Full description** (4,000 max, fully indexed on Google Play)
```
KETTLEBELL WORKOUTS FOR HOME, WITH A MUSCLE MAP FOR EVERY EXERCISE

BellForge is a kettlebell workout app for strength training at home or in the gym. Follow a kettlebell workout plan, time every session with a built-in HIIT timer, see exactly which muscles each move works, and stay accountable with fitness challenges you do with friends.

MUSCLE MAP FOR EVERY EXERCISE
Every kettlebell exercise comes with a muscle map that highlights the primary and supporting muscles worked, plus form cues and the most common mistakes to avoid. Learn the kettlebell swing, goblet squat, deadlift, clean, press, snatch, Turkish get-up, windmill and more: 50 moves with clear muscle maps.

200 KETTLEBELL WORKOUTS, BEGINNER TO ADVANCED
Beginner kettlebell workouts, intermediate sessions and advanced kettlebell training, all in one library. Choose full body workouts, lower body, upper body, core or conditioning, in six formats: circuits, EMOM, AMRAP, ladders, Tabata and kettlebell complexes. Filter by level, focus, length and equipment, and save workouts for offline training.

KETTLEBELL CLASSICS
Time-tested kettlebell workouts done the way they're usually done: the Humane Burpee, the Armor Building Complex, the Coyote, clean & press ladders, daily swings and get-ups, and the 500 Swing Day. Take on the 10,000 Swing Challenge with friends.

HIIT, EMOM & AMRAP WORKOUT TIMER
Start any kettlebell workout and the guided workout timer walks you through it: work and rest intervals, audio countdowns, round tracking for AMRAPs, and the muscle map for the exercise you're on. Build your own interval timer for swings or any move.

KETTLEBELL WORKOUT PLANS AND PROGRAMS
Follow a multi-week kettlebell program that gets harder week by week:
- Beginner Foundations (4 weeks)
- Swing to Snatch (6 weeks)
- Strength Builder (8 weeks)
- Conditioning Engine for fat loss (4 weeks)
- Get-Up & Core (4 weeks)
- Advanced Iron (8 weeks)

FITNESS CHALLENGES WITH FRIENDS
Accountability makes training stick. Pick from 58 ready-made fitness challenges, or build your own: most sessions, most minutes, longest streak, team totals, weekend warrior, or skill challenges like the Get-Up Ladder and Swing Specialist. Invite friends, track the leaderboard and keep each other consistent with streaks and weekly goals.

BODYWEIGHT & CALISTHENICS BONUS
No kettlebell today? 100 bodyweight workouts and calisthenics programs keep your streak alive: push-ups, squats, planks, burpees, pistol squats, pull-ups and more, plus Travel Training and First Pull-Up programs. Every move works with a chair, couch, table or wall at home.

MEAL PLAN & MACRO TARGETS
Set your goal (lose fat, maintain or build muscle) to get daily calorie and protein targets, then build a weekly meal plan that fits your diet and allergies. Monthly prepped-meal delivery is coming soon.

GEAR GUIDE
New to kettlebell training? Find the right kettlebell weight to start with, plus a pull-up bar, mat and other basics.

WHY BELLFORGE
- Kettlebell workouts at home with just one bell
- A muscle map for every exercise
- Kettlebell workout plans that progress
- HIIT, EMOM, AMRAP and Tabata workout timer
- Kettlebell classics like the Humane Burpee and Armor Building Complex
- Fitness challenges and streaks with friends
- Bodyweight and calisthenics workouts when you don't have a bell
- Works offline, with no ads

PUBLIC BETA
BellForge is in public beta. Create a free account to get a username, add friends, compete on shared leaderboards and back up your workouts, or use the app without an account and keep everything on your phone. Meal delivery is coming soon. Tell us what you'd like next; your feedback shapes the app.

Always warm up, use a kettlebell weight you can control with good form, and check with your doctor before starting a new training program.
```

**App category:** Health & Fitness
**Tags:** Play lets you pick up to 5 tags from its own list (under **Store settings > Tags**). Choose the closest matches to: Workout, Strength training, Home workout, HIIT and Personal trainer.
**Contact email:** development@quant-design.com
**Website:** optional (leave blank if you don't have one yet)
**Privacy policy URL:** see section 3

**Graphics** (files in this folder)

| Play Console field | File |
|---|---|
| App icon (512×512) | `icon-512.png` |
| Feature graphic (1024×500) | `feature-graphic-1024x500.png` |
| Phone screenshots (2–8, 1080×1920) | `screenshot-1-today.png` … `screenshot-8-bodyweight.png`, in order |

Tablet screenshots are optional; skip them for the beta.

---

## 2. Open testing release (Test and release > Testing > Open testing)

1. **Countries/regions:** add the countries you want (for example United States, or all countries).
2. **Create new release:** upload `android/app/release/app-release.aab` (rebuild it first; see the README note at the bottom).
3. **Release name:** leave the default.
4. **Release notes:**
```
<en-US>
BellForge public beta
- 200 kettlebell workouts with muscle maps and form guides
- 100 bodyweight bonus workouts for days without a bell
- 9 multi-week programs and a 55-challenge library
- Guided session timer with audio cues
- Meal plan builder with calorie and protein targets

Friends, leaderboards and meal delivery use sample data in this beta. Please send feedback!
</en-US>
```
5. **Next > Save > Send for review.** Google reviews new apps before the beta goes live, usually within a few days.

Once approved, the Play Store listing shows BellForge as an early-access app with a **Join the beta** option, and anyone can install it.

---

## 3. Privacy policy

Both stores require a public URL. The policy is at `docs/privacy-policy.html` in this repo. To publish it, pick one:

- **GitHub Pages (if the repo is public):** repo **Settings > Pages > Source: Deploy from a branch > `main` / `docs`**. URL: `https://quant-design-llc.github.io/Bellforge-App/privacy-policy.html`
- **If the repo is private:** copy `privacy-policy.html` to any public site you control (for example your company website or `mvalente27.github.io`) and use that URL.

---

## 4. App content forms (Policy and programs > App content)

**Privacy policy:** paste the URL from section 3.

**Ads:** No, my app does not contain ads.

**App access:** All functionality is available without special access.

**Content rating** (IARC questionnaire)
- Email: development@quant-design.com
- Category: **All Other App Types**
- Violence, sexuality, language, controlled substances, gambling: **No** to all
- Does the app allow users to interact or exchange content? **No** (friends and leaderboards are sample data in this beta)
- Does the app share the user's current location? **No**
- Does the app allow purchase of digital goods? **No**
- Expected result: **Everyone / PEGI 3**
- **Live rating issued Nov 4, 2026.** IARC Global Rating ID: `98513ae9-772c-8626-8fc0-3fbaa870758e`
- **Redo the questionnaire** when real friends, chat or leaderboards go live: "users can interact" changes to Yes.

**Target audience and content**
- Target age group: **18 and over**
- Choosing 18+ keeps the app out of Google's Families program, which adds extra rules for calorie targets and meal plans aimed at kids.
- Could the app unintentionally appeal to children? **No**

**Data safety**
- Does your app collect or share any of the required user data types? **No**
  - Reason: workouts, progress, preferences and meal plans are stored only on the device. The app has no accounts, analytics, ads or crash reporting, and it makes no network requests of its own. Shop links open in the phone's browser.
- Is all user data encrypted in transit? Not applicable (no data leaves the device).
- Do you provide a way for users to request data deletion? Users can delete all data by uninstalling the app or clearing its storage.

> Update this form when you add accounts, cloud sync, analytics, push notifications or real meal orders.

**Health apps** (if Play Console shows this declaration)
- Features: **Fitness / activity tracking** and **Nutrition / diet planning**
- The app does not diagnose, treat or provide medical advice.

**Government apps, financial features, news:** No.

---

---

## Version 1.0.17 release notes (Play Console > Open testing > Create new release)

Paste only the block below into the release notes box.

```
<en-US>
New in this update
- Compact workout timer: the countdown, the exercise and its form tips fit on one screen
- Choose your rest: Auto (by your level) or 5 to 45 seconds between moves, and 30 seconds to 2 minutes between rounds (Progress > Settings)
- +15s button during any rest
</en-US>
```

## Version 1.0.16 release notes (Play Console > Open testing > Create new release)

Paste only the block below into the release notes box.

```
<en-US>
New in this update
- New BellForge icon and splash screen
- Fits every phone screen properly, including smaller iPhones
- No more zooming in when you type in a text box
</en-US>
```

**Store listing icon:** upload `store/play/icon-512.png` under Grow users > Store presence > Main store listing > App icon. This doesn't need a new build.

## Version 1.0.15 release notes (Play Console > Open testing > Create new release)

Paste only the block below into the release notes box. (If you never uploaded 1.0.14, this one covers both.)

```
<en-US>
New in this update
- New welcome screen: create an account, sign in, or continue without one
- Keep me signed in, or sign in each time you open the app
- Your email is remembered on the sign-in screen
- Cleaner Today and Friends screens; challenge library tucked behind New challenge
</en-US>
```

**Sign in details (App content)**: update the "Any other information" text to:
"Accounts are optional; all workouts work without signing in. To test friends and challenges, tap Sign in on the welcome screen and use these details. If you are already in the app, go to Progress > Sign out first."

## Version 1.0.14 release notes (Play Console > Open testing > Create new release)

Paste only the block below into the release notes box.

```
<en-US>
New in this update
- Cleaner Today screen: your week, today's workout, your challenge and friends
- Friends tab now puts your challenges and friends first
- New challenge button keeps the challenge library tucked away until you need it
- Stays signed in, even when you open the app offline
</en-US>
```

## Version 1.0.13 release notes (Play Console > Open testing > Create new release)

```
<en-US>
New in this update
- Free accounts (optional): pick a username so friends can find you
- Add friends by username and see each other's workouts
- Shared challenges with live leaderboards
- Your training history is backed up, so a new phone doesn't wipe it
- Quick setup, a Friends tab and a Progress tab with charts and personal bests
- The app tells you when a new version is ready
</en-US>
```

## Play Console changes for 1.0.13 (accounts)

Do these before sending 1.0.13 for review.

**Policy and programs > App content > Data safety** (edit your answers)
- Does your app collect or share any of the required user data types? **Yes**
- Is all of the user data collected by your app encrypted in transit? **Yes**
- Which ways can users request that their data is deleted? **My app lets users create an account, and they can request deletion in the app and outside it**
- Delete account URL: **https://quant-design-llc.github.io/bellforge/delete-account/**
- Data types (for each: Collected = Yes, Shared = No, Processed ephemerally = No, Optional = **Users can choose whether this data is collected**):
  - Personal info > **Name** (display name). Purpose: App functionality, Account management
  - Personal info > **Email address**. Purpose: App functionality, Account management
  - Personal info > **User IDs** (username). Purpose: App functionality, Account management
  - Health and fitness > **Fitness info** (workout history, minutes, challenge scores). Purpose: App functionality
  - App activity > **Other user-generated content** (challenge names, activity updates). Purpose: App functionality
- Not collected: location, financial info, health info (meal inputs stay on the phone), messages, photos, contacts, device IDs.

**Content rating**: start a new questionnaire with the same answers as before, except
- "Does the app allow users to interact or exchange content with each other?" **Yes** (users can add friends and see each other's usernames, workouts and challenge names)
- "Does the app share the user's current physical location?" **No**
- Submit it. The new rating ID replaces 98513ae9-772c-8626-8fc0-3fbaa870758e.

**App access**: choose "All or some functionality in my app is restricted", then add instructions:
- Name: Friends and challenges
- Username / password: a test account you create in the app (e.g. playreview@quant-design.com)
- Note: "Accounts are free and optional. Reviewers can also create one on the Friends tab."

**Privacy policy URL** stays the same: https://quant-design-llc.github.io/bellforge/privacy/ (updated Nov 15, 2026).

## Version 1.0.12 release notes (Play Console > Open testing > Create new release)

```
<en-US>
New in this update
- Quick setup: tell us your name, level, weekly goal and whether you have a kettlebell
- New Friends tab: invite friends with one tap and start challenges together
- New Progress tab: weekly chart, training calendar, muscles trained and personal bests
- Share your workout when you finish
- Resume bar so you never lose a running session
- The app now tells you when a new version is ready to install
</en-US>
```

## Version 1.0.11 release notes (Play Console > Open testing > Create new release)

```
<en-US>
New in this update
- Kettlebell Classics: the Humane Burpee, Armor Building Complex, the Coyote, clean & press ladders, the 500 Swing Day and more
- 10,000 Swing Challenge and other classic challenges
- Every workout now has its own mix of moves and its own name
- A clean start: sample friends and challenges are gone, so your app shows only your own training
- Double clean and double press added, with muscle maps
</en-US>
```

---

## 5. Apple App Store listing (for the iOS release)

Apple ranks on the **app name, subtitle, keyword field and screenshot text**, but not the description. Apple combines words across these fields, so don't repeat a word in two of them.

**App name** (30)
```
BellForge: Kettlebell Workouts
```

**Subtitle** (30)
```
Home Workout Plans & Timer
```

**Keywords** (100, comma-separated, no spaces, no words already in the name or subtitle)
```
swing,hiit,emom,amrap,strength,training,muscle,map,calisthenics,bodyweight,challenge,program,kb
```

**Promotional text** (170, can be changed any time without review)
```
Public beta: 200 kettlebell workouts, muscle maps for every exercise, a HIIT timer and 55 fitness challenges to do with friends.
```

**Description:** use the Google Play full description above.

**Category:** Health & Fitness (primary), Sports (secondary)

**Screenshots:** the same 8 files. Each headline is written around a search term ("Muscle map for every exercise", "HIIT, EMOM & AMRAP timer", "Fitness challenges with friends"), because Apple now reads screenshot text for search. iPhone screenshots need the 6.9-inch size (1320×2868 or 1290×2796); ask Claude to export that size when you're ready for iOS.

---

## 6. Growing search ranking after launch

A new app has no reviews or download history, which both stores weigh heavily. These are the levers you control:

1. **Ratings and reviews.** Review text is indexed on Google Play, so reviews that say "kettlebell" and "timer" help ranking. Add an in-app review prompt (Google Play In-App Review / Apple's review request) after a user finishes their 3rd workout, when they're happiest. *(Not built yet. Ask Claude to add it.)*
2. **Reply to every review.** Replies are indexed on Google Play too. Answer naturally, for example: "Glad the kettlebell swing timer helps!"
3. **Install velocity.** Downloads in a short window lift ranking. Line up your tester recruiting (Reddit, Facebook groups, gyms) to land in the same week the beta goes live, not spread over a month.
4. **Retention and stability.** Google weighs crash rate and how many users keep the app. Fix crashes first; streaks and challenges help people come back.
5. **Update every 2–4 weeks.** Regular updates signal an active app. Change the release notes each time and mention new workouts or challenges.
6. **English variants.** Add **English (United Kingdom)**, **English (Australia)** and **English (Canada)** listings with the same text (Store presence > Manage translations). This is a quick way to show up properly in those countries.
7. **Store listing experiments.** Once you have a few hundred visitors a week, A/B test the icon, first screenshot and short description under **Grow users > Store listing experiments**.
8. **Promo content.** After launch, use Play's **Promotional content** (and Apple's In-App Events) for seasonal challenges, such as a "New Year Kettlebell Challenge". These show up in search and browse.

---

## Rebuild before uploading to Play

This version bundles the app's fonts instead of loading them from Google Fonts, so the app works offline and makes no outside requests, which matches the Data safety answers above. Before uploading to Play:

```powershell
cd "C:\Users\Brigs LLC\Bellforge-App"
npx cap sync android
```
Then in Android Studio: **Build > Generate Signed App Bundle or APK > Android App Bundle > release > Create**.
