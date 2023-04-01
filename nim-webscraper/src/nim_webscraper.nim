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
  #var url = args[0]
  var matched = false
  var urlText = "https://google.com"
  #let urlPattern = re(r"^https?://([a-z0-9-]+\.)+[a-z]{2,}(\/[^\s]*)?$")
  #match urlText, rex"^https?://([a-z0-9-]+\.)+[a-z]{2,}(\/[^\s]*)?$":
      #echo "matched it's a url"
      
  if args.len == 1:
    let url = args[0]
    echo url
    match url, rex"^https?://([a-z0-9-]+\.)+[a-z]{2,}(\/[^\s]*)?$":
      matched = true
      if matched:
        let htmlContent = downloadPageContent(url)
        echo htmlContent
      else:
        echo "Not a valid url use http or https://url.com"

  elif args.len == 0:
    echo args.len
    
  # elif args.len == 1 and args[1] == "-h":
  #   echo "Use ./nim_webscraper <url>"
  # elif args.len == 1:
  #     let url = args[0]
  #     echo url
  # Do something with the URL here
  else:
      echo "Error: too many arguments"
  #else:
   # echo "Invalid option"
  
  
  #let url = "https://github.com/ansible/awx/blob/devel/INSTALL.md"
  
  
  #let htmlContent = downloadPageContent(url)
  #echo htmlContent
when isMainModule:
  main()
