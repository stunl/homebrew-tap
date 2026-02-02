class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.8.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.8.4/stunl-darwin-arm64"
      sha256 "40bb8ac3d29996f826e0097b59a25fde5f2388abe46ad946b3cf7926d7b3f2be"
    else
      url "https://github.com/stunl/cli/releases/download/v5.8.4/stunl-darwin-amd64"
      sha256 "840b4282183da840a3700d213f1a14ef2088724c01263e11f04f48c2dc9deac3"
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
