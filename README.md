# Dotfiles

## The Structure

At a high level, [my dotfiles repo](https://github.com/yankikucuk/dotfiles) has one folder for each application that I want to configure:

```
-> tree -L 1
.
|_____ README.md
|_____ bookmarks
|_____ gtk-4.0
|_____ i3
|_____ vscode[^1]
|_____ xdg-desktop-portal
|_____ zed
```

The one extra directory there is `.config`, home to the install scripts.

Within each of these application directories live two[^2] types of files:

- the actual config files (duh)
- a `links.prop` file

## The Configuration

The config files aren't much different from any other dotfiles repo you'll see out there (and honestly,
there are better ones to look at). What I'm most pleased with in my current iteration, though, is the file
naming pattern. In the past, I'd use file names like `vimrc` and `zshrc` ... which is pretty common, right?
My gripe though: most editors don't give you syntax highlighting by default, when your file has no
extension. So now I'm using file names like `rc.vim` and `rc.zsh`, and get the syntax highlighting.
Small change, big difference.

## The Links

I think we'd all agree: one of the main idea of a dotfiles repo is symlinking all your files into place, so
they remain under version control while they do their job from (usually) your home directory.

To that end, we have the links.prop files, one per app dir. Looks something like this:

```
$DOTFILES/vim/rc.vim=$HOME/.vimrc
$DOTFILES/vim=$HOME/.vim
```

On the left, we have the source. On the right, we have the destination. This is just a simple way to
codify the symlinks that need to be created to ".config" these configs. The `config.sh` script[^3] file will
replace any environment variables in these lines, and then create the symlinks.

## The Local Stuff

The `config.sh` script also creates a file called `~/.env.sh`. By default, it includes a single line:

```
export DOTFILES=/path/to/dotfiles
```

This file is for any machine-specific configuration. Need to include API keys or other secrets as env
vars, but don't want to commit them? Have extra paths or tools that you need to configure for a work
machine? Yes and yes, as a matter of fact.

Then, we source `~/.env.sh` in the "root" `~/.zshrc`. Actually, there's another trick here that I use for
loading several config files that may not always exist. It's a little shell function called
`source_if_exists`:

```
source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}
```

If the file exists, and is readable, then we'll source it! Another tiny tool, but it gives me a clear set of lines.
Ugh, so clean.

## The Next Steps

The nature of dotfiles is to always be evolving. Next tax season, here's my shortlist for next features:

- Add a solid install script for all tools and dependencies that I regularly use. I have a weak
  version of this right now, but it's incomplete. There's a [thing called Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) that looks
  like a really solid start.

- Configure MacOS itself. You can set a lot of [macOS preferences from the command line](https://github.com/mathiasbynens/dotfiles/blob/main/.macos). This
  feels like a no-brainer for me.

- Support Linux. The base config I have here definitely works on the linux distros I've tried (so,
  Ubuntu, Debian, Arch[^4], Raspbian, etc.). But once I have my whole env installation set up for macOS.

[^1]: Just for beck-up

[^2]: Sometimes contains 3 or more files. And maybe only `.sh` files.

[^3]: You can find a similar script in [other people's dotfiles](https://github.com/folksgl/.dotfiles/blob/master/bootstrap.sh), but support for the `links.prop` is my own addition.

[^4]: By the way.
