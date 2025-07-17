class OidcAgent < Formula
  desc "Manage OpenID Connect tokens on the command-line"
  homepage "https://github.com/indigo-dc/oidc-agent"
  url "https://github.com/indigo-dc/oidc-agent/archive/refs/heads/prerel.tar.gz"
  sha256 "5114ecd9cdce12453efe81f6a83f0c21c667277df90fc69a19be5c991b451aae"
  license "MIT"

  bottle do
    root_url "https://github.com/indigo-dc/homebrew-oidc-agent/releases/download/oidc-agent-5.2.3"
    sha256 arm64_sonoma: "4f18f0aec9632aa0f814a43ea9532c79f3830fd136518a4e8d91e99ad68c1d2e"
    sha256 ventura:      "757edc3e4cb2c8dc3c5c50429b4781268b5de8e7d479457ba7573e290a12156d"
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
