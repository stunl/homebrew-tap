class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.11.0/stunl-darwin-arm64"
      sha256 "87a7c0dd4ccf7d51dbe006089b399cdf564bc5bd43668ad13f2fb4043f0da6fc"
    else
      url "https://github.com/stunl/cli/releases/download/v5.11.0/stunl-darwin-amd64"
      sha256 "c22d07dfbe93bf7cdb0b367ef24f0a2efc8820d2d68179add1d13fbf3403c1ec"
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
