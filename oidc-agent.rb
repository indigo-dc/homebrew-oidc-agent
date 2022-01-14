# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class OidcAgent < Formula
  desc "oidc-agent is a set of tools to manage OpenID Connect tokens and make them easily usable from the command line. We followed the ssh-agent design, so users can handle OIDC tokens in a similiar way as they do with ssh keys."
  homepage "https://github.com/indigo-dc/oidc-agent/"
  url "https://api.github.com/repos/indigo-dc/oidc-agent/tarball/v4.2.6"
  version "4.2.6"
  sha256 "b42ebfd4ac2e9359d1a1ae383755cf5b82b6a0f10b53f70bd52df42b8885682b"
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
