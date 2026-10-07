# frozen_string_literal: true

# Formula for installing tf-slate from source.
class TfSlate < Formula
  desc "Discover and summarize local Terraform state files"
  homepage "https://github.com/abuxton/tf-slate"
  version "0.1.0"
  url "https://github.com/abuxton/tf-slate/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0360ea186c8ee326acce03b1b2036cdcbdde40dd68678168f302e52837e8594b"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"tf-slate"), "./cmd/tf-slate"
  end

  test do
    output = shell_output("#{bin}/tf-slate -non-interactive -root #{testpath}")
    assert_match "No Terraform state files found under", output
  end
end
