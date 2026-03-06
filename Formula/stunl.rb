class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.34.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.34.1/stunl-darwin-arm64"
      sha256 "194430ba5c7fb8af0d3c05deca4e76aacce1f2effd28c9463b9e9f2f7eff0044"
    else
      url "https://github.com/stunl/cli/releases/download/v5.34.1/stunl-darwin-amd64"
      sha256 "3c28b66521842050aa88567e7f15019dcfe939b0fe6a10d0a51e6941a0f65a37"
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
