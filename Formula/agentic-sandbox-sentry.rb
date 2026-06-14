class AgenticSandboxSentry < Formula
  desc "Runtime safety guard for local AI coding agents (command monitoring + audit)"
  homepage "https://github.com/Hellotravisss/agentic-sandbox-sentry"
  url "https://github.com/Hellotravisss/agentic-sandbox-sentry/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "6f3af153691f712e96e6d03a97865596f768264910a2c03b58d5b5de8163cc80"
  license "MIT"

  depends_on "fswatch"
  depends_on "jq"
  depends_on :macos

  def install
    # sentryctl resolves its sibling scripts relative to its own path, so the
    # whole runtime tree must stay together. Install it under libexec and put
    # a thin wrapper on PATH (a symlink would break that path resolution).
    libexec.install Dir["*"]
    (bin/"sentryctl").write <<~SH
      #!/bin/bash
      exec "#{libexec}/sentryctl" "$@"
    SH
  end

  def caveats
    <<~EOS
      Agentic Sandbox Sentry is installed but not yet active. To enable the
      zsh command monitor and Claude Code / Codex integrations, run the
      installer once from the formula's files:

        "#{libexec}/install.sh"

      Manage it any time with:  sentryctl

      Config and logs live in ~/.agentsentry. Default mode is soft-block;
      switch with 'sentryctl mode <audit|warn|dry-run|soft-block|hard>'.
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/sentryctl version")
    assert_match "SAFE", shell_output("#{bin}/sentryctl check -- 'git status'")
    assert_match "DANGEROUS",
      shell_output("#{bin}/sentryctl check -- 'sudo rm -rf /etc' 2>&1", 1)
  end
end
