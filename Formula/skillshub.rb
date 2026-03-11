# frozen_string_literal: true

# Formula for installing Skillshub - a package manager for AI coding agent skills.
# Builds from source using Rust and Cargo.
class Skillshub < Formula
  desc "Unified package manager for AI coding agent skills"
  homepage "https://github.com/EYH0602/skillshub"
  url "https://github.com/EYH0602/skillshub/archive/refs/tags/0.1.10.tar.gz"
  sha256 "4e8b28de47ce8699ca4cc7461d9a911cfa0208d43520f7df95fc8ba0cede1960"
  license "MIT"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  def test
    system "#{bin}/skillshub", "list"
  end
end
