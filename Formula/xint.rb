class Xint < Formula
  desc "X Intelligence CLI for search, analysis, and agent workflows on X/Twitter"
  homepage "https://github.com/0xNyk/xint"
  url "https://github.com/0xNyk/xint/archive/refs/tags/2026.2.19.6.tar.gz"
  sha256 "8130610d121e77968d4f0825d740ee210cc381cd0bba52ff8285d8f600069816"
  license "MIT"

  depends_on "bun"

  def install
    ENV["BUN_INSTALL_CACHE_DIR"] = buildpath/"bun-cache"
    ENV["XDG_CACHE_HOME"] = buildpath/"xdg-cache"

    libexec.install Dir["*"]
    cd libexec do
      system Formula["bun"].opt_bin/"bun", "install", "--frozen-lockfile", "--production"
    end

    (bin/"xint").write <<~EOS
      #!/bin/bash
      exec "#{Formula["bun"].opt_bin}/bun" run "#{libexec}/xint.ts" "$@"
    EOS
  end

  test do
    assert_match "X Intelligence CLI", shell_output("#{bin}/xint --help")
  end
end
