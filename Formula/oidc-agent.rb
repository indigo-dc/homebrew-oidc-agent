class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v5.0.0.tar.gz"
  sha256 "c9a56025a88bec9477fcc92feeeeaa22a7d294d18e7201fd97211354877f1aa9"
  license "MIT"

  bottle do
    root_url "https://github.com/indigo-dc/homebrew-oidc-agent/releases/download/oidc-agent-4.5.2"
    sha256 ventura:  "040e147fec42b35e5653faa3150367fdcd5fed54b5964c09f3e46b9db4c1b390"
    sha256 monterey: "df277d004a0f22f88d1c8ca382a7480785bcd9f8b33582442a8efc8eaf3b3d25"
    sha256 big_sur:  "d044be06d18a4dc6ddeb05c146003bb05468a8f3e6901f38f4a809106505697a"
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
