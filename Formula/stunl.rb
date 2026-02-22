class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.9/stunl-darwin-arm64"
      sha256 "856cb90099ea555e8ee279e3ecabc727a90d98ea1dd0eab3c61a2915b5c1b9f8"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.9/stunl-darwin-amd64"
      sha256 "845b905350580289927af8352898448ccd00a04a4360758bdf3c4c0917670df7"
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
