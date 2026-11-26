cask "nook-notch" do
  version "0.3.0"
  sha256 "73b7efe464f8549db7ac43e3c03011d137ba004792c47e1cd7bfc88af061794b"

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
