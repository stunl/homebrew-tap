class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.10.0/stunl-darwin-arm64"
      sha256 "066e30358a7784094fd037e227fb8df8b45eca42224507231197b28e5ff37d42"
    else
      url "https://github.com/stunl/cli/releases/download/v5.10.0/stunl-darwin-amd64"
      sha256 "151f42ce6ef7afa6eac0120e1e3cda0333bce3210e05a85c111d66dfc1a6bc28"
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
