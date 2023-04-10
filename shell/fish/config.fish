if status is-interactive
  # Commands to run in interactive sessions can go here
  starship init fish | source
  fish_vi_key_bindings

  # Core abbreviations
  abbr -a w1 'watch -n 1'
  abbr -a ls 'ls -lhvG'
  abbr -a ll 'ls -a'
  abbr -a df 'df -H'
  abbr -a du 'du -h -d 1'
  abbr -a dus 'du -h -d 1 | sort -h'
  abbr -a dus2 'du -h -d 2 | sort -h'
  abbr -a dus3 'du -h -d 3 | sort -h'
  abbr -a emoji $EDITOR ~/dotfiles/misc/emoji.txt


  # replace ls with exa
  if type -q exa
    abbr -a ls exa -l --icons --group-directories-first --git
    abbr -a ll exa -al --icons --group-directories-first --git
    abbr -a lm exa -l --icons --group-directories-first -s mod --git
    abbr -a lma exa -al --icons --group-directories-first -s mod --git
    abbr -a lt2 exa -aT -L 2 --icons --group-directories-first --git
    abbr -a lt3 exa -aT -L 3 --icons --group-directories-first --git
  end

  if type -q colima
    abbr -a co colima
  end

  if type -q docker
    abbr -a d docker
    abbr -a dp docker ps -a
    abbr -a dpx docker ps --filter "status=exited"
  end

  if type -q git
    abbr -a gaa git add --all
    abbr -a gb git branch
    abbr -a gc git commit
    abbr -a gm git commit -m
    abbr -a gca git commit --amend -no-edit
    abbr -a gco git checkout
    abbr -a gco git checkout main
    abbr -a gd git diff HEAD
    abbr -a gds git diff --staged
    abbr -a gd1 git diff HEAD~1 HEAD
    abbr -a gd2 git diff HEAD~2 HEAD~1
    abbr -a gd3 git diff HEAD~3 HEAD~2
    abbr -a gd4 git diff HEAD~4 HEAD~3
    abbr -a gd5 git diff HEAD~5 HEAD~4
    abbr -a gd6 git diff HEAD~6 HEAD~5
    abbr -a gd7 git diff HEAD~7 HEAD~6
    abbr -a gd8 git diff HEAD~8 HEAD~7
    abbr -a gd9 git diff HEAD~9 HEAD~8
    abbr -a glo git log
    abbr -a gp git pull --rebase
    abbr -a gpf git pull --ff-only
    abbr -a gpush git push origin
    abbr -a gre git rebase
    abbr -a grc git rebase --continue
    abbr -a gs git status --short
    abbr -a gyolo "git add --all && git commit --amend --no-edit && git push -f"
  end

  if type -q jump
    jump shell fish | source
    abbr -a jc jump pin
    abbr -a jp jump pins
  end

# watch youtube
  if type -q yt-dlp
    abbr yt yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'
    abbr yta yt-dlp -f bestaudio -x --audio-format mp3 --audio-quality 3
  end

  if type -q curl
    abbr wt "curl \"https://wttr.in/Nijmegen?qpF\""
    abbr wtn "curl \"https://wttr.in/Nijmegen?0qpF\""
  end
end

function fish_greeting
  echo "Fish shell loaded. 🐟🐠🐡"
end
