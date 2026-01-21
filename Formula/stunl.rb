class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "4.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/stunl/releases/download/v4.0.5/stunl-darwin-arm64"
      sha256 "da5cd1acddaee7b5bbe9b6db74ec82e15cf955b9c3de3cc0e9f90e3b590e4dbb"
    else
      url "https://github.com/stunl/stunl/releases/download/v4.0.5/stunl-darwin-amd64"
      sha256 "a0833edbe5c5fecb01f8c0d3935ad1b40bc2ef52a476bdff64bd844ae4332385"
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
