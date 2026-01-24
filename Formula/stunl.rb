class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.3.3/stunl-darwin-arm64"
      sha256 "33fbd5ed1ca114240adc226a198eabee77db9a6d6d47c05e7a2b47b422635c5f"
    else
      url "https://github.com/stunl/cli/releases/download/v5.3.3/stunl-darwin-amd64"
      sha256 "6b11286957d932a84a3bc691987075d784c292f0e995c666f8af0becb94a58b2"
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
