class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "4.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v4.0.10/stunl-darwin-arm64"
      sha256 "ade89c6bd32a438b9ad6f0c0f628cbd8c70767e0f89ac96525a7689437c52b7d"
    else
      url "https://github.com/stunl/cli/releases/download/v4.0.10/stunl-darwin-amd64"
      sha256 "5efa32814d5739995f5833ebf867dcede77d2fe474230828e95f9c0505a99275"
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
