class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.4.0/stunl-darwin-arm64"
      sha256 "91bfda74da909710982c69398592e34aeebe375b182f57d1346327ceb8be3637"
    else
      url "https://github.com/stunl/cli/releases/download/v5.4.0/stunl-darwin-amd64"
      sha256 "a0f425a9b6acbecf4244e07739993b3f9275ab862dadb7722d9a460478cf771b"
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
