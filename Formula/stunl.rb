class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.26.0/stunl-darwin-arm64"
      sha256 "59955a85231f20563c13a42a600e572941750dd285b592e022d8f99f9aabef9c"
    else
      url "https://github.com/stunl/cli/releases/download/v5.26.0/stunl-darwin-amd64"
      sha256 "b28710feac9fe8bc19effa6aeb479f240b5c9ea1f668cf42b49f33172ae32958"
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
