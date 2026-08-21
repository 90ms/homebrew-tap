cask "tokeni-bar" do
  version "0.26.0"
  sha256 "7f5718d377bd58201936f9014c4cbabc821d6e5e76cbda1ef725d4107fc222e3"

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
