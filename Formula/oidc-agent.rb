class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent/"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/heads/dev_4.3.0.tar.gz"
  version "4.3.0"
  sha256 "1a3624ca38f0814a984c5ad025a0b12ca2e9c6663236b69d6272f39144d4d86e"
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
