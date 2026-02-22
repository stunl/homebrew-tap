class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.10/stunl-darwin-arm64"
      sha256 "09fadf5e4a206dcdd143b8e05d41e954faaeca0c82cada98cd1b751fcb6f1ebe"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.10/stunl-darwin-amd64"
      sha256 "8426bb5fbf34281d62e8bfcd7fa6b52de728274ea05a4baec27f10847cc4c4f8"
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
