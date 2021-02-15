import XMonad
import XMonad.Hooks.EwmhDesktops -- For support wmctrl
import XMonad.Hooks.SetWMName

main :: IO()
main = do
  xmonad $ ewmh defaultConfig
    { terminal = "kitty"
    , startupHook = myStartupHook
    }

myStartupHook = do
  setWMName "LG3D" -- For support IntelliJ idea and more.
