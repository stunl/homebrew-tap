class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.15/stunl-darwin-arm64"
      sha256 "c2d9932e1b82b1cc60d83bf30a613a334d5527488cb26ac9618309ff6b1f8f52"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.15/stunl-darwin-amd64"
      sha256 "3f78c5aee867e528b6693f9d9afddf4c0d2e7bc9fb8e338881da2adc20f78eb1"
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
