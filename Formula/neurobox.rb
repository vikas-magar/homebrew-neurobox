class Neurobox < Formula
  desc "OCI-Compatible Transactional Sandbox"
  homepage "https://github.com/vikas-magar/Neurobox"
  version "0.16.0"

  url "https://github.com/vikas-magar/Neurobox/releases/download/v0.16.0/neurobox-macos.tar.gz"
  sha256 "2ef6cfc0583ebc69f0bd7128c32ee277de0c0a50c2a7094a346de55dffafefa7"

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
