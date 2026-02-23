class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.17/stunl-darwin-arm64"
      sha256 "ea46a76a81f8f8f5905078db539c57ebba85ed921962f17ef851f89ed2b85d86"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.17/stunl-darwin-amd64"
      sha256 "b78b8eb58ea1fa67576d0ac22b0f4ba550488912ffe6c4e6bf32ea7640aead97"
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
