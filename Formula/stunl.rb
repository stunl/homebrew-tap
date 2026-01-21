class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "4.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v4.0.9/stunl-darwin-arm64"
      sha256 "cf23e471d76d4e2b34acfc35add1dd88a3354fbb92defc89a44fcd27e716d65a"
    else
      url "https://github.com/stunl/cli/releases/download/v4.0.9/stunl-darwin-amd64"
      sha256 "7ed921ae6bb4fcd8a7c311ac888cdd0786d12474da1be604f4449d4226425c2f"
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
