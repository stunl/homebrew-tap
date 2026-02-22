class Stunl < Formula
  desc "Fast and secure tunneling solution for exposing local services"
  homepage "https://stunl.com"
  version "5.27.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stunl/cli/releases/download/v5.27.5/stunl-darwin-arm64"
      sha256 "5ed812d51bfecae2254cf4eaf681241bb3741f47b315a35bac9d89d828e98c54"
    else
      url "https://github.com/stunl/cli/releases/download/v5.27.5/stunl-darwin-amd64"
      sha256 "941ffc6169694684cd676e4f26acb3228b938d192ec9ff15bca35bf60f4d92ef"
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
