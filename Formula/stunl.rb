class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "4.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/stunl/releases/download/v4.0.7/stunl-darwin-arm64"
      sha256 "a28424f78377ad4db89faed2bf05df53cbb10c1d508f58c5f005c235401a434e"
    else
      url "https://github.com/stunl/stunl/releases/download/v4.0.7/stunl-darwin-amd64"
      sha256 "9d087f0130f6200cc3b513df21fbfe244a952e2f26caa7000c5208a803f7979b"
    end
  end

  def install
    bin.install "stunl-darwin-#{Hardware::CPU.arch}" => "stunl"
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
