class XintRs < Formula
  desc "Fast X Intelligence CLI in Rust"
  homepage "https://github.com/0xNyk/xint-rs"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/0xNyk/xint-rs/releases/download/2026.2.19.7/xint-rs-macos-arm64-2026.2.19.7.tar.gz"
    sha256 "69ccad109461be08ceb54073270a3c1c185b69081fc6de1614a5f34dc46b8bc0"
  else
    url "https://github.com/0xNyk/xint-rs/archive/refs/tags/2026.2.19.7.tar.gz"
    sha256 "dd9de50efdaac9b877a8085d277ff47dcf09fca4abbaccf16571b0df7a8afd8f"
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
