class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.32.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.32.0/stunl-darwin-arm64"
      sha256 "61909e115e8a2ccbd8517620c1c14141168565da5a320ac2088e5986b44be25d"
    else
      url "https://github.com/stunl/cli/releases/download/v5.32.0/stunl-darwin-amd64"
      sha256 "f0ec52620f77808c38e9e0cbeb06a64f23c716f46d2b225d2c23c451f15c6031"
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
