class KsrCli < Formula
  desc "CLI tool for Kafka Schema Registry"
  homepage "https://github.com/aywengo/ksr-cli"
  version "0.2.3"
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.2.3/ksr-cli-darwin-amd64.tar.gz"
    sha256 "673b6c63df7e38d9b81c305a24a7b851b2feaa2d3fc66caaae74ea6892d22ae1"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.2.3/ksr-cli-darwin-arm64.tar.gz"
    sha256 "833afa44167fe7d1577ade95728db0c1a89ec71aa70b1436b70575ced526f641"
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
