# Homebrew tap for Lyth

[Lyth](https://github.com/lyth-lang/lyth) is a statically typed language that compiles to
readable Go: all of Go, in fewer lines. The documentation is at
[lyth.bkymz.net](https://lyth.bkymz.net).

```bash
brew install lyth-lang/tap/lyth
```

`brew upgrade lyth` updates it. The formula in `Formula/lyth.rb` builds `lyth` from the source
of a [release](https://github.com/lyth-lang/lyth/releases) of the main repository, on macOS and
Linux, and depends on Homebrew's Go, which `lyth` also uses to build programs. Each release
commits it here; edit it through `.github/homebrew/lyth.rb.tmpl` in
[lyth-lang/lyth](https://github.com/lyth-lang/lyth), not in this repository.
