class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.3.1/stunl-darwin-arm64"
      sha256 "bd4e5fa3f5cd70440fa0e2677aec193ba4e300d9ae70612b16572a0402e96380"
    else
      url "https://github.com/stunl/cli/releases/download/v5.3.1/stunl-darwin-amd64"
      sha256 "cf2c758a4e54dd72ea44e811babe4acd3e5ab99202a05658330be3c613f1968e"
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
