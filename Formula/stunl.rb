class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.29.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.29.0/stunl-darwin-arm64"
      sha256 "afe1376b55c35a7e69813b8c841edd24cb45d6f8ba005984c68bfd50fd3791d0"
    else
      url "https://github.com/stunl/cli/releases/download/v5.29.0/stunl-darwin-amd64"
      sha256 "d6b28c0ea32a3f85fb1343e376402c7485f0c73f65152ea4b18ef86a5f8ad437"
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
