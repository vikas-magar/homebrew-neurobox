class Neurobox < Formula
  desc "OCI-Compatible Transactional Sandbox"
  homepage "https://nbx.vercel.app"
  version "1.0.4"

  url "https://github.com/vikas-magar/homebrew-neurobox/releases/download/v#{version}/neurobox-macos.tar.gz"
  sha256 "1102976b17ca5b4d5bd907e6c33af2acf818a553da8943c318acdc539fabbad3"

  def install
    binary = "neurobox"
    system "codesign", "--force", "-s", "-", binary rescue nil
    bin.install "neurobox" => "nbx"
  end

  test do
    system "#{bin}/nbx", "--help"
  end
end
