class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.19.0/stunl-darwin-arm64"
      sha256 "ebde613eb131aa066b811e455daff4afa85b6473203c0da4c55c88875937ad3a"
    else
      url "https://github.com/stunl/cli/releases/download/v5.19.0/stunl-darwin-amd64"
      sha256 "1f57c8e1f5e1b70f68b0e5ac20cfa99f77f82de4c2f267608ed7e646ebf69497"
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
