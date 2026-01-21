class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "4.0.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v4.0.11/stunl-darwin-arm64"
      sha256 "5d722199b0d4926932d389631396ef0bb628ae1aacea342a160748097b3f7947"
    else
      url "https://github.com/stunl/cli/releases/download/v4.0.11/stunl-darwin-amd64"
      sha256 "af4fc25490ae9969a8b888945bd233598b87b5a0be68688bbac2e230d7ee3bca"
    end
  end

  def install
    bin.install "stunl-darwin-#{Hardware::CPU.arch}" => "stunl"
  end

  def caveats
    <<~EOS
      Stunl requires an API key to function.

      1. Get your API key from https://stunl.com
      2. Use Stunl:
         stunl -port 3000 -key YOUR_API_KEY

      For more information, visit https://docs.stunl.com
    EOS
  end

  test do
    assert_match "Stunl", shell_output("#{bin}/stunl -h 2>&1", 1)
  end
end
