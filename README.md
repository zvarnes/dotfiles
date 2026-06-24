# dotfiles

Personal dotfiles managed with [yadm](https://yadm.io), shared across macOS and
Debian/Ubuntu Linux.

## Install

```sh
yadm clone git@github.com:zvarnes/dotfiles.git
```

yadm checks out the files, resolves the OS-specific alternates (see below), and
prompts to run the bootstrap. To run it manually later:

```sh
yadm bootstrap
```

## What's tracked

| File | Purpose |
|------|---------|
| `.zshrc` | zsh + oh-my-zsh config (shared across OSes) |
| `.bashrc##os.Linux` | bash config (Linux only) |
| `.shell_aliases` | shared aliases, sourced by both bash and zsh |
| `.gitconfig` | git identity + `gh` credential helper |
| `Brewfile##os.Darwin` | Homebrew packages/casks (macOS) |
| `.config/yadm/bootstrap##o.*` | per-OS provisioning scripts |
| `.yadmignore` | keeps secrets (`.ssh`, `.gnupg`, keys, `.env`) untracked |

## OS alternates

yadm picks the right file per machine using its
[alternates](https://yadm.io/docs/alternates) suffixes:

- `##os.Darwin` / `##o.Darwin` → macOS
- `##os.Linux` / `##o.Linux` → Linux

Files with no suffix (e.g. `.zshrc`, `.shell_aliases`) apply everywhere, so any
OS-specific bits in them are guarded at runtime (e.g. the `bat`/`batcat` alias
and the Linux Neovim PATH).

## Bootstrap

- **macOS** (`bootstrap##o.Darwin`): installs Homebrew if missing, then
  `brew bundle` from the `Brewfile`.
- **Linux** (`bootstrap##o.Linux`): idempotent apt provisioning — base packages,
  pyenv, Neovim (release tarball to `/opt/nvim-linux-x86_64`), oh-my-zsh, and
  desktop apps via signed apt repos / snap. Safe to re-run.
