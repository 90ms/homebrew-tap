class TokeniBar < Formula
  desc "AI agent token status bar with a growing pixel companion"
  homepage "https://github.com/90ms/tokeni-bar"
  url "https://github.com/90ms/tokeni-bar/archive/refs/tags/v0.20.1.tar.gz"
  sha256 "1753896276377ddbe67f69ea507268189c6db5b7b928e48a9251c99757a89569"
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
