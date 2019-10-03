# dots

## How to use

```bash
$ git clone git@github.com:ymt2/dots.git $HOME/dots
$ cd $HOME/dots
$ ./bootstrap.sh
```

## misc.

```bash
$ sudo /usr/libexec/PlistBuddy /Library/LaunchAgents/com.dotfiles.launchd.maxfiles.plist \
  -c "add Label string com.launchd.maxfiles" \
  -c "add ProgramArguments array" \
  -c "add ProgramArguments: string launchctl" \
  -c "add ProgramArguments: string limit" \
  -c "add ProgramArguments: string maxfiles" \
  -c "add ProgramArguments: string 524288" \
  -c "add ProgramArguments: string 1048576" \
  -c "add RunAtLoad bool true"
$ sudo /usr/libexec/PlistBuddy /Library/LaunchAgents/com.dotfiles.launchd.maxproc.plist \
  -c "add Label string com.launchd.maxproc" \
  -c "add ProgramArguments array" \
  -c "add ProgramArguments: string launchctl" \
  -c "add ProgramArguments: string limit" \
  -c "add ProgramArguments: string maxproc" \
  -c "add ProgramArguments: string 2048" \
  -c "add ProgramArguments: string unlimited" \
  -c "add RunAtLoad bool true"
$ sudo launchctl load -w /Library/LaunchDaemons/com.dotfiles.launchd.maxfiles.plist
$ sudo launchctl load -w /Library/LaunchDaemons/com.dotfiles.launchd.maxproc.plist
```
