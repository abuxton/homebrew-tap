# frozen_string_literal: true

class Docling < Formula
  desc "SDK and CLI for parsing documents"
  homepage "https://github.com/docling-project/docling"
  url "https://files.pythonhosted.org/packages/e8/a1/5e6b3fe053e59725bded55a54320b75b2afcfdb8f03a38c024105727424b/docling-2.145.0-py3-none-any.whl"
  sha256 "167e7a4736498585040d1680fa93fe582d8c033ee0fdc7e0a39d3b47fcfa545e"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--no-cache-dir", cached_download
    bin.install_symlink libexec/"bin/docling"
    bin.install_symlink libexec/"bin/docling-tools"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/docling --help")
  end
end
