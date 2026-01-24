class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.4.1/stunl-darwin-arm64"
      sha256 "40b623e58634ac094d19a8f78e54f02845554f035a3391bbd3f8ba2a81e5e694"
    else
      url "https://github.com/stunl/cli/releases/download/v5.4.1/stunl-darwin-amd64"
      sha256 "4e8524f5718f9c442820c96e86ef1e58d61db0bd2514a7908d5c1117eba3d7aa"
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
