class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v4.5.1.tar.gz"
  sha256 "02a71e8ad3ba58870429b271f9632ffdfcd570586213ddfb014c12733be3559e"
  license "MIT"

  bottle do
    root_url "https://github.com/indigo-dc/homebrew-oidc-agent/releases/download/oidc-agent-4.5.0"
    sha256 monterey: "32ccc4286486559488224169ec2bb67feb7bd0e564db1db134dc84475b2cdce2"
    sha256 big_sur:  "b81fb24d59ea0a47fecd2293c50be0839d5c4fb6f91bbda1ed090f0d47c972a5"
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
