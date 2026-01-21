class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "4.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/stunl/releases/download/v4.0.2/stunl-darwin-arm64"
      sha256 "cc96dccca1361691e162e75cb1e85641c2d6684b5ba3e6a9420b97f2aa1595f0"
    else
      url "https://github.com/stunl/stunl/releases/download/v4.0.2/stunl-darwin-amd64"
      sha256 "0c8e74ad9d697eff1fa615bcb21c47f052f7986c6763ef6cd6eef8cc232c48cc"
    end
  end

  def install
    bin.install "stunl-darwin-#{Hardware::CPU.arch}" => "stunl"
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
