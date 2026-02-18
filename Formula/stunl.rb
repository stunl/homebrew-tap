class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.15.0/stunl-darwin-arm64"
      sha256 "9f5287c82c50ee5f2ff3bb8d38d021b8a421154e0f5af8cb290f15010fee7532"
    else
      url "https://github.com/stunl/cli/releases/download/v5.15.0/stunl-darwin-amd64"
      sha256 "f1655ca96982f2d98f2e1d12e77d2fc52004c630500acbd478ae8780bce31541"
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
