class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.31.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.31.0/stunl-darwin-arm64"
      sha256 "e0fb8ddc5e4a84238d0c7ff7f2f6d3611ba0bacb037b1fd255af018f1db60e17"
    else
      url "https://github.com/stunl/cli/releases/download/v5.31.0/stunl-darwin-amd64"
      sha256 "4fa2754953452a09c578f00de1c36650ba6008c0615340c7158c1eca5c98f1cf"
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
