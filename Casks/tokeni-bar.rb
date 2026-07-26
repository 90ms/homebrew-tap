cask "tokeni-bar" do
  version "0.8.0"
  sha256 "ddbf26d2f7d66f24aee272818bdb2c4d580c92568d8debf3d9870d7c99fd88cb"

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
