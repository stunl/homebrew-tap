class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.2.3/stunl-darwin-arm64"
      sha256 "48389ccf41dc168c6a828bfa2a2731a6bc3d3f4baa169f8ebb283253be406f4e"
    else
      url "https://github.com/stunl/cli/releases/download/v5.2.3/stunl-darwin-amd64"
      sha256 "001bbb9fa6e270237f2167d85583f994fff43ae1f0a354d19739e5b905029eec"
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
