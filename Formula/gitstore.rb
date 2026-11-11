class Gitstore < Formula
  desc "Separate .git and .jj databases from working trees for cloud-synced folders"
  homepage "https://github.com/EugOT/gitstore-cli"

  url "https://github.com/EugOT/gitstore-cli/archive/refs/tags/v0.2.2.tar.gz"
  version "0.2.2"
  sha256 "f8a5bc273994ead25c19cd3b01f3395a0f8f873e5572b971f40b915ca5cc9e11"
  license "MIT"

  head "https://github.com/EugOT/gitstore-cli.git", branch: "main"

  deprecate! date: "2026-07-05", because: "renamed to z3store (CLI: zt); brew install eugot/tap/z3store"

  depends_on "zig" => :build

  conflicts_with "z3store", because: "both install store managers for the same data layout"

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "--prefix", prefix
  end

  test do
    assert_match "Usage: gitstore", shell_output("#{bin}/gitstore --help 2>&1")
    system bin/"gitstore", "init"
  end
end
