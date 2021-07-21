# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class OidcAgent < Formula
  desc "oidc-agent is a set of tools to manage OpenID Connect tokens and make them easily usable from the command line. We followed the ssh-agent design, so users can handle OIDC tokens in a similiar way as they do with ssh keys."
  homepage "https://github.com/indigo-dc/oidc-agent/"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v4.1.1-mac.tar.gz"
  version "4.1.1-2"
  sha256 "11615d3d0e0e5d415de1b8ef32f85b68a73d8ac547113c4f081df8445855e51f"
  license "MIT"

  depends_on "pkg-config"
  depends_on "argp-standalone"
  depends_on "libsodium"
  depends_on "libmicrohttpd"
  depends_on "help2man"
  depends_on "jq"
  # We also depend (recommend) on pashua which is installable as cask. We
  # currently cannot depend on casks. It's included in the docu.

  def install
    system "make -j1"
    system "make install PREFIX=#{prefix}"
  end

  test do
    system "make test"
  end
end
