class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.7/stunl-darwin-arm64"
      sha256 "1c08b30339dabd1258de53639b66a69f790c2585bc9ff007bb63b465e3f1335b"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.7/stunl-darwin-amd64"
      sha256 "4abf4d0a87254b076be72225e18b3a663a4de3db6f9e2b002eb5b87c11743308"
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
