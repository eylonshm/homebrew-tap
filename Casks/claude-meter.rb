cask "claude-meter" do
  version "1.2.29"
  sha256 "31d68aed6b5dec7b40520711ef56282f12d080d572fcd90561d3413b34579661"

  url "https://github.com/eylonshm/claude-meter/releases/download/v#{version}/ClaudeMeter-#{version}.dmg"
  name "Claude Meter Widget"
  desc "macOS menu bar app and desktop widgets for monitoring Claude Code usage and quota"
  homepage "https://github.com/eylonshm/claude-meter"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Claude Meter.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Claude Meter.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.claudemeter.app.plist",
    "~/Library/Application Support/Claude Meter",
    "~/Library/Caches/com.claudemeter.app",
  ]
end