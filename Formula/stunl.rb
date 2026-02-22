class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.6/stunl-darwin-arm64"
      sha256 "2fd0419bc8dffb5bf140d263c1557cc6888d61323c9f42288927a4bfe56ab157"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.6/stunl-darwin-amd64"
      sha256 "b1b25e4e1e37a342c3900ffb086cdf2d23214cb522a577e1f1f121a1b27a36d6"
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
