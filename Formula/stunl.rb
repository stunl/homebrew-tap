class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.4.3/stunl-darwin-arm64"
      sha256 "69f20dc44127f312b79a5119b013c7f59449c7fc2d9291e728c0142d030cc92c"
    else
      url "https://github.com/stunl/cli/releases/download/v5.4.3/stunl-darwin-amd64"
      sha256 "7fdf62e5c30d2e1ada36b1e9b4c86f6a33b9f909664f141b0aa60e4c10de8d25"
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
