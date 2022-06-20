class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent/"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/heads/dev_4.3.0.tar.gz"
  sha256 "ad3b2400a4abee2d875c793b510f5a3d2ab28465a34ec0d7e4f3c118b6a3a397"
  license "MIT"

  depends_on "help2man" => :build
  depends_on "argp-standalone"
  depends_on "jq"
  depends_on "libmicrohttpd"
  depends_on "libsodium"
  depends_on "pkg-config"
  depends_on "qrencode"

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "true"
  end
end
