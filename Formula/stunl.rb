class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.23/stunl-darwin-arm64"
      sha256 "adbb52bc8fb96c9d7de0787fffd69b705b22886f5cd084f2e493ac96d6ba5846"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.23/stunl-darwin-amd64"
      sha256 "c4865fd18064c43d0bae683cd4d85f7aff4e92c6d9bfd07caab1bfae6e165ab0"
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
