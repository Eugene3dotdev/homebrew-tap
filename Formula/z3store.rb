class Z3store < Formula
  desc "Separate z3store (formerly gitstore) Git/JJ databases from working trees"
  homepage "https://github.com/Eugene3dotdev/z3store"
  url "https://github.com/Eugene3dotdev/z3store/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "4e612fb24f0d1b10e9904a360e3163d7a0f46af5d5837fe351149405d36293aa"
  license "MIT"
  head "https://github.com/Eugene3dotdev/z3store.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :git
  end

  # z3store is pinned to Zig 0.16; core `zig` moved to 0.17, which does not
  # build this source. The versioned formula replaces the old runtime check.
  depends_on "zig@0.16" => :build

  conflicts_with "gitstore", because: "both install store managers for the same data layout"

  def install
    system "zig", "build", *std_zig_args(release_mode: :safe)
  end

  test do
    assert_match "Usage: zt", shell_output("#{bin}/zt --help 2>&1")
    # From 0.4.0 (`zt --version` prints "zt <version>"), switch to:
    #   assert_equal "zt #{version}", shell_output("#{bin}/zt --version").strip
  end
end
