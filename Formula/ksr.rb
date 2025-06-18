class Ksr < Formula
  desc "CLI tool for Kafka Schema Registry"
  homepage "https://github.com/aywengo/ksr-cli"
  version "0.2.3"
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.2.3/ksr-cli-darwin-amd64.tar.gz"
    sha256 "5bb1d1a0dd16c2559001412bd2b34e889e3f973c47e70d70e3e3480f61485ae8"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.2.3/ksr-cli-darwin-arm64.tar.gz"
    sha256 "649bd9152d245652d00a5701fe45a815d0c2ea5ebdd99d9dcc33b5666bbdc80c"
  else
    odie "ksr is only supported on macOS"
  end
  
  def install
    bin.install "ksr-cli"
    # Create a symlink from ksr to ksr-cli
    bin.install_symlink "ksr-cli" => "ksr"
  end
  
  test do
    system "#{bin}/ksr-cli", "--help"
    # Also test the symlink
    system "#{bin}/ksr", "--help"
  end
end
