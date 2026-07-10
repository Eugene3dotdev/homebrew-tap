class Z3store < Formula
  desc "Separate z3store (formerly gitstore) Git/JJ databases from working trees"
  homepage "https://github.com/EugOT/z3store"

  url "https://github.com/EugOT/z3store/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f0aafaf3e9f5ae2aa935e7d90cd3e439590c2977ae39fda271da3173c29a27d4"
  license "MIT"

  head "https://github.com/EugOT/z3store.git", branch: "main"

  depends_on "zig" => :build

  conflicts_with "gitstore", because: "both install store managers for the same data layout"

  def install
    zig_version = Utils.safe_popen_read("zig", "version").strip
    odie "z3store requires Zig 0.16.x; found #{zig_version}" unless zig_version.start_with?("0.16.")

    system "zig", "build", "-Doptimize=ReleaseSafe"
    bin.install "zig-out/bin/zt"
  end

  test do
    assert_match "Usage: zt", shell_output("#{bin}/zt --help 2>&1")
  end
end
