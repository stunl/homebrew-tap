class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "4.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/stunl/releases/download/v4.0.4/stunl-darwin-arm64"
      sha256 "7d9e041c622e942d1a6e12e200074dc70158ada2f267ab330fca487871ea2333"
    else
      url "https://github.com/stunl/stunl/releases/download/v4.0.4/stunl-darwin-amd64"
      sha256 "b28c7a23a4de121aaf9e202834f06f61b938060defec3eb49ec1db66d5673863"
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
