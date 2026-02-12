class Neurobox < Formula
  desc "OCI-Compatible Transactional Sandbox"
  homepage "https://github.com/vikas-magar/Neurobox"
  version "0.8.0"

  url "https://github.com/vikas-magar/Neurobox/releases/download/v#{version}/neurobox-macos.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  def install
    bin.install "neurobox" => "nbx"
  end

  def post_install
    system "xattr", "-d", "com.apple.quarantine", "#{bin}/nbx" rescue nil
    system "codesign", "--force", "-s", "-", "#{bin}/nbx" rescue nil
  end

  test do
    system "#{bin}/nbx", "--help"
  end
end
