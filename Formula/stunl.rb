class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.8.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.8.6/stunl-darwin-arm64"
      sha256 "176fb52e5cca4289dabcfc8ecd10d0aac4b893d6719f7d317eaa4dcf5aefa9a3"
    else
      url "https://github.com/stunl/cli/releases/download/v5.8.6/stunl-darwin-amd64"
      sha256 "3505a0532150144fd6cc3579c059ce3fee8e61b2b15f29b67331102880277b3f"
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
