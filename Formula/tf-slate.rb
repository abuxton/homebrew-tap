# frozen_string_literal: true

# Formula for installing tf-slate from source.
class TfSlate < Formula
  desc "Discover and summarize local Terraform state files"
  homepage "https://github.com/abuxton/tf-slate"
  version "0.0.0-b5ed27c"
  url "https://github.com/abuxton/tf-slate/archive/b5ed27cb440eb83080205193d61286181acbcdae.tar.gz"
  sha256 "9c73aa53d25387cd1912236f924e9b1e7d5725ed8fedf036cc2c770724bdafc6"
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
