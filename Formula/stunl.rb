class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.6.1/stunl-darwin-arm64"
      sha256 "255133bd51f9c4abd859ecb497cfbae7cc2afe85142368b53cfa5284e7c8b774"
    else
      url "https://github.com/stunl/cli/releases/download/v5.6.1/stunl-darwin-amd64"
      sha256 "ab499539d9a58c3371c96feaf817ffbafbb7e8dbe1a0c75e1b359975454207e9"
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
