# frozen_string_literal: true

# Formula for installing Klaw, a CLI for AI agent orchestration.
class Klaw < Formula
  desc 'Kubectl for AI agents'
  homepage 'https://klaw.sh'
  version '2026.03.29.1'
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/klawsh/klaw.sh/releases/download/2026.03.29.1/klaw-darwin-arm64'
      sha256 '4c1b7284319bb47c03c3221b75db13314231d92dc0bc3eef01b4935e41f32023'
    else
      url 'https://github.com/klawsh/klaw.sh/releases/download/2026.03.29.1/klaw-darwin-amd64'
      sha256 '1b75b5a51ea9a3bb93a1e2cb48308d7d33487a95e1a9ff78129927cb41a52864'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url 'https://github.com/klawsh/klaw.sh/releases/download/2026.03.29.1/klaw-linux-arm64'
      sha256 '754e981c5cc56f34ad184b7c4ceddcbe54a96cad33995432677e8be361305f9c'
    else
      url 'https://github.com/klawsh/klaw.sh/releases/download/2026.03.29.1/klaw-linux-amd64'
      sha256 'eb9208e22bc318d0fdd20bcddcd1725e98d01f78480f7e2a4ac3652f24daf49b'
    end
  end

  def install
    bin.install Dir['klaw-*'].first => 'klaw'
  end

  test do
    assert_match 'klaw v', shell_output("#{bin}/klaw version")
  end
end
