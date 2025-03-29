if ! pidof socat > /dev/null 2>&1; then
    [ -e /tmp/discord-ipc-0 ] && rm -f /tmp/discord-ipc-0
    socat UNIX-LISTEN:/tmp/discord-ipc-0,fork EXEC:"/mnt/d/para/Tools/bin/npiperelay.exe //./pipe/discord-ipc-0"&
fi

if [ $# -eq 0 ]; then
    command nvim
else
    command nvim "$@"
fi
