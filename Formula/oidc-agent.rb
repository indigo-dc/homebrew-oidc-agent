class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v4.4.3.tar.gz"
  sha256 "ca9bdf336a4056225925897e17e6c4adab94370521dedca7fbe03a62bf881d46"
  license "MIT"

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
