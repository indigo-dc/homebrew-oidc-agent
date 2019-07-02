# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class OidcAgent < Formula
  desc "oidc-agent is a set of tools to manage OpenID Connect tokens and make them easily usable from the command line. We followed the ssh-agent design, so users can handle OIDC tokens in a similiar way as they do with ssh keys."
  homepage "https://github.com/indigo-dc/oidc-agent/"
  url "https://api.github.com/repos/indigo-dc/oidc-agent/tarball/v3.1.2"
  version "3.1.2"
  sha256 "64c1c61923950962c7156038aa7a92c341bad3f9740f6ad2454ffdddb3fd13b9"

  depends_on "pkg-config"
  depends_on "argp-standalone"
  depends_on "libsodium"
  depends_on "libmicrohttpd"
  depends_on "help2man"
  depends_on "zachmann/x11-ssh-askpass/x11-ssh-askpass" => :recommended

  def install
    system "make -j1"
    system "make install PREFIX=#{prefix}"
  end

  test do
    system "make test"
  end
end
