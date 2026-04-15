# frozen_string_literal: true

class TfSlate < Formula
  desc "Discover and summarize local Terraform state files"
  homepage "https://github.com/abuxton/tf-slate"
  version "0.0.0-b5ed27c"
  url "https://github.com/abuxton/tf-slate/archive/b5ed27cb440eb83080205193d61286181acbcdae.tar.gz"
  sha256 "b527f1229f2e51ed6c965a96cae07d11e06c60b6ba12847e9f0a2ebb50dbc432"
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
