# homebrew-xint

Official Homebrew tap for `xint`.

The Homebrew package installs the Rust implementation (`xint-rs`) and exposes the `xint` CLI command.

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
brew upgrade xint
```

## Notes

- `xint` in this tap is an alias to `xint-rs` for the best Homebrew UX and binary reliability.
- The TypeScript/Bun implementation remains available via curl installer:

```bash
curl -fsSL https://raw.githubusercontent.com/0xNyk/xint/main/install.sh | bash
```
