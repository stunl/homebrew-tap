class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.16.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.16.1/stunl-darwin-arm64"
      sha256 "3c4ccfbcf70f97f7cd330b3248e458edf343cd9bd38db5976ecbdf7fb140005b"
    else
      url "https://github.com/stunl/cli/releases/download/v5.16.1/stunl-darwin-amd64"
      sha256 "2124f2a198b4736c2e4890f54bf25b5f88afbbd55026fa5bd3a655b148c763f4"
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
