class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.1/stunl-darwin-arm64"
      sha256 "01fc64dc99dab5edd42dc74461c7dce2ee4384aca6fcac39942fddfa77c0ef78"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.1/stunl-darwin-amd64"
      sha256 "a3ddcfa1a66689f3623cb273f78b9ac00e6239da7eda6d6a564fe1afecd5f465"
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
