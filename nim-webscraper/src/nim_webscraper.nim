# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
import httpclient, strutils, uri
import os

proc downloadPageContent(url: string): string =
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "User-Agent": "Nim Web Scraper" })
  let content = client.getContent(url)
  client.close()
  return content

proc main() =
  var args = commandLineParams()
  var url = args[0]
  echo args
  if args.len == 0:
    echo "Use -h for help"
     
  
  
  #let url = "https://github.com/ansible/awx/blob/devel/INSTALL.md"
  
  echo url
  let htmlContent = downloadPageContent(url)
  echo htmlContent
when isMainModule:
  main()
