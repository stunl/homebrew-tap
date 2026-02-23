class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.22/stunl-darwin-arm64"
      sha256 "bfb680464601aceb1aa37c925b83f8aea23691be196bb8669027123c3a739124"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.22/stunl-darwin-amd64"
      sha256 "ad81011305da81f990570b202c34ab711cac120c3b0ce20c8a9d5b6779872e77"
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
