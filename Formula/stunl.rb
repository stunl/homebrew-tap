class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.20.0/stunl-darwin-arm64"
      sha256 "fee5ae52de656e27218c9945cdf4b96fcb19120f2eb382c86d711b4c99157d5c"
    else
      url "https://github.com/stunl/cli/releases/download/v5.20.0/stunl-darwin-amd64"
      sha256 "5912ab9fba38b75bd2835423e809da6039c1e20241ee323da2b6353975cd69b0"
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
