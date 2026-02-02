class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.8.3/stunl-darwin-arm64"
      sha256 "e55c49de053702c950347a21de4a034c17c5a167b1ef30063be9bf8c5f4f270d"
    else
      url "https://github.com/stunl/cli/releases/download/v5.8.3/stunl-darwin-amd64"
      sha256 "401b40b871c9ffd25591a40c43fc133accd77f84518133f9d2467b189b55bfbf"
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
