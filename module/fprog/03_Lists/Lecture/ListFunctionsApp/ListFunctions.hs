{- 
A small web application to store list function descriptions.

Setup:
  1. cabal update
  2. cabal install scotty
  3. run the main function
  4. point your browser to localhost:3000
-}

{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Data.Text.Lazy (pack, unpack)
import Network.Wai.Middleware.RequestLogger
import Control.Monad.Trans (liftIO)
import System.IO

-- Type alias for a function description.
-- Fields: (Signature, Examples, Description)
type FunctionDesc = (String,String,String)

-- File which stores the data. This file must exist.
databaseFile :: FilePath
databaseFile = "Database"

-- The main entry point. Starts a webserver on port 3000.
-- Navigate to localhost:3000 to see the page.
main = scotty 3000 $ do
  middleware logStdoutDev
  -- Get request (load page)
  get "/" $ do
    fileContent <- liftIO (readFile databaseFile)
    let htmlContent = funsToHTML (stringToFuns fileContent)
    html (pack htmlContent)
  -- Post request (save)
  post "/" $ do
    ps <- params
    let fileContent = funsToString (stringsToFuns (paramsToStrings ps))
    liftIO (writeFile databaseFile fileContent)
    redirect "/" 

-- Transforms the string from the database file into a list of function descriptions.
stringToFuns :: String -> [FunctionDesc]
stringToFuns s = map read (lines s)

-- Transforms a list of function descriptions ≈ßç¬into an html page.
funsToHTML :: [FunctionDesc] -> String
funsToHTML fs = template (concat (map funToTable fs))

-- Transforms a list of html post parameters into a list of function descriptions.
stringsToFuns :: [String] -> [FunctionDesc]
stringsToFuns [] = []
stringsToFuns (s:e:d:ps) = (s,e,d):(stringsToFuns ps)

-- Transforms a list of post request parameters to a list of their string values.
paramsToStrings :: [Param] -> [String]
paramsToStrings ps = map (unpack.snd) ps

-- Transforms a list of funcion descriptions into a string for the database file.
funsToString :: [FunctionDesc] -> String
funsToString fs = unlines (map show fs)

-- Transforms a function description into an html table.
funToTable :: FunctionDesc -> String
funToTable (sig,ex,desc) = concat
  ["<table>\n",
     "<colgroup><col width='100'><col width='400'></colgroup>\n",
     "<tr><td>Signature  </td><td><textarea name='s' rows='1' >", sig,  "</textarea></td></tr>\n",
     "<tr><td>Examples   </td><td><textarea name='e' rows='3' >", ex,   "</textarea></td></tr>\n",
     "<tr><td>Description</td><td><textarea name='d' rows='5'>", desc, "</textarea></td></tr>\n",
   "</table>\n"]

-- Takes the tables and returns the complete html page.
template :: String -> String
template body = concat
  ["<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n",
   "<html>\n",
   "  <head>\n",
   "    <meta http-equiv='content-type' content='text/html; charset=utf-8'>",
   "    <title>List Functions</title>\n",
   "    <style type='text/css'>\n",
   "      table { border-collapse: collapse; margin-bottom: 20px; }\n",
   "      td, th { border: 1px solid black; vertical-align: top; }\n",
   "      textarea { border:none; width:99%; }\n",
   "    </style>\n",
   "    <script type='text/javascript'>\n",
   "      function addTable() {\n",
   "        var div = document.getElementById('tables')\n",
   "        div.innerHTML = div.innerHTML + \"", concat (lines (funToTable ("","",""))),"\"\n",
   "      }\n",
   "    </script>\n",
   "  </head>\n",
   "  <body>\n",
   "  <h1>&lambda; List Functions &lambda;</h1>\n",
   "    <form name='input' action='' method='post' enctype='application/x-www-form-urlencoded;charset=UTF-8'>\n",
   "      <div id=tables>\n",
            body,
   "      </div>\n",
   "      <input type='submit' value='Save'>\n",
   "      <input type='button' value='Add' onclick='addTable();'>\n",
   "    </form>\n",
   "  </body>\n",
   "</html>\n"] 
