class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.33.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.33.0/stunl-darwin-arm64"
      sha256 "3ef63a168cf452b022412b74da474186cdf0b4a42efd355a935cd98df61bd97a"
    else
      url "https://github.com/stunl/cli/releases/download/v5.33.0/stunl-darwin-amd64"
      sha256 "fe43c6f5bacea609256224226efb58e538ffc1dc48961ff0d869cc9ee90f6f3b"
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
