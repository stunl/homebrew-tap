class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.17.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.17.1/stunl-darwin-arm64"
      sha256 "8b1f55a51f276803dc43bbc70d51aebe86d5f93372cc5e19a47335fed82d567d"
    else
      url "https://github.com/stunl/cli/releases/download/v5.17.1/stunl-darwin-amd64"
      sha256 "f5c298884ac25e6fab258e0e0c441f835d80e574a6ffe25d2c1ce8a66f8266ee"
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
