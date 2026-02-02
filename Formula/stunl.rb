class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.8.1/stunl-darwin-arm64"
      sha256 "f7c6ff355ac40d44576a5b92ceda78b051aaca80bae2b30012e7539d281048d7"
    else
      url "https://github.com/stunl/cli/releases/download/v5.8.1/stunl-darwin-amd64"
      sha256 "4784bc568d773f3242708fb9c606bd3c147a28daa337c7347d8be15c00542fef"
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
