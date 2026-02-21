class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.19.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.19.1/stunl-darwin-arm64"
      sha256 "3dfc48b7ce9f5426fefa2b2df254b94d6d0c450511413c38246e568367d725d8"
    else
      url "https://github.com/stunl/cli/releases/download/v5.19.1/stunl-darwin-amd64"
      sha256 "12a41ff28ea0d38757c388297500608a13b2ae8a98a52c68f8a9fbcba8257ac7"
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
