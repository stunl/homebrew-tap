class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.2.2/stunl-darwin-arm64"
      sha256 "a2004e163f3d64b264a37f6fb489e76081d276b2d1461caf995d357ecadd4d4d"
    else
      url "https://github.com/stunl/cli/releases/download/v5.2.2/stunl-darwin-amd64"
      sha256 "ad097f55f2279ed37ab2bf4bc9b968b970e9d058c74327a41dfe71d76b8c8356"
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
