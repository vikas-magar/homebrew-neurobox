class Neurobox < Formula
  desc "OCI-Compatible Transactional Sandbox"
  homepage "https://github.com/vikas-magar/Neurobox"
  version "0.18.0"

  url "https://github.com/vikas-magar/homebrew-neurobox/releases/download/v0.18.0/neurobox-macos.tar.gz"
  sha256 "6eec8123af91559f44b8e3a0a171bca06452a7a4a9455d7a1717079f7aebaa76"

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
