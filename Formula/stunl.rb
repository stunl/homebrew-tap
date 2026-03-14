class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.35.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.35.0/stunl-darwin-arm64"
      sha256 "44e4fc7e203a849c4c1c75cd9b1e5bd79ad7df2c482dcf3cf3ee8f05dfe467ac"
    else
      url "https://github.com/stunl/cli/releases/download/v5.35.0/stunl-darwin-amd64"
      sha256 "e6e6f69fd6591c12dfa6e3ff59824b24ff99eda605caaf83af7a057d79cfb243"
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
