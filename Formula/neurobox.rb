class Neurobox < Formula
  desc "OCI-Compatible Transactional Sandbox"
  homepage "https://nbx.vercel.app"
  version "0.18.0"

  url "https://github.com/vikas-magar/homebrew-neurobox/releases/download/v#{version}/neurobox-macos.tar.gz"
  sha256 "6eec8123af91559f44b8e3a0a171bca06452a7a4a9455d7a1717079f7aebaa76"

  def install
    binary = "neurobox"
    system "codesign", "--force", "-s", "-", binary rescue nil
    bin.install "neurobox" => "nbx"
  end

  test do
    system "#{bin}/nbx", "--help"
  end
end
