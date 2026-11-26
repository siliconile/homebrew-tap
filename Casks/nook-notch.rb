cask "nook-notch" do
  version "0.2.1"
  sha256 "c92b1705b591976dfa1893218b758f8577605f22f314d911e2fc68a8222d3f8e"

  url "https://github.com/siliconile/Nook/releases/download/v#{version}/Nook-#{version}.zip"
  name "Nook"
  desc "Notch app for now playing, HUD, tasks, notes, shelf and AI usage"
  homepage "https://github.com/siliconile/Nook"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "Nook.app"

  # Nook is ad-hoc signed, not notarized: without this, Gatekeeper blocks the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Nook.app"]
  end

  uninstall quit: "io.github.siliconile.Nook"

  zap trash: [
    "~/Library/Application Support/Nook",
    "~/Library/Preferences/io.github.siliconile.Nook.plist",
  ]
end
