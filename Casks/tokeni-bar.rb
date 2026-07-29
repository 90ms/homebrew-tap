cask "tokeni-bar" do
  version "0.14.0"
  sha256 "18425d35505f16d2a485c6284ce9cdb6ac998e2a038a14cd04542b6bc3e68a79"

  url "https://github.com/90ms/tokeni-bar/releases/download/v#{version}/TokeniBar-#{version}.zip"
  name "Tokeni Bar"
  desc "AI agent token status bar with a growing pixel companion"
  homepage "https://github.com/90ms/tokeni-bar"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Tokeni Bar.app"

  zap trash: [
    "~/Library/Application Support/TokeniBar",
    "~/Library/Application Support/AgentsStatusBar",
    "~/Library/Preferences/dev.agentsstatusbar.app.plist",
  ]

  caveats <<~EOS
    If macOS blocks the first launch of an ad-hoc signed release, approve
    Tokeni Bar in System Settings > Privacy & Security.
  EOS
end
