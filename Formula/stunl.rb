class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.16/stunl-darwin-arm64"
      sha256 "d513fb725af140bef0f0fc50c56c04954625e325e3757f3731473dbc26635c26"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.16/stunl-darwin-amd64"
      sha256 "a95fac1da6d23ce8c0f4d65946fa2149fbab9ce8a8ca2a860fb296162ae542aa"
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
