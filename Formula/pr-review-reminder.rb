class PrReviewReminder < Formula
  desc "Menu-bar app for collecting and reviewing GitHub pull requests"
  homepage "https://github.com/90ms/pr-review-reminder"
  url "https://github.com/90ms/pr-review-reminder/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "5d27ce060b0bbe21acbdcc4fe6558d9d1ea5388f6e48cdf2f5f3164c64cc4c88"
  license "MIT"

  depends_on xcode: ["16.4", :build]
  depends_on macos: :sonoma

  def install
    package_dir = buildpath/"homebrew-package"
    ENV["OUTPUT_DIR"] = package_dir.to_s
    ENV["APP_VERSION"] = version.to_s
    ENV["BUILD_NUMBER"] = version.to_s.scan(/\d+/).first(3).join(".")
    ENV["SWIFT_BUILD_DISABLE_SANDBOX"] = "1"

    system "./Scripts/build-app.sh"

    libexec.install package_dir/"PR Review Reminder.app"
    bin.install "Scripts/pr-review-reminder"
  end

  def caveats
    <<~EOS
      Start the app:
        pr-review-reminder

      Optionally add it to your user Applications folder:
        pr-review-reminder --install-app
    EOS
  end

  test do
    assert_match "PR Review Reminder.app", shell_output("#{bin}/pr-review-reminder --print-app-path")
    system bin/"pr-review-reminder", "--doctor"
  end
end
