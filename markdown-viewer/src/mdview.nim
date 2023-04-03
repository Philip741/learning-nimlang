import markdown
import std/strutils
# read markdown file
proc readWriteMd(filename: string) =
    var f: File
    f = open(filename)
    #let fileContent = fileHandle.readline
    defer: f.close()

    for l in f.lines:
        #echo l
        let htmlLine = markdown(l)
        echo htmlLine

readWriteMd("test.md")