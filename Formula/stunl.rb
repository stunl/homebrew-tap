class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.6.2/stunl-darwin-arm64"
      sha256 "f5eb1527b20215c4bc0ac7bed95f1c5de45bf04acd2a54b26fcd08a59443e4fb"
    else
      url "https://github.com/stunl/cli/releases/download/v5.6.2/stunl-darwin-amd64"
      sha256 "5fd8c9b6f1a75202586bd5c19a4ef0a199ecb8322add1ef63cad70eaa86a976e"
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
