class KsrCli < Formula
  desc "CLI tool for Kafka Schema Registry"
  homepage "https://github.com/aywengo/ksr-cli"
  version "0.1.2"
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.1.2/ksr-cli-darwin-amd64.tar.gz"
    sha256 "36742c975801c995358987ae04fd745adce1be683efc3fb4f1a1b9346c5ccc1d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.1.2/ksr-cli-darwin-arm64.tar.gz"
    sha256 "eafba59db55a5638bd465eab736bb92e5a8a190d005897f6632e14d4d4375183"
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
