class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.29.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.29.1/stunl-darwin-arm64"
      sha256 "ef452a4421bcc33675b4eef24733cee8eac202d302a93d9739e0d0439423e5ab"
    else
      url "https://github.com/stunl/cli/releases/download/v5.29.1/stunl-darwin-amd64"
      sha256 "740784e6bc53c30e603ae3f22a57e357a319b761652228c88c71f2908fbeebfc"
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
