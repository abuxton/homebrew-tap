# frozen_string_literal: true

# Formula for installing IBM BOB Shell.
class IbmBobShell < Formula
  desc "Installs IBM BOB Shell using the official curl installer command"
  homepage "https://bob.ibm.com/download?bob=shell"
  url "https://bob.ibm.com/download/bobshell.sh"
  version :latest
  sha256 :no_check
  license :cannot_represent

  def install
    odie "Expected installer script bobshell.sh not found in downloaded source" unless File.exist?("bobshell.sh")

    target_script = libexec/"bobshell.sh"
    libexec.install "bobshell.sh"
    chmod 0755, target_script
    bin.install_symlink target_script => "ibm-bob-shell"
  end

  test do
    assert_predicate bin/"ibm-bob-shell", :exist?
    assert_predicate bin/"ibm-bob-shell", :symlink?
    assert_equal (libexec/"bobshell.sh").to_s, (bin/"ibm-bob-shell").readlink.to_s
    assert_predicate libexec/"bobshell.sh", :exist?
    assert_predicate libexec/"bobshell.sh", :executable?
  end
end
