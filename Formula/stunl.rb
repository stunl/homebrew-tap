class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.18/stunl-darwin-arm64"
      sha256 "6873cb6c898714286784e1cf4840fbff389e86f9f95bc1948a92351654d12c38"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.18/stunl-darwin-amd64"
      sha256 "0be3a5edcc14d6b438cc3434d80c32ed751f50e0d6e90d4c5eaddafc66dc9234"
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
