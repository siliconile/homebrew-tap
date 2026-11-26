cask "nook-notch" do
  version "0.4.0"
  sha256 "69f80dfd4e247e2912cdf4019dffb9001d1297045042d6410139a0bb4fe450a4"

  url "https://github.com/siliconile/Nook/releases/download/v#{version}/Nook-#{version}.zip"
  name "Nook"
  desc "Notch app for now playing, HUD, tasks, notes, shelf and AI usage"
  homepage "https://github.com/siliconile/Nook"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Nook.app"

  # Nook is ad-hoc signed, not notarized: without this, Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Nook.app"]
  end

  uninstall quit: "io.github.siliconile.Nook"

  zap trash: [
    "~/Library/Application Support/Nook",
    "~/Library/Preferences/io.github.siliconile.Nook.plist",
  ]
end
