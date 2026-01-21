class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.0.1/stunl-darwin-arm64"
      sha256 "b22bab2aee37775d92c79d186f85a474e145d8daa747f34064955d4d47835baf"
    else
      url "https://github.com/stunl/cli/releases/download/v5.0.1/stunl-darwin-amd64"
      sha256 "c6097dbd291e4ec82d73fe6716677d2eaa75e240150835b12f079cf455e19009"
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
