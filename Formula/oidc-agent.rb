class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/heads/master.tar.gz"
  sha256 "e3be2763c7ae4c039ac25f66fe25d86ef6057fa0c3fcc6a0872a49e1f9f671f4"
  license "MIT"
  version "4.4.3"

  bottle do
    root_url "https://github.com/indigo-dc/homebrew-oidc-agent/releases/download/oidc-agent-4.4.0"
    sha256 big_sur:  "757e1495a88a243c8b9a73af9e10542f4bebf0d9cffd0e87828c9fb6e6238dc2"
    sha256 catalina: "ed27410f643790ec4b378de194eded7c5e018141bfcfb24fa6e2c3edea8aed0f"
  end

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
