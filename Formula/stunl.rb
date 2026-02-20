class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.17.0/stunl-darwin-arm64"
      sha256 "9a2d58c1563cc98d090518631f97bf4e0d38f33ddbe1d1d534c6bdce10f2a226"
    else
      url "https://github.com/stunl/cli/releases/download/v5.17.0/stunl-darwin-amd64"
      sha256 "2f2dfe52b4072a853e12d4ef78853cec3e8b3a09a228cbf7f37c2f167a202cf3"
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
