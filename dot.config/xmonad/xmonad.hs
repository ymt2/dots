import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops -- For support wmctrl
import XMonad.Hooks.SetWMName
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.EZConfig (additionalKeys)

superMask = mod4Mask
altMask = mod1Mask

main :: IO()
main = do
  xmonad $ ewmh defaultConfig
    { terminal = "kitty"
    , startupHook = myStartupHook
    } `additionalKeys`
    [ ((0,           xK_Print), spawn "xfce4-screenshooter")
    , ((controlMask, xK_Print), spawn "xfce4-screenshooter -r")
    ]

myStartupHook = do
  setWMName "LG3D" -- For support IntelliJ idea and more.
  spawnOnce "xfce4-clipman &"
