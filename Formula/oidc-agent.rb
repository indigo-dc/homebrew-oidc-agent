class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/heads/prerel.tar.gz"
  sha256 "b3b48ecfd0366b7ff1745ed071a05ac0d68f1dc100ef720961571f71653b560d"
  license "MIT"

  bottle do
    root_url "https://github.com/indigo-dc/homebrew-oidc-agent/releases/download/oidc-agent-4.5.1"
    sha256 monterey: "fe948eae93473cfecd384ccecdc480a3117ef4626b3b2478e5f7e31b96010b42"
    sha256 big_sur:  "4ec0f2c54f68ea0c82058c14271e90eae88af21eda42af10ed163272ed471f5b"
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
