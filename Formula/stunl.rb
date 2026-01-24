class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.3.0/stunl-darwin-arm64"
      sha256 "e212da93ca4d64494a6e8b53e7ebc6c55e3e9362eaa67402cacd1ad35160f3be"
    else
      url "https://github.com/stunl/cli/releases/download/v5.3.0/stunl-darwin-amd64"
      sha256 "2a444d4f86767213254922b756257ae34abd4827f4f021a0227dac3446a8ec45"
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
