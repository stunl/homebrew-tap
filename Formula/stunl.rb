class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.11.1/stunl-darwin-arm64"
      sha256 "557783ef64d8249f15237268faf9dc1f94a14a4a33884531acbae8886040a9ff"
    else
      url "https://github.com/stunl/cli/releases/download/v5.11.1/stunl-darwin-amd64"
      sha256 "12b97b750cee7048fb97c07eac345f90f5ab9c996252c37b7563ad01d3f04632"
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
