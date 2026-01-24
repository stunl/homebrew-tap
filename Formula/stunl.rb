class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.3.4/stunl-darwin-arm64"
      sha256 "f1b5a68020ddecd2e5b745cce5e5e697572864d94312244d359fb404e737d960"
    else
      url "https://github.com/stunl/cli/releases/download/v5.3.4/stunl-darwin-amd64"
      sha256 "94a87ca829dc4c8f0329611dd07a0876c1eae5897452fce0e82baa841a71b0ef"
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
