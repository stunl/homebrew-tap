class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.2.2/stunl-darwin-arm64"
      sha256 "3f5ab723b0abab47a3bed3a1bcbb31b3fa28f61b835b26428bcf848daa813b38"
    else
      url "https://github.com/stunl/cli/releases/download/v5.2.2/stunl-darwin-amd64"
      sha256 "0e7c1ace181ffcd363d0d3c88264e524fe428b1ab29f8512eb4df7f43d53a4ce"
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
