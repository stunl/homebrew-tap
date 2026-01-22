class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.2.1/stunl-darwin-arm64"
      sha256 "a29d657502fb0cd98691d775987ce35e3196532724094cb90907110ad7743e0c"
    else
      url "https://github.com/stunl/cli/releases/download/v5.2.1/stunl-darwin-amd64"
      sha256 "8bbe9cdd1fbf016ba48b890fc0520089648d4ca5410fc88749fa657c2c485b11"
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
