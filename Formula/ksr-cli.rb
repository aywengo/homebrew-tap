class KsrCli < Formula
  desc "CLI tool for Kafka Schema Registry"
  homepage "https://github.com/aywengo/ksr-cli"
  version "0.1.1"
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.1.1/ksr-cli-darwin-amd64.tar.gz"
    sha256 "5b6f74229e0d2c3a1866232aa10c753e652713f2b39c518b7e6aec115a737fda"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.1.1/ksr-cli-darwin-arm64.tar.gz"
    sha256 "5db8173967d43a4ab2b54eaacdb20c033340b368a0826559adf4f01b98c5e11c"
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
