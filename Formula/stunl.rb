class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.8.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.8.5/stunl-darwin-arm64"
      sha256 "8b4175647bb63b5ff893f9ecd5c0c4e9bc3e58e31548405f89b86d620d6c8cd4"
    else
      url "https://github.com/stunl/cli/releases/download/v5.8.5/stunl-darwin-amd64"
      sha256 "b8a60808d8af5e1b4a2b25cacb1affc364d1a0cb9e14ea79b204b4794655311c"
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
