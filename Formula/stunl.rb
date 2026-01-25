class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.5.0/stunl-darwin-arm64"
      sha256 "0a7d30d2118089d773864ece0af38f9db505fdb616ffd33e23b85d282c4ae1ea"
    else
      url "https://github.com/stunl/cli/releases/download/v5.5.0/stunl-darwin-amd64"
      sha256 "49dc3cf67265d9205fc6905b4409e81cde35d4fcbc1593d7de71ad4f8668f533"
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
