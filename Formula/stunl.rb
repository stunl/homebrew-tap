class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.2.0/stunl-darwin-arm64"
      sha256 "0ba78610789333c777604d271967a4c8d8a9997ce6a714ffe443a88ff0791617"
    else
      url "https://github.com/stunl/cli/releases/download/v5.2.0/stunl-darwin-amd64"
      sha256 "7e77327770f0444cdad88bd5843c50b97f734b93fe67ee1a9b09dbdc06ec1dc9"
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
