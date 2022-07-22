class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v4.3.2.tar.gz"
  sha256 "8f18afa7a066e7a781d3c239afd183115205edacfd58806906c9f48f24bfe2b0"
  license "MIT"

  bottle do
    root_url "https://github.com/indigo-dc/homebrew-oidc-agent/releases/download/oidc-agent-4.3.2"
    sha256 big_sur:  "1bf5dd8d424d183e555a054f5acb506f03670bd8c7fb69a692b3e9a4dd4379a9"
    sha256 catalina: "6bb3d8183c59ca4263f8818349da548987116906661d78635b8c088deef5a6f2"
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
