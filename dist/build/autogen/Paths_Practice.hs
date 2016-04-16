module Paths_Practice (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [1,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/hiromu/.cabal/bin"
libdir     = "/Users/hiromu/.cabal/lib/x86_64-osx-ghc-7.6.3/Practice-1.0"
datadir    = "/Users/hiromu/.cabal/share/x86_64-osx-ghc-7.6.3/Practice-1.0"
libexecdir = "/Users/hiromu/.cabal/libexec"
sysconfdir = "/Users/hiromu/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Practice_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Practice_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Practice_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Practice_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Practice_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
