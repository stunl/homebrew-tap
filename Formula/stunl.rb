class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.2/stunl-darwin-arm64"
      sha256 "2b725ee6878a6fe4b5708782c1fe8de6177d37fc2198482ec39d10d114d6b15c"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.2/stunl-darwin-amd64"
      sha256 "fb0a8febfed269a59c157f56fe626dafb94becf735226b9b4b12bcb4e90c835e"
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
