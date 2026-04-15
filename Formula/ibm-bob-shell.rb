# frozen_string_literal: true

class IbmBobShell < Formula
  desc "Installs IBM BOB Shell using the official curl installer command"
  homepage "https://bob.ibm.com/download?bob=shell"
  url "https://bob.ibm.com/download/bobshell.sh"
  version :latest
  sha256 :no_check
  license :cannot_represent

  def install
    installer = Dir["*.sh"].first
    odie "Unable to find IBM BOB Shell installer script in downloaded source" if installer.nil?

    libexec.install installer => "bobshell.sh"
    chmod 0755, libexec/"bobshell.sh"
    bin.install_symlink libexec/"bobshell.sh" => "ibm-bob-shell"
  end

  test do
    assert_predicate bin/"ibm-bob-shell", :exist?
    assert_predicate libexec/"bobshell.sh", :exist?
  end
end
