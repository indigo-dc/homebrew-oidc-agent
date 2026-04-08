class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v5.3.5.tar.gz"
  sha256 "aaa212730560caea21d4d3b72218c55e5eeec1f776d711f58044339f168ed60a"
  license "MIT"

  bottle do
    root_url "https://github.com/indigo-dc/homebrew-oidc-agent/releases/download/oidc-agent-5.3.5"
    sha256 arm64_tahoe:   "31e72087a66d806fe080230e056c39d648dd81860a8587a904be40157d648170"
    sha256 arm64_sequoia: "101c1963026a566d25cd43aee900fa88a8d75b1b28f6baf03dbd6e0b190f1caf"
    sha256 arm64_sonoma:  "9457b5b9f1f2c9d4d31c04de45ff7e8b301b48a903a0cb19b4bb179735fca771"
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

  service do
    run [opt_bin/"oidc-agent", "-a", "~/Library/Caches/oidc-agent/oidc-agent.sock", "-d"]
    keep_alive true
    working_dir var
    log_path var/"log/oidc-agent.log"
    error_log_path var/"log/oidc-agent.log"
    environment_variables PATH: "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/homebrew/bin"
  end

  def caveats
    <<~EOS
      To start oidc-agent as a background service now and restart at login:
        brew services start oidc-agent
      If you don't need a background service, you can run the following instead:
        oidc-agent -a ~/Library/Caches/oidc-agent/oidc-agent.sock -d
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oidc-agent --version")
  end
end
