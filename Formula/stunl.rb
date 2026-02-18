class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.11.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.11.2/stunl-darwin-arm64"
      sha256 "61904705b43635ee672abc7d5edab26e8fd1931a7f1ab9b226d056514b47de3c"
    else
      url "https://github.com/stunl/cli/releases/download/v5.11.2/stunl-darwin-amd64"
      sha256 "2b1218cc524ef44d645481aa45602a27c6512534d46793c91e57d7acbfee0ac5"
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
