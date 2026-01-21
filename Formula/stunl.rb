class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "4.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/stunl/releases/download/v4.0.8/stunl-darwin-arm64"
      sha256 "859f825a7e13e7956f1467019479aa3aba39926fcec9952742493b6bb18f7084"
    else
      url "https://github.com/stunl/stunl/releases/download/v4.0.8/stunl-darwin-amd64"
      sha256 "0ee850124f978b7aa8de523828ac2858cc28d8f94161471574ab8d17e8736486"
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
