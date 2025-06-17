class KsrCli < Formula
  desc "CLI tool for Kafka Schema Registry"
  homepage "https://github.com/aywengo/ksr-cli"
  version "0.2.1"
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.2.1/ksr-cli-darwin-amd64.tar.gz"
    sha256 "679e358f2f08d57c7894feac11bace803c14f713f38f9c87a388c6cd648815f9"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.2.1/ksr-cli-darwin-arm64.tar.gz"
    sha256 "2178922480bd11a32db4a06c2d2715dae7471d0218d95a128c65e9e5952e28ca"
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
