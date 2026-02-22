class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.23.0/stunl-darwin-arm64"
      sha256 "c14206fd9510d3604e90194f3681d75bb30f0310faa067992e1fec6796d90584"
    else
      url "https://github.com/stunl/cli/releases/download/v5.23.0/stunl-darwin-amd64"
      sha256 "00aa7d2fdbcadb1c87ac46232e946f628f5a328370263868f50a60294b271c67"
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
