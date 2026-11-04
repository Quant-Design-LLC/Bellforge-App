# BellForge: Google Play open testing

Everything Play Console asks for to publish BellForge as a public beta (Open testing). Copy each section into the matching Play Console page.

---

## 1. Store listing (Grow users > Store presence > Main store listing)

**App name** (30 max)
```
BellForge: Kettlebell Workouts
```

**Short description** (80 max)
```
Kettlebell workouts with muscle maps, a guided timer and friend challenges.
```

**Full description** (4,000 max)
```
BellForge is a kettlebell training app built around one idea: show up, train well, and keep each other accountable.

SEE EVERY MUSCLE YOU WORK
Every move comes with a muscle map that highlights the primary and supporting muscles, plus form cues and the most common mistakes to avoid. 48 moves in all, from the deadlift and swing to the Turkish get-up, snatch and clean & jerk.

200 KETTLEBELL WORKOUTS
Beginner, intermediate and advanced sessions in six formats: circuits, EMOMs, AMRAPs, ladders, Tabatas and complexes. Filter by level, focus, length and equipment, and save your favorites for offline use.

A GUIDED SESSION TIMER
Start any workout and BellForge walks you through it step by step: work and rest phases, audio countdowns, round tracking and the muscle map for the move you're on.

PROGRAMS THAT BUILD
Follow a multi-week plan that gets harder week by week: Beginner Foundations, Swing to Snatch, Strength Builder, Conditioning Engine, Get-Up & Core and Advanced Iron.

CHALLENGE YOUR FRIENDS
Pick from 55 ready-made challenges, or build your own. Rank by sessions, minutes, streaks, team totals, weekends or specific moves, then invite friends and keep score together.

NO BELL? NO PROBLEM
A bonus library of 100 bodyweight workouts and 3 bodyweight programs, including Travel Training and First Pull-Up, keeps your streak alive on days without your kettlebell. Every move works with things you already have at home.

MEAL PLANS FOR YOUR GOAL
Set your goal and stats to get daily calorie and protein targets, then build a week of prepped meals that fits your diet and allergies. Monthly meal delivery is coming soon.

GEAR SHOP
Need a kettlebell, pull-up bar or mat? Find the basics right in the app.

BETA NOTE
BellForge is in public beta. Your workouts and progress are saved on your device. Friends, leaderboards and meal delivery use sample data while we build accounts and syncing. We'd love your feedback: tell us what's confusing, what's missing and what you'd pay for.

Always warm up, use a weight you can control with good form, and talk to your doctor before starting a new training program.
```

**App category:** Health & Fitness
**Tags:** Fitness, Workout, Strength training (pick from Play's list)
**Contact email:** michael.valente@quant-design.com
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
- Email: michael.valente@quant-design.com
- Category: **All Other App Types**
- Violence, sexuality, language, controlled substances, gambling: **No** to all
- Does the app allow users to interact or exchange content? **No** (friends and leaderboards are sample data in this beta)
- Does the app share the user's current location? **No**
- Does the app allow purchase of digital goods? **No**
- Expected result: **Everyone / PEGI 3**

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

## Rebuild before uploading to Play

This version bundles the app's fonts instead of loading them from Google Fonts, so the app works offline and makes no outside requests, which matches the Data safety answers above. Before uploading to Play:

```powershell
cd "C:\Users\Brigs LLC\Bellforge-App"
npx cap sync android
```
Then in Android Studio: **Build > Generate Signed App Bundle or APK > Android App Bundle > release > Create**.
