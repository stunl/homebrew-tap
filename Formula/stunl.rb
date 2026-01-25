class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.6.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.6.7/stunl-darwin-arm64"
      sha256 "1793344d1127d194677a77e7813e7214742988c45618694b19dddc5cc79bfdaf"
    else
      url "https://github.com/stunl/cli/releases/download/v5.6.7/stunl-darwin-amd64"
      sha256 "4e4fb9a6889c972137c5df68b3ba986f9fe11ae19aa8cca83ec72b2a3e8097aa"
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
