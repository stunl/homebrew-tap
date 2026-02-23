class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.19/stunl-darwin-arm64"
      sha256 "a0361e2fed550b80328e202c60ce96bfa48d7a34c795290726048f8e1248ea7d"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.19/stunl-darwin-amd64"
      sha256 "d7568662f84838f94cf1e2b47c7b51f2b84e2bfd00778d0ce938889566a427e0"
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
