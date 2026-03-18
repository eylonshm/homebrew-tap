cask "claude-usage-widget" do
  version "1.2.24"
  sha256 "eb28a116c5de44d81c5fbe98292bef74e6efa6ad5e8064e3975d1ac9557cbae9"

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