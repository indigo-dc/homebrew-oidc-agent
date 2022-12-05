class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v4.4.3.tar.gz"
  sha256 "ca9bdf336a4056225925897e17e6c4adab94370521dedca7fbe03a62bf881d46"
  license "MIT"

  bottle do
    root_url "https://github.com/indigo-dc/homebrew-oidc-agent/releases/download/oidc-agent-4.4.3"
    sha256 monterey: "3aad6775b360c6da81b48e0dbd244a5ee352328d1bd2d949a16e68948d1ca598"
    sha256 big_sur:  "a58f1e663ab6db18898bbe8cfb05ba8cdcd86f59d9f0e4946f9e2a5fd3537731"
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
