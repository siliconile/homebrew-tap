# siliconile/homebrew-tap

Homebrew casks for [Nook](https://github.com/siliconile/Nook), a macOS notch app.

```bash
brew install --cask siliconile/tap/nook-notch
```

Nook isn't notarized, so the cask removes the quarantine flag after installing; macOS then opens it without the "Apple could not verify" prompt.

Update with `brew upgrade --cask nook-notch`. The cask is bumped automatically within an hour of every Nook release.
