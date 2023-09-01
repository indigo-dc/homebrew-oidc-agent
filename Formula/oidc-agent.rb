class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v5.0.1.tar.gz"
  sha256 "f35d49c089273461afeaa63bb2c781ee487104220578068dea42f1112f6445dc"
  license "MIT"

  bottle do
    root_url "https://github.com/indigo-dc/homebrew-oidc-agent/releases/download/oidc-agent-5.0.1"
    sha256 ventura:  "74bf719b0c14d60ef765dc9749249ab5fa14b934a4a775fe90c5eb6a379de8de"
    sha256 monterey: "780eb334d01d08e8eeb7797cce08755db8529e1e19e9f9290cfbab1a0225168d"
    sha256 big_sur:  "1f8c1d905eb70db86a3d019b936fb62224ba9e154245cd3ded5bb50291d50c17"
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
