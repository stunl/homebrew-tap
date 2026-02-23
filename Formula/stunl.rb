class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.14/stunl-darwin-arm64"
      sha256 "0aec4ad02b716002ba56139843ef5c9dc9193ad2faac85ed5a0116a896bd6933"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.14/stunl-darwin-amd64"
      sha256 "12f16abcfaa92362961b1f8ad3cbe25884632fcb11827d955f9f40ea50b3eb73"
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
