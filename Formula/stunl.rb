class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.8.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.8.7/stunl-darwin-arm64"
      sha256 "f8a1be7c7e59628f4d647ea6d68e24bc593661f33ca9b5ebef7a43d6f2e69602"
    else
      url "https://github.com/stunl/cli/releases/download/v5.8.7/stunl-darwin-amd64"
      sha256 "3051e232b38a9bd01776b12b4d1645f5f61d716bde8a4903035caedc6c962ef2"
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
