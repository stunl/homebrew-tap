class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.21.0/stunl-darwin-arm64"
      sha256 "3e6ee66b951ff931bec959a318d2a351270155693b0455f20121da76fdd14ef4"
    else
      url "https://github.com/stunl/cli/releases/download/v5.21.0/stunl-darwin-amd64"
      sha256 "d29ef61d5461588129447c68feb8b0e64e390eaba6f9efbd7d3b64b89e730c3f"
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
