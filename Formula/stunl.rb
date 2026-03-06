class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.34.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.34.0/stunl-darwin-arm64"
      sha256 "3149c46f3dd72cdc433c52da8a393c636abc1f5e3efc9ac5e3f39fb41a5a4152"
    else
      url "https://github.com/stunl/cli/releases/download/v5.34.0/stunl-darwin-amd64"
      sha256 "af053f78ac41fb585f73337141de7b617af276f642e505a9bcf659f89a34733c"
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
