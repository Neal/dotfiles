# waf
alias waf="pypy ./waf"
alias wcon="pypy ./waf configure --board=snowy_bb2 --lowpowerdebug --nowatchdog"
alias wi="pypy ./waf image_resources"
alias wf="pypy ./waf flash"
alias wb="pypy ./waf build"
alias wbf="pypy ./waf build flash"
alias wcbf="pypy ./waf configure --lowpowerdebug --nowatchdog build flash"
alias wt="pypy ./waf test"
alias wco="pypy ./waf console"

# QEMU
alias qcon="pypy ./waf configure --board=snowy_bb2 --lowpowerdebug --nowatchdog --nosleep --qemu --gdb --release"
alias qconm="pypy ./waf configure --board=snowy_bb2 --lowpowerdebug --nowatchdog --nosleep --qemu --gdb --release --malloc_instrumentation"
alias q="pypy ./waf qemu"
alias qco="pypy ./waf qemu_console"
alias qgdb="pypy ./waf qemu_gdb"
alias qspi="pypy ./waf qemu_image_spi"

# Pebble
alias pb='pebble build'
alias pi='pebble install'
alias pbi='pebble build && pebble install'

# Get info on an app
pblapp() {
  curl -s https://dev-portal.getpebble.com/api/applications/$1 | json
}

pblappjs() {
  local pbw_file=$(curl -s https://dev-portal.getpebble.com/api/applications/$1 | jq -r '.applications[] .pbw_file')
  partialzip $pbw_file pebble-js-app.js -- 2>&1 >/dev/null
}
