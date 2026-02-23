class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.21/stunl-darwin-arm64"
      sha256 "77bb0b1a5af459a0177138d69a78189cafe2024d70001ebe498199aec35245f9"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.21/stunl-darwin-amd64"
      sha256 "ba637c389b8ebe81dd7520f2e6d2dd022c42593b415e9f6b21a906f334aa1954"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "stunl-darwin-arm64" => "stunl"
    else
      bin.install "stunl-darwin-amd64" => "stunl"
    end
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
