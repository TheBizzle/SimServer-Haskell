{-# LANGUAGE OverloadedStrings #-}
module Controllers (echoHTTP) where

import Control.Arrow

import Data.ByteString.Char8

import Snap.Core

a |> f = f a

echoHTTP :: Snap ()
echoHTTP = getRequest >>= (show >>> pack >>> writeBS)
