class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v4.3.0.tar.gz"
  sha256 "c173b2bcef50ec21ed30ee5eebc428c634bee7daa7e6d80dfd0ff91089eb3fe5"
  license "MIT"

  bottle do
    root_url "https://github.com/indigo-dc/homebrew-oidc-agent/releases/download/oidc-agent-4.2.6"
    rebuild 1
    sha256 big_sur:  "f12a3904829726915f73f7cedca04feaa320055ebf218ed18b92b0221c0e0217"
    sha256 catalina: "680bd64ea97b14dfb78870ad73f39135a6c5d0f36c3303f564aaffb59f219998"
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
