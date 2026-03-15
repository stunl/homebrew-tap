class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.35.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.35.1/stunl-darwin-arm64"
      sha256 "1936df390d61bec02b6c2955778d1a82e3ec6c64aa6f97f63921785414d90777"
    else
      url "https://github.com/stunl/cli/releases/download/v5.35.1/stunl-darwin-amd64"
      sha256 "7c5353bd1c61b94cdb9a15a0cc63b8d92dc1ac32ed9577f1964eadaa0504222e"
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
