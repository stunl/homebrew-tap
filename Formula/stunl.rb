class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.8/stunl-darwin-arm64"
      sha256 "f2fdb5ccad4c9c537da2c11a05c9481f76e403796a631ce372d32aec19d195c0"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.8/stunl-darwin-amd64"
      sha256 "1e8a7bc6d12abe2c1b3da9e6906b46719dda5d6cc7ffae439d8dba44f4e6aa78"
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
