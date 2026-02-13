class Neurobox < Formula
  desc "OCI-Compatible Transactional Sandbox"
  homepage "https://nbx.vercel.app"
  version "1.0.7"

  url "https://github.com/vikas-magar/homebrew-neurobox/releases/download/v#{version}/neurobox-macos.tar.gz"
  sha256 "afce35fb383282087d0e70903afd389a47de3810d6529ea34701d4cee857ec8d"

  def install
    binary = "neurobox"
    chmod 0755, binary
    system("xattr", "-d", "com.apple.quarantine", binary) rescue puts "Note: Quarantine flag not present."
    system "codesign", "--entitlements", "entitlements.plist", "--force", "-s", "-", binary rescue nil
    bin.install "neurobox" => "nbx"
  end

  test do
    system "#{bin}/nbx", "--help"
  end
end
