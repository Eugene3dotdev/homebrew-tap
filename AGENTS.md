# homebrew-tap — agent invariants

- Formulae here publish z3store (and the deprecated gitstore shim) to every
  consumer; a formula change is a release.
- Every change starts from a Linear `TEO-*` issue with a ready `readiness/v1`
  record (canonical contract in `EugOT/dotfiles` `readiness/`; vendored
  validator in `.readiness/`). The record for a z3store version bump lists
  both `Eugene3dotdev/z3store` and `Eugene3dotdev/homebrew-tap`. Run
  `nu .readiness/readiness.nu check --issue TEO-n --base origin/main` before
  editing; the `Readiness Gate` check enforces the same on every pull request.
- Bump `url` and `sha256` together from the tagged z3store release whose
  `verify-release` evidence is recorded on the issue.
