class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.5.1/stunl-darwin-arm64"
      sha256 "56e2506c5a2c9d5478fff7d5de8821c63b1959d95b567d14c16d83b956a3f239"
    else
      url "https://github.com/stunl/cli/releases/download/v5.5.1/stunl-darwin-amd64"
      sha256 "f89e42cd31c64cb2010d2e6ec2c4a5c1709e45c4fbcf5b95ba38b41a36aa6a91"
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
