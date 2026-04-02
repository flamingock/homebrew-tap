# typed: false
# frozen_string_literal: true

# Formula for Flamingock CLI — https://flamingock.io
#
# This formula is managed automatically by the flamingock-cli release workflow.
# DO NOT edit the version or sha256 fields manually — they are updated by CI.
class Flamingock < Formula
  desc "CLI tool for executing Flamingock change operations outside the application lifecycle"
  homepage "https://flamingock.io"
  version "1.1.0-beta.2"
  license "Apache-2.0"

  # ── Platform-specific pre-built binaries ─────────────────────────────────────
  # SHA256 hashes are updated automatically by the release workflow.
  # To verify manually: sha256sum <binary-file>

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/flamingock/flamingock-cli/releases/download/v#{version}/flamingock-#{version}-macos-arm64"
      sha256 "76ae536989f97acf2d1d7517c3dbe8010f8b17ccfb4f41c42ee2fa1db4f068a9"
    else
      # Intel macOS is not currently supported. Build from source or use the JVM JAR:
      #   java -jar https://github.com/flamingock/flamingock-cli/releases/download/v<VERSION>/flamingock-cli-<VERSION>.jar
      odie "Intel macOS (x86_64) is not yet supported by this formula."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/flamingock/flamingock-cli/releases/download/v#{version}/flamingock-#{version}-linux-x86_64"
      sha256 "8c41215620c68a9bef9ffb113a56b8e450c761a8e9230c39b3451c0af5cab56a"
    else
      odie "Linux ARM is not yet supported by this formula."
    end
  end

  # ── No build step needed — pre-built binary ───────────────────────────────────
  def install
    bin_name = Hardware::CPU.arm? ? "flamingock-#{version}-macos-arm64" : "flamingock-#{version}-linux-x86_64"
    # The downloaded file has the versioned name — rename it to the plain `flamingock` command
    bin.install bin_name => "flamingock"
  end

  # ── Shell completion (optional, generated at install time) ───────────────────
  def caveats
    <<~EOS
      Flamingock CLI has been installed. Run `flamingock --help` to get started.

      Documentation: https://docs.flamingock.io/cli
    EOS
  end

  test do
    # Verify the binary runs and prints the expected version string
    assert_match "#{version}", shell_output("#{bin}/flamingock --version")
  end
end
