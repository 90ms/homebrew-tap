cask "tokeni-bar" do
  version "0.7.2"
  sha256 "f540aa2d77ccccf4e1ceedbed79feee65574d7727ccc7e1ef4f2310bf3c68914"

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
