class KsrCli < Formula
  desc "CLI tool for Kafka Schema Registry"
  homepage "https://github.com/aywengo/ksr-cli"
  version "0.2.0"
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.2.0/ksr-cli-darwin-amd64.tar.gz"
    sha256 "6fb191387ee9a2aa4cec1523ca81cdf7ae8c398f723f99a35845246bfba85abd"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aywengo/ksr-cli/releases/download/v0.2.0/ksr-cli-darwin-arm64.tar.gz"
    sha256 "276c6c4e2f57d7ee6edff327c6c4013904f07d8d03ce24a5f8286461e9f09267"
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
