import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops -- For support wmctrl
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.EZConfig (additionalKeys)
import System.IO

superMask = mod4Mask
altMask = mod1Mask

main :: IO()
main = do
  xmobar <- spawnPipe "xmobar"
  xmonad $ docks $ ewmh $ defaultConfig
    { terminal    = "kitty"
    , layoutHook  = myLayoutHook
    , manageHook  = myManageHook
    , logHook     = myLogHook xmobar
    , startupHook = myStartupHook
    } `additionalKeys`
    [ ((0,           xK_Print), spawn "xfce4-screenshooter")
    , ((controlMask, xK_Print), spawn "xfce4-screenshooter -r")
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
  spawnOnce "xfce4-clipman &"
