class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.25.0/stunl-darwin-arm64"
      sha256 "2555fe1f9675737db2c07d0d18476de629cd737aa0ba86ebd38dc4f377c406a4"
    else
      url "https://github.com/stunl/cli/releases/download/v5.25.0/stunl-darwin-amd64"
      sha256 "a46e8152eb870b50fa85d219990635265ae4cc512ccf38b2bc05f47bcc46116e"
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
