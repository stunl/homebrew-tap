class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.13/stunl-darwin-arm64"
      sha256 "a8c907c14b26e75a0a7b2f77b8af4d4346aa36fdefe67dc4c7503ed275a76ab2"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.13/stunl-darwin-amd64"
      sha256 "bd55fbc5d0f9e5e0de5cbcbc58c5766e13f6d9e08153e4da57c996b3f545f65e"
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
