class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.12/stunl-darwin-arm64"
      sha256 "4fb2fc5ce7f48b71290b7b4537e31b24fff1a16ffd704a0ee12d3e92222efe63"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.12/stunl-darwin-amd64"
      sha256 "7a81b623407425eaf33135920eb9e4bb2fbb47eb97cc94b6325edca8ab21e05f"
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
