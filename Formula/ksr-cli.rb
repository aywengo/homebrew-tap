class KsrCli < Formula
  desc "CLI tool for Kafka Schema Registry"
  homepage "https://github.com/aywengo/ksr-cli"
  version "0.2.2"
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.2.2/ksr-cli-darwin-amd64.tar.gz"
    sha256 "af461d9ea415c2b5d56146e8bfadd41bcdfedceaebbeb35dc815d1360502d993"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.2.2/ksr-cli-darwin-arm64.tar.gz"
    sha256 "ce922d3c36b3a60a34e6d8bbaef00d1691cc8fe5ae04388edb7935329af73667"
  else
    odie "ksr-cli is only supported on macOS"
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
