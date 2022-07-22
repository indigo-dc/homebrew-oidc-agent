class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v4.3.2.tar.gz"
  sha256 "8f18afa7a066e7a781d3c239afd183115205edacfd58806906c9f48f24bfe2b0"
  license "MIT"

  bottle do
    root_url "https://github.com/indigo-dc/homebrew-oidc-agent/releases/download/oidc-agent-4.3.1"
    sha256 cellar: :any, big_sur:  "7fa3636d60776ec1db5c31fa18977f813ef0cc3b703722d8a3c6474ad60ea2cd"
    sha256 cellar: :any, catalina: "c8236cf49f425619f0e0068812207d9ebf0a048e7d7cdf9de381dc15a6ce88bc"
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
