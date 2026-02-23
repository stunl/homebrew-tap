class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.28.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.28.1/stunl-darwin-arm64"
      sha256 "ca65b06e97a0275b77e400a387e3d1a54dab3543cb4c5ff50bffb0f2cc78b681"
    else
      url "https://github.com/stunl/cli/releases/download/v5.28.1/stunl-darwin-amd64"
      sha256 "fb4a30bdb65d69828a822feae7ecf13fd7ed1a8f0c6dc4a931b69e15c1014cc3"
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
