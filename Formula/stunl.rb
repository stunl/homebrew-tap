class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.3.2/stunl-darwin-arm64"
      sha256 "85748d2153d7ee221db89197aafb461132a8178e8e4b4c285a0871e7303d55ca"
    else
      url "https://github.com/stunl/cli/releases/download/v5.3.2/stunl-darwin-amd64"
      sha256 "71f85a7f7366ba58df4be6810d905934f3c270448f3e1f67655e5b3a3556630f"
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
