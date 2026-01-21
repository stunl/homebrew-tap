class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.0.0/stunl-darwin-arm64"
      sha256 "1208b6aaae7eed0b928c39f6579e9164f47739fdd3989cfb72238a1c08845cd7"
    else
      url "https://github.com/stunl/cli/releases/download/v5.0.0/stunl-darwin-amd64"
      sha256 "cda97e1e64e891399bd3339f54c14475794c1f0b740e08c9d6166eec73762843"
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
