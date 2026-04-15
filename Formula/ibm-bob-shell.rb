# frozen_string_literal: true

class IbmBobShell < Formula
  desc "Installs IBM BOB Shell using the official curl installer command"
  homepage "https://bob.ibm.com/download?bob=shell"
  url "https://bob.ibm.com/download/bobshell.sh"
  version "2026.04.15"
  sha256 :no_check
  license :cannot_represent

  def install
    (bin/"ibm-bob-shell").write <<~SH
      #!/usr/bin/env bash
      set -euo pipefail
      tmp_script="$(mktemp "${TMPDIR:-/tmp}/bobshell.XXXXXX.sh")"
      trap 'rm -f "$tmp_script"' EXIT
      curl -fsSL https://bob.ibm.com/download/bobshell.sh -o "$tmp_script"
      bash "$tmp_script"
    SH
    chmod 0755, bin/"ibm-bob-shell"
  end

  test do
    script = bin/"ibm-bob-shell"
    assert_predicate script, :exist?
    assert_match "curl -fsSL https://bob.ibm.com/download/bobshell.sh -o \"$tmp_script\"", script.read
  end
end
