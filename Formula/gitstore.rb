class Gitstore < Formula
  desc "Legacy formula for z3store"
  homepage "https://github.com/EugOT/z3store"

  url "https://github.com/EugOT/z3store/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f0aafaf3e9f5ae2aa935e7d90cd3e439590c2977ae39fda271da3173c29a27d4"
  license "MIT"

  deprecate! date: "2026-07-06", because: "was renamed to z3store", replacement_formula: "z3store"

  depends_on "z3store"

  def install
    bin.install_symlink formula_opt_bin("z3store")/"zt" => "gitstore"
  end

  test do
    ENV["HOME"] = testpath
    assert_match "Usage: zt", shell_output("#{bin}/gitstore --help 2>&1")
    system bin/"gitstore", "init"
  end
end
