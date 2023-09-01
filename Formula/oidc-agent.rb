class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v5.0.1.tar.gz"
  sha256 "f35d49c089273461afeaa63bb2c781ee487104220578068dea42f1112f6445dc"
  license "MIT"

  bottle do
    root_url "https://github.com/indigo-dc/homebrew-oidc-agent/releases/download/oidc-agent-5.0.0"
    sha256 ventura:  "f4685ff85f87cdee605218767b4522163e8eaf2ccbc56ee322dac35224d2ecb0"
    sha256 monterey: "9a59cec67e2b4b4f1c8769339994a5effea54761a471c075df59e33ae047bb94"
    sha256 big_sur:  "8568424cfffebcaafc241fce7ef2e1babed158d921f395bd67adba0c84be0608"
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
