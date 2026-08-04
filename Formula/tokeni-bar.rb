class TokeniBar < Formula
  desc "AI agent token status bar with a growing pixel companion"
  homepage "https://github.com/90ms/tokeni-bar"
  url "https://github.com/90ms/tokeni-bar/archive/refs/tags/v0.18.0.tar.gz"
  sha256 "5f1cbc7ce4736491b412a6a42c1e5aa60c30e6361b5b46a4c005c37ec365b722"
  license "MIT"

  depends_on macos: :sonoma

  def install
    package_dir = buildpath/"homebrew-package"
    ENV["OUTPUT_DIR"] = package_dir.to_s
    ENV["APP_VERSION"] = version.to_s
    ENV["BUILD_NUMBER"] = version.to_s.scan(/\d+/).first(3).join(".")
    ENV["SWIFT_BUILD_DISABLE_SANDBOX"] = "1"

    system "./Scripts/package_app.sh"

    libexec.install package_dir/"Tokeni Bar.app"
    bin.install "Scripts/tokeni-bar"
  end

  def caveats
    <<~EOS
      Start Tokeni Bar:
        tokeni-bar

      Add it to your user Applications folder:
        tokeni-bar --install-app
    EOS
  end

  test do
    assert_match "Tokeni Bar.app", shell_output("#{bin}/tokeni-bar --print-app-path")
    assert_path_exists libexec/"Tokeni Bar.app/Contents/MacOS/TokeniBar"
  end
end
