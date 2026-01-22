class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.2.1/stunl-darwin-arm64"
      sha256 "bfb9318cdee10eca1f67c32627ab733564ecb10a61baa170856fa04fc767aed6"
    else
      url "https://github.com/stunl/cli/releases/download/v5.2.1/stunl-darwin-amd64"
      sha256 "d4970f0a0fd9128cc81b2f0fffc859f10b90bf72d5dfdca80d690f3fc852959b"
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
