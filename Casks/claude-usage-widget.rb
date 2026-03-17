cask "claude-usage-widget" do
  version "main"
  sha256 "6d826c6a795b39ac99eaffd9640575ed834cb57fcffb493f9afd215eeb38b8c3"

  url "https://github.com/eylonshm/claude-usage-widget/releases/download/v#{version}/ClaudeUsage-#{version}.dmg"
  name "Claude Usage Widget"
  desc "macOS menu bar app and desktop widgets for monitoring Claude Code usage and quota"
  homepage "https://github.com/eylonshm/claude-usage-widget"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Claude Usage.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Claude Usage.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.claudeusage.app.plist",
    "~/Library/Application Support/Claude Usage",
    "~/Library/Caches/com.claudeusage.app",
  ]
end