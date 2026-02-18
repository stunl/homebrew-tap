class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.14.0/stunl-darwin-arm64"
      sha256 "2f5e56dd8b7c5ab3e196aa1b5e332db7c0672ac43ef53cfce9620f219627eada"
    else
      url "https://github.com/stunl/cli/releases/download/v5.14.0/stunl-darwin-amd64"
      sha256 "103dca7576ccf5e2848720aef3bfa178989c678925f2c35dd6304c8a3ddf7e43"
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
