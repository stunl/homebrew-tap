class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.13.0/stunl-darwin-arm64"
      sha256 "a7dc96d7d0efd62b1100ad887e589f840368d871f56e7d6e6b8a0c29670cc31c"
    else
      url "https://github.com/stunl/cli/releases/download/v5.13.0/stunl-darwin-amd64"
      sha256 "7c7b9b4c78ee859a9deb297a233d64ffc92557ff1e95bfe975ade33f8d9f29c6"
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
