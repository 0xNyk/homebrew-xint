class XintRs < Formula
  desc "Fast X Intelligence CLI in Rust"
  homepage "https://github.com/0xNyk/xint-rs"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/0xNyk/xint-rs/releases/download/2026.3.2.1/xint-rs-macos-arm64-2026.3.2.1.tar.gz"
    sha256 "e347a8d73cbd49959671705df51296c08fb1d28dd785a043414d79bf228169dd"
  else
    url "https://github.com/0xNyk/xint-rs/archive/refs/tags/2026.3.2.1.tar.gz"
    sha256 "c8be38a7cd767cdfb81c697cc978642488a43e0ee411e55c7b8184910ecc267f"
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
