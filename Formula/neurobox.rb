class Neurobox < Formula
  desc "OCI-Compatible Transactional Sandbox"
  homepage "https://nbx.vercel.app"
  version "1.0.5"

  url "https://github.com/vikas-magar/homebrew-neurobox/releases/download/v#{version}/neurobox-macos.tar.gz"
  sha256 "acd82d5032cadbb887d09940bcacd57e6d70265188885ed55c25e892e4fd397e"

  def install
    binary = "neurobox"
    system "codesign", "--force", "-s", "-", binary rescue nil
    bin.install "neurobox" => "nbx"
  end

  test do
    system "#{bin}/nbx", "--help"
  end
end
