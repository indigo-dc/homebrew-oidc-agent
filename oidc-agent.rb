# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class OidcAgent < Formula
  desc "oidc-agent is a set of tools to manage OpenID Connect tokens and make them easily usable from the command line. We followed the ssh-agent design, so users can handle OIDC tokens in a similiar way as they do with ssh keys."
  homepage "https://github.com/indigo-dc/oidc-agent/"
  url "https://api.github.com/repos/indigo-dc/oidc-agent/tarball/v4.2.2"
  version "4.2.2"
  sha256 "a4e2c121909c0e407db56b2eeeab662661fcc735da309cef94b190b4efd0db8d"
  license "MIT"

  depends_on "pkg-config"
  depends_on "argp-standalone"
  depends_on "libsodium"
  depends_on "libmicrohttpd"
  depends_on "help2man"
  depends_on "jq"
  depends_on "qrencode"
  # We also depend (recommend) on pashua which is installable as cask. We
  # currently cannot depend on casks. It's included in the docu.

  def install
    system "make"
    system "make install PREFIX=#{prefix}"
  end

  test do
    system "make test"
  end
end
