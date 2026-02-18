class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.12.0/stunl-darwin-arm64"
      sha256 "618043e115b7758aa515f832a1ca3d476029af5798ff5a9f3ff8f2e9f855731a"
    else
      url "https://github.com/stunl/cli/releases/download/v5.12.0/stunl-darwin-amd64"
      sha256 "7a7fc31990082bb5626ac1ff40115c2a540068a86390aa3e84bdc5d62f3a7dbc"
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
