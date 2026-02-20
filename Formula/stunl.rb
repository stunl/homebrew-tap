class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.18.0/stunl-darwin-arm64"
      sha256 "6cbcae8a84943b1f4acb587fc266b35a3a565a38dbc99951fd010e9883c841c5"
    else
      url "https://github.com/stunl/cli/releases/download/v5.18.0/stunl-darwin-amd64"
      sha256 "5b6a4409a3c6976c818e83ed13848ad6ee080b827b3d553bd297a13a8ffc0e59"
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
