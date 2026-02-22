class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.4/stunl-darwin-arm64"
      sha256 "a0ec7c61f335d0fcb6d9b2b47eed81aca9dee8b263a1501ae717ec23b8dce163"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.4/stunl-darwin-amd64"
      sha256 "6af4419af27dfdf924de3372a39b094c0821d9f4ce4b1c5df86e8644fd567f2a"
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
