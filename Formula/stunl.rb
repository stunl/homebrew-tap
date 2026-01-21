class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "4.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/stunl/releases/download/v4.0.3/stunl-darwin-arm64"
      sha256 "7fb0d250d8082fb01b5b16ae5d8e995afaa4ad847019f56d258b4abc4d203665"
    else
      url "https://github.com/stunl/stunl/releases/download/v4.0.3/stunl-darwin-amd64"
      sha256 "76dd93864c9bf6737651523ac36a93802572287aafd300695795f63a04b076de"
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
