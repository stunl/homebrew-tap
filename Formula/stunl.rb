class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.20/stunl-darwin-arm64"
      sha256 "5bb43caf96e8f94288d9af81a5a7bbb8b7f739a3c08be2f88b781bbfbc0643b6"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.20/stunl-darwin-amd64"
      sha256 "725365155731252edad83f356e92b3d816cedcf9ce4a9620a8b30d54af2ac0f4"
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
