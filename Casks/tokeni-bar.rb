cask "tokeni-bar" do
  version "0.25.1"
  sha256 "a939afa8784f412683d33629b4e6630ce74e2388aba8422d9b89c7c7f3e44d8b"

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

end
