class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.8.2/stunl-darwin-arm64"
      sha256 "3cbbdfc838792fd48939d05b138090d2e1d4d3b6c410084c29e75ec8bc7a373d"
    else
      url "https://github.com/stunl/cli/releases/download/v5.8.2/stunl-darwin-amd64"
      sha256 "07a70df84a71beff09c0fedf7196e7cc95bfcdcd9672803bae87322c22ac3b6e"
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
