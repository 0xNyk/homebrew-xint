class XintRs < Formula
  desc "Fast X Intelligence CLI in Rust"
  homepage "https://github.com/0xNyk/xint-rs"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/0xNyk/xint-rs/releases/download/2026.3.3.1/xint-rs-macos-arm64-2026.3.3.1.tar.gz"
    sha256 "a306444e046e545c96e5726c1f1439f12e6b3005f3086f71b99ec33790f8c895"
  else
    url "https://github.com/0xNyk/xint-rs/archive/refs/tags/2026.3.3.1.tar.gz"
    sha256 "f42ee9561501e778bd3230cc421952a36b58bedf0a1854cdbd72b465097b8382"
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
