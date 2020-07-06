# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class OidcAgent < Formula
  desc "oidc-agent is a set of tools to manage OpenID Connect tokens and make them easily usable from the command line. We followed the ssh-agent design, so users can handle OIDC tokens in a similiar way as they do with ssh keys."
  homepage "https://github.com/indigo-dc/oidc-agent/"
  url "https://api.github.com/repos/indigo-dc/oidc-agent/tarball/v3.3.2"
  version "3.3.2"
  sha256 "ae7d9257ca371710cc92afb7991392eb32ef3ad6c8101f9248cfc7817fd60be4"

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
