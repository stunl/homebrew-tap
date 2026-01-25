class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.6.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.6.6/stunl-darwin-arm64"
      sha256 "38be2574d9a71b8ba47fec761851a6847be48ff427c2c9e3644119ccc902f02c"
    else
      url "https://github.com/stunl/cli/releases/download/v5.6.6/stunl-darwin-amd64"
      sha256 "0aeadd2f7efc60f3770720d0d8047ed0992612e56d1d614ae389515fe3f1250c"
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
