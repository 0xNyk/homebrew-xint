class Xint < Formula
  desc "X Intelligence CLI"
  homepage "https://github.com/0xNyk/xint-rs"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/0xNyk/xint-rs/releases/download/2026.3.17/xint-rs-macos-arm64-2026.3.17.tar.gz"
    sha256 "82e3fb56ed6b0fbd965ec3b696c3a2539926dc36c789a20fd34617b560040485"
  else
    url "https://github.com/0xNyk/xint-rs/archive/refs/tags/2026.3.17.tar.gz"
    sha256 "3f27966371d4412021e5a76e2fe19744f8f2bea4363984de6ae796c8246a0973"
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
