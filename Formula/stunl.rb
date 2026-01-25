class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.6.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.6.4/stunl-darwin-arm64"
      sha256 "72691aef1345cce760a982aa290c578e1122a5561af5ec4f501f666b18f5364d"
    else
      url "https://github.com/stunl/cli/releases/download/v5.6.4/stunl-darwin-amd64"
      sha256 "e7a7b21b94d766d7f5ebf3f331b2a58ef56d73dfaeeb9b9d572c5b60efed008a"
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
