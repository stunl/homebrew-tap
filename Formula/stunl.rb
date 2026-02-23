class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.24/stunl-darwin-arm64"
      sha256 "0ba16387ae1c69d5b05df69ea6bdd2ec7de63036ab5ef49dc2e792d0cb6d5751"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.24/stunl-darwin-amd64"
      sha256 "c08efe3a767ba4ee6c6223b755f11b56beebda058f837ce8af007f28baae6fd1"
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
