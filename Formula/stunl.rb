class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.9.0/stunl-darwin-arm64"
      sha256 "66ea8875780304c1297b126598bda3ba5312e4316c2fb7a04f502c258b6d9c3e"
    else
      url "https://github.com/stunl/cli/releases/download/v5.9.0/stunl-darwin-amd64"
      sha256 "bedb7059938899e38065cb1563c62e4b4ab4ffecafdc4897270b40c25d04787b"
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
