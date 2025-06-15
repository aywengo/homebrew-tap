class KsrCli < Formula
  desc "CLI tool for Kafka Schema Registry"
  homepage "https://github.com/aywengo/ksr-cli"
  version "0.1.0"
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.1.0/ksr-cli-darwin-amd64.tar.gz"
    sha256 "e967a2ad2a60b07e96ea4accd7db4f087c19ae5cc01854de4f3c4f38df3b8a3f"  # This needs to be updated with actual checksum
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.1.0/ksr-cli-darwin-arm64.tar.gz"
    sha256 "18b2f834a2192a65aaf5e59b4ae97080a09f5f25786bc1fcaef9cfbc35ccd07d"
  else
    odie "ksr-cli is only supported on macOS"
  end
  
  def install
    bin.install "ksr-cli"
  end
  
  test do
    system "#{bin}/ksr-cli", "--help"
  end
end
