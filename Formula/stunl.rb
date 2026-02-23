class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.25/stunl-darwin-arm64"
      sha256 "856292f240a45745502003a3bc694feeeb49a72d25efbad158cc28351a060a4c"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.25/stunl-darwin-amd64"
      sha256 "3ca4f25f7b95e63d6c2bd429758f48600c00edcdf3e79aa68c8fe5009be54299"
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
