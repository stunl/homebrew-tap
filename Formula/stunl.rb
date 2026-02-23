class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.28.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.28.0/stunl-darwin-arm64"
      sha256 "237b92b6b9a5baec8ae8b69a19caf6d25350415053c08f4831fc15e1c956ee8d"
    else
      url "https://github.com/stunl/cli/releases/download/v5.28.0/stunl-darwin-amd64"
      sha256 "bd78d5c3996d09edd14d3b5d809e5241310fc736cadbed63462b69d10d97b4c0"
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
