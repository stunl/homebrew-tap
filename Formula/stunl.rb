class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.28.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.28.2/stunl-darwin-arm64"
      sha256 "37aec5391a858e88fd9f0c7d83e9845a971baaf50a1c48237d19fe00149f02b9"
    else
      url "https://github.com/stunl/cli/releases/download/v5.28.2/stunl-darwin-amd64"
      sha256 "b923174665557143d93a6a04deecdfd40bfffbab6c2fa99eecb19ba1663cf139"
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
