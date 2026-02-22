class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.24.0/stunl-darwin-arm64"
      sha256 "cb2604a759f6745aef9eafde1001b0c4e64b6f76158a942475b4c6213b9a32c7"
    else
      url "https://github.com/stunl/cli/releases/download/v5.24.0/stunl-darwin-amd64"
      sha256 "b83f11e2dc41c770db10618f2b95cfd3fef84fc20bb7d91d4af5983e9c66f415"
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
