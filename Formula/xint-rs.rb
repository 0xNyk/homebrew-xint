class XintRs < Formula
  desc "Fast X Intelligence CLI in Rust"
  homepage "https://github.com/0xNyk/xint-rs"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/0xNyk/xint-rs/releases/download/2026.2.19.6/xint-rs-macos-arm64-2026.2.19.6.tar.gz"
    sha256 "df7aed1adefe0311d41cec1136e0b1af720e0611c487af09f13625919521d933"
  else
    url "https://github.com/0xNyk/xint-rs/archive/refs/tags/2026.2.19.6.tar.gz"
    sha256 "16a27ce57d481f43b8a7fb446fdb201b31c53653a374be836403d71232cafbd2"
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
