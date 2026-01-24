class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.3.5/stunl-darwin-arm64"
      sha256 "1c32c0fc05c3fcf41c7f748b38fa18f684dee4bb83c9eb38bd8dcb6ff7a18a98"
    else
      url "https://github.com/stunl/cli/releases/download/v5.3.5/stunl-darwin-amd64"
      sha256 "47f9f2b4b3112d4c126a8bc9454696c285f88a0c72807c31a6081ba9fc7a5d95"
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
