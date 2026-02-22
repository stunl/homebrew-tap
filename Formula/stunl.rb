class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.11/stunl-darwin-arm64"
      sha256 "ff737830702282a15c5d16a3713e51313f0940650c28b107bee2d88fd6ca27d2"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.11/stunl-darwin-amd64"
      sha256 "8da135f9d7acf464181cf8941dee347024bfb6625448db89177ebdc1bf3079da"
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
