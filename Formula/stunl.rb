class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.4.2/stunl-darwin-arm64"
      sha256 "18cc998487088dd5de0a69aceb7074ee3e2e67bd0e7bf91fc397685613ac8c7c"
    else
      url "https://github.com/stunl/cli/releases/download/v5.4.2/stunl-darwin-amd64"
      sha256 "0257f04e5bab28d4668a2892bd97c672a848e740feb40295429f2e842eae41f6"
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
