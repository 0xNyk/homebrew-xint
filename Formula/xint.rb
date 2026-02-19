class Xint < Formula
  desc "X Intelligence CLI"
  homepage "https://github.com/0xNyk/xint-rs"
  url "https://github.com/0xNyk/xint-rs/archive/refs/tags/2026.2.19.6.tar.gz"
  sha256 "16a27ce57d481f43b8a7fb446fdb201b31c53653a374be836403d71232cafbd2"
  license "MIT"

  depends_on "rust" => :build
  conflicts_with "xint-rs", because: "both install the xint executable"

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "X Intelligence CLI", shell_output("#{bin}/xint --help")
  end
end
