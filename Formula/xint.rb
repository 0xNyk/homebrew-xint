class Xint < Formula
  desc "X Intelligence CLI"
  homepage "https://github.com/0xNyk/xint-rs"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/0xNyk/xint-rs/releases/download/2026.5.16/xint-rs-macos-arm64-2026.5.16.tar.gz"
    sha256 "8253b3a3e13ebdc26674ab7a6b753eb9869b506cd37a204a589b867b0407b5be"
  else
    url "https://github.com/0xNyk/xint-rs/archive/refs/tags/2026.5.16.tar.gz"
    sha256 "fd672c98f693d980e694796e1c771e02ebf23ebb8483f8eab68463194fe5ed82"
    depends_on "rust" => :build
  end
  conflicts_with "xint-rs", because: "both install the xint executable"

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
