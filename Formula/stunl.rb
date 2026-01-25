class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.4.4/stunl-darwin-arm64"
      sha256 "f8c4d6c179bdd7bb602fd729f3540784b6591950e25f45fa251cb23eb5a6d43b"
    else
      url "https://github.com/stunl/cli/releases/download/v5.4.4/stunl-darwin-amd64"
      sha256 "bcf3c68afa42c3dca606fdb921161319946116dd531037eb9abf044be52ad2ae"
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
