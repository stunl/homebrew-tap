class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.22.0/stunl-darwin-arm64"
      sha256 "7bfdb26335e8b5e68d934226b315ddefbb292511f4da9f2470092a921ea59946"
    else
      url "https://github.com/stunl/cli/releases/download/v5.22.0/stunl-darwin-amd64"
      sha256 "56c64be9cbb8f7c0610ee705b186f14a384994e622e7ba2519410ca427177604"
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
