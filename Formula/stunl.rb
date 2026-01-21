class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "4.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/stunl/releases/download/v4.0.6/stunl-darwin-arm64"
      sha256 "4b8f89703df48003bc26c263db34613d1db8b8524e89287bd53201a0f148b203"
    else
      url "https://github.com/stunl/stunl/releases/download/v4.0.6/stunl-darwin-amd64"
      sha256 "fa4823b61f6a22bfdc4b58fa31013bdafc5ae18ef45df9cd536212164b2e102d"
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
