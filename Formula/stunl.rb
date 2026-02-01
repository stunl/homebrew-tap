class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.7.1/stunl-darwin-arm64"
      sha256 "ee8885f5b002002200f6815487b128a1c03964274b4eead9e7048e9aa0362fd3"
    else
      url "https://github.com/stunl/cli/releases/download/v5.7.1/stunl-darwin-amd64"
      sha256 "93ff76110faf662213f03074c0ea07e50ac3a68880be544dc18945a43e23cbc4"
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
