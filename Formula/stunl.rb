class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.2.0/stunl-darwin-arm64"
      sha256 "0ce48c26792d45ded2633bfeb4ff47351ca3ffe1d4d1ce18ba789c2f6884dd2f"
    else
      url "https://github.com/stunl/cli/releases/download/v5.2.0/stunl-darwin-amd64"
      sha256 "4f10dc3a55e3dc4369163a486f92633ff9f121d7ebc8971c84d61642567ab511"
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
