class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/v5.2.3.tar.gz"
  sha256 "62f33fa21e16783f8f109d1999206f7291f92df6d204efc1adc62727d5cd9489"
  license "MIT"

  bottle do
    root_url "https://github.com/indigo-dc/homebrew-oidc-agent/releases/download/oidc-agent-5.2.2"
    sha256 arm64_sonoma: "d4141497773b8380c26b374dd954f7c956c0a16c25a94a8544e284864c5b4c66"
    sha256 ventura:      "8ceebf785eb3834d53bc80b04676ea3e182006734c1fba4161696b37da3b2a1f"
    sha256 monterey:     "c6009cfc92ff6a8f27e03d5a96670fabdbff46a322f8c64d6759d9b3cec85252"
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
