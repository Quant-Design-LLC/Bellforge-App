#!/bin/sh
# Xcode Cloud runs this after cloning the repo.
# Capacitor's iOS Swift packages live in node_modules, so install them
# and copy the web app into the native project before Xcode builds.
set -e

echo "Installing Node.js"
brew install node@22
export PATH="/opt/homebrew/opt/node@22/bin:/usr/local/opt/node@22/bin:$PATH"

cd "$CI_PRIMARY_REPOSITORY_PATH"
npm ci
npx cap sync ios
# Xcode Cloud sets the build number itself, so no version bump is needed here.
