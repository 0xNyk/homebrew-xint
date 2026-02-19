# homebrew-xint

Official Homebrew tap for:

- `xint` (recommended package name)
- `xint-rs` (explicit Rust variant)

## Install

```bash
brew tap 0xNyk/xint
brew install xint
```

Install explicitly via formula name:

```bash
brew install xint-rs
```

## Upgrade

```bash
brew update
brew upgrade xint xint-rs
```

## Notes

- `xint` and `xint-rs` currently package the same Rust implementation and both install the `xint` executable.
- Homebrew will treat them as conflicting formulas; install one or the other.
- The TypeScript/Bun implementation remains available via curl installer:

```bash
curl -fsSL https://raw.githubusercontent.com/0xNyk/xint/main/install.sh | bash
```
