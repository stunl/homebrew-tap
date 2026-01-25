class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.6.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.6.5/stunl-darwin-arm64"
      sha256 "68368ed414c4c49e24ef97a47010e7350ba104594967d75638be5dfc67b9f8a6"
    else
      url "https://github.com/stunl/cli/releases/download/v5.6.5/stunl-darwin-amd64"
      sha256 "4a752fe121931ad4d5bb5a01128836952e31f1c4c8eb1249c0f435f840df4eee"
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
