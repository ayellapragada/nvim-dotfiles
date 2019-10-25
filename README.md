# README

## Instructions

Ideally this one will be as easy as git pull and the after commit hooks should set things up. If not, the instructions should be in here for the exact details.
1.

Use this to make fzf :Files work the way I want it. Don't exclude hidden files, but do ignore gitignored files.

```export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"' ```
