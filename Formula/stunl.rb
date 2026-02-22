class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.3/stunl-darwin-arm64"
      sha256 "c8e80769ec9c4ddc197dc95ca04c0a681b9d98ae57b76f96e5febb6553fb5dc3"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.3/stunl-darwin-amd64"
      sha256 "f7c2ea2521b5c4aa3d61b48dc32f4518adac74234897ceb0ffc9ef4a355358dc"
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
