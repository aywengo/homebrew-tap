class KsrCli < Formula
  desc "CLI tool for Kafka Schema Registry"
  homepage "https://github.com/aywengo/ksr-cli"
  version "0.1.0"
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.1.0/ksr-cli-darwin-amd64.tar.gz"
    sha256 "e967a2ad2a60b07e96ea4accd7db4f087c19ae5cc01854de4f3c4f38df3b8a3f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.1.0/ksr-cli-darwin-arm64.tar.gz"
    sha256 "56cbf85c9c3e6a5797e3cde60c825b09b4d09feb5f65bb09c4b96c7ae8d96c43"
  else
    odie "ksr-cli is only supported on macOS"
  end
  
  def install
    bin.install "ksr-cli"
    
    # Generate completions
    generate_completions_from_executable(bin/"ksr-cli", "completion")
  end
  
  test do
    system "#{bin}/ksr-cli", "help"
  end
end
