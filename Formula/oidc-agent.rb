class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v5.2.0.tar.gz"
  sha256 "aea880d9d388e7ff96eaf800b224cbfc3a87ba29b99526f4efbc562e533bd3a6"
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
