class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.11.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.11.3/stunl-darwin-arm64"
      sha256 "1d28ba6b361aa54634c5b34c501a7ab4f2c2ba6b5ae823c170d2dedf46cd9113"
    else
      url "https://github.com/stunl/cli/releases/download/v5.11.3/stunl-darwin-amd64"
      sha256 "02dd03160bfd4726e35595ded507cc574c193debb6a46524deab2766956510f0"
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
