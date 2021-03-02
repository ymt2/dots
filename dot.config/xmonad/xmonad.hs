import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops -- For support wmctrl
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)
import System.IO

superMask = mod4Mask
altMask = mod1Mask

main :: IO()
main = do
  xmobar <- spawnPipe "xmobar"
  xmonad $ docks $ ewmh $ defaultConfig
    { terminal    = "urxvt"
    , layoutHook  = myLayoutHook
    , manageHook  = myManageHook
    , logHook     = myLogHook xmobar
    , startupHook = myStartupHook
    }
    `additionalKeysP`
    [ ("<Print>", spawn "xfce4-screenshooter")
    , ("C-<Print>", spawn "xfce4-screenshooter -r")
    ]
    `removeKeysP`
    [ "M-m" -- To keep alive spacemacs leader key
    ]

myLayoutHook = avoidStruts $ layoutHook defaultConfig

myManageHook = manageDocks <+> manageHook defaultConfig

myLogHook h = dynamicLogWithPP xmobarPP
  { ppOutput = hPutStrLn h
  , ppUrgent = xmobarColor "yellow" "red" . xmobarStrip
  , ppTitle  = xmobarColor "#ff7f14" "" . shorten 50
  }

myStartupHook = do
  setWMName "LG3D" -- For support IntelliJ idea and more.
  spawnOnce "dropbox &"
  spawnOnce "xfce4-clipman &"
  spawnOnce "nitrogen --restore &"
