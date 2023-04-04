import std/osproc
import strutils
# dumps all open tabs in safari to stdout
let cmd: string = "/usr/bin/osascript -e 'tell application \"Safari\"' -e 'get URL of every tab of every window' -e 'end tell'"
let (outC, errC) = execCmdEx(cmd)
var errChk: int = 0
if errC != errChk:
    echo "Error encountered"
for i in outC.split(" "):
    var outUrl = i 
    #chops the , off the end
    echo outUrl[0..^2]