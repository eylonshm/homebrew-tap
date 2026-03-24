cask "claude-meter" do
  version "1.2.28"
  sha256 "b1587a18876e7f7fac27ecb6c6e7bd32cc0dfbe2588c124821d324dac034d077"

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
    system_command "/usr/bin/pluginkit",
                   args: ["-a", "#{appdir}/Claude Meter.app/Contents/PlugIns/ClaudeMeterWidgetExtension.appex"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.claudemeter.app.plist",
    "~/Library/Application Support/Claude Meter",
    "~/Library/Caches/com.claudemeter.app",
  ]
end