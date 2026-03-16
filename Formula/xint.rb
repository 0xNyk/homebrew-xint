class Xint < Formula
  desc "X Intelligence CLI"
  homepage "https://github.com/0xNyk/xint-rs"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/0xNyk/xint-rs/releases/download/2026.3.16/xint-rs-macos-arm64-2026.3.16.tar.gz"
    sha256 "d453e871583d0b9c145dd917e270d5490d242a193edc58a151c9a4e22bb63bbe"
  else
    url "https://github.com/0xNyk/xint-rs/archive/refs/tags/2026.3.16.tar.gz"
    sha256 "dd92c6347d9fbc8bc89d1abee48c25333cd51c13d4b18b600f0dc25269d90c95"
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
