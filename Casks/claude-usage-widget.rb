cask "claude-usage-widget" do
  version "1.2.0"
  sha256 "b94152599e449aaf1ceea497c79129e8e3fb13831a15e926c02e974a1ff866be"

  url "https://github.com/eylonshm/claude-usage-widget/releases/download/v#{version}/ClaudeUsage-#{version}.dmg"
  name "Claude Usage Widget"
  desc "macOS menu bar app and desktop widgets for monitoring Claude Code usage and quota"
  homepage "https://github.com/eylonshm/claude-usage-widget"

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
