
bindir="./bin"
if [ ! -d "$bindir" ]; then
  echo "Directory does not exist. Creating it now..."
  mkdir -p "$bindir"
fi

nim c -d:release -d:ssl -o:bin/ src/nim_webscraper.nim
