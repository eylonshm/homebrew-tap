cask "claude-meter" do
  version "1.2.27"
  sha256 "7ef852d550e2e0994cf5737bc38b8a8d7181f91605355e13b437a1103489467d"

  url "https://github.com/eylonshm/claude-meter/releases/download/v#{version}/ClaudeMeter-#{version}.dmg"
  name "Claude Meter"
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
