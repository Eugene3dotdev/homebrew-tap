class Z3store < Formula
  desc "Separate .git and .jj databases from working trees for cloud-synced folders"
  homepage "https://github.com/EugOT/z3store"

  url "https://github.com/EugOT/z3store/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f0aafaf3e9f5ae2aa935e7d90cd3e439590c2977ae39fda271da3173c29a27d4"
  license "MIT"

  head "https://github.com/EugOT/z3store.git", branch: "main"

  depends_on "zig" => :build

  def install
    zig_version = Utils.safe_popen_read("zig", "version").strip
    odie "z3store requires Zig 0.16.x; found #{zig_version}" unless zig_version.start_with?("0.16.")

    system "zig", "build", *std_zig_args(release_mode: :safe)
  end

  test do
    ENV["HOME"] = testpath
    assert_match "Usage: zt", shell_output("#{bin}/zt --help 2>&1")
    system bin/"zt", "init"
  end
end
