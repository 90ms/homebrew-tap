cask "tokeni-bar" do
  version "0.23.0"
  sha256 "b3f4b85e00f3cd9cb05d3cbd0cd7cf90c9d32bf8d777597bbab00f5424e1a75f"

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
