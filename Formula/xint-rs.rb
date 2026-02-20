class XintRs < Formula
  desc "Fast X Intelligence CLI in Rust"
  homepage "https://github.com/0xNyk/xint-rs"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/0xNyk/xint-rs/releases/download/2026.2.20.2/xint-rs-macos-arm64-2026.2.20.2.tar.gz"
    sha256 "5e39443786746cd05fa1fe85947003116870d43e58ed9e6e6b871ece580c26ab"
  else
    url "https://github.com/0xNyk/xint-rs/archive/refs/tags/2026.2.20.2.tar.gz"
    sha256 "ee3d44b4a988fc7aee4c0158e70c3c6464912cfadb322477161c5a33c1cf2a02"
    depends_on "rust" => :build
  end
  conflicts_with "xint", because: "both install the xint executable"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "xint"
    else
      system "cargo", "install", *std_cargo_args(path: ".")
    end
  end

  test do
    assert_match "X Intelligence CLI", shell_output("#{bin}/xint --help")
  end
end
