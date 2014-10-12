{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Applicative

import Snap.Core
import Snap.Util.FileServe
import Snap.Http.Server

import Controllers

main :: IO ()
main = quickHttpServe site

site :: Snap ()
site =
    ifTop (writeBS "Welcome to SimServer!  Really!") <|>
    route [("http", echoHTTP)] <|>
    dir "static" (serveDirectory "public")
