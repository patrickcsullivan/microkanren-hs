{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_microkanren_hs (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/patrick/work/microkanren-hs/.stack-work/install/x86_64-linux-tinfo6/3894c8fccbe0db20ea4a9812a208a0579359afe38ecc2202f8efcb360075e07f/8.10.4/bin"
libdir     = "/home/patrick/work/microkanren-hs/.stack-work/install/x86_64-linux-tinfo6/3894c8fccbe0db20ea4a9812a208a0579359afe38ecc2202f8efcb360075e07f/8.10.4/lib/x86_64-linux-ghc-8.10.4/microkanren-hs-0.1.0.0-IxjuarhduIhBcfXCb7OIwi-microkanren-hs"
dynlibdir  = "/home/patrick/work/microkanren-hs/.stack-work/install/x86_64-linux-tinfo6/3894c8fccbe0db20ea4a9812a208a0579359afe38ecc2202f8efcb360075e07f/8.10.4/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/patrick/work/microkanren-hs/.stack-work/install/x86_64-linux-tinfo6/3894c8fccbe0db20ea4a9812a208a0579359afe38ecc2202f8efcb360075e07f/8.10.4/share/x86_64-linux-ghc-8.10.4/microkanren-hs-0.1.0.0"
libexecdir = "/home/patrick/work/microkanren-hs/.stack-work/install/x86_64-linux-tinfo6/3894c8fccbe0db20ea4a9812a208a0579359afe38ecc2202f8efcb360075e07f/8.10.4/libexec/x86_64-linux-ghc-8.10.4/microkanren-hs-0.1.0.0"
sysconfdir = "/home/patrick/work/microkanren-hs/.stack-work/install/x86_64-linux-tinfo6/3894c8fccbe0db20ea4a9812a208a0579359afe38ecc2202f8efcb360075e07f/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "microkanren_hs_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "microkanren_hs_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "microkanren_hs_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "microkanren_hs_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "microkanren_hs_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "microkanren_hs_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
