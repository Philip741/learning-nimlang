import httpclient, strutils, uri
import os
import regex

proc downloadPageContent(url: string): string =
  var client = newHttpClient()
  client.headers = newHttpHeaders({ "User-Agent": "Nim Web Scraper" })
  let content = client.getContent(url)
  client.close()
  return content

proc main() =
  var args = commandLineParams()
  var url = ""
  var matched = false
  
  if args.len == 1:
    url = args[0]
    match url, rex"^https?://([a-z0-9-]+\.)+[a-z]{2,}(\/[^\s]*)?$":
      matched = true
      

  elif args.len == 0:
    echo args.len
  else:
      echo "Error: too many arguments"
 
  
  if matched:
      let htmlContent = downloadPageContent(url)
      echo htmlContent
  elif matched == false and args.len > 0:
      echo "Not a valid url use http or https://url.com"
  
when isMainModule:
  main()
