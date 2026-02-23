class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.28.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.28.3/stunl-darwin-arm64"
      sha256 "c64cd5e42f5f6be8293934a08fdc7af530ef802b9316077720a904e056a6d740"
    else
      url "https://github.com/stunl/cli/releases/download/v5.28.3/stunl-darwin-amd64"
      sha256 "6615655361c5fea02b754416f78804b01e8489e5a8aad7042aac3e088a249706"
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
