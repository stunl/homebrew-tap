class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.30.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.30.0/stunl-darwin-arm64"
      sha256 "57c9f98af5a929901c2e153326bcb9e403847efbb92d5ef581c24df8a7794d8b"
    else
      url "https://github.com/stunl/cli/releases/download/v5.30.0/stunl-darwin-amd64"
      sha256 "4ea9b048b1c673c0a1996718aa0b2eb49e3c6c2dbe21b0433ae544992d66c5b5"
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
