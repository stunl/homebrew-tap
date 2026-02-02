class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.8.0/stunl-darwin-arm64"
      sha256 "63150e8648843e3080e716fad5f609bafeed186965ed507d39e032a1811c87e0"
    else
      url "https://github.com/stunl/cli/releases/download/v5.8.0/stunl-darwin-amd64"
      sha256 "f8be657a99b1b680a9f9503e5d8c6cc151c292dda604f302ebb67fccd03f1dbd"
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
