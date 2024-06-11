-- IMPORTS

-- Main
import XMonad      -- Main XMonad Module
import System.Exit -- Haskel Exit Module

-- Data
import Data.Char (isSpace, toUpper)
import Data.Maybe (fromJust)
import Data.Monoid
import Data.Maybe (isJust)
import Data.Tree
import qualified Data.Map as M

import XMonad.Operations
import qualified XMonad.StackSet as W

-- XMoand Utils
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig

-- XMonad Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers

-- XMonad Layouts
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Spacing
import XMonad.Layout.Renamed
import XMonad.Layout.NoBorders

-- XMonad Actions
import XMonad.Actions.CycleWS
import XMonad.Actions.Submap

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myClickJustFocuses :: Bool

myFocusFollowsMouse = True
myClickJustFocuses = False

-- Width of Window Boarders
myBorderWidth   = 2

-- Declare Workspaces
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

-- Makes Workspaces Clickable
myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..] -- (,) == \x y -> (x,y)
clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>"
 where i = fromJust $ M.lookup ws myWorkspaceIndices

-- Border Colors for Windows
myNormalBorderColor  = "#1d2021"
myFocusedBorderColor = "#504945"

-- Binds ModKey to mod4Mask (Super)
myModMask       = mod4Mask

-- Command Prefixes
myExecFolder = "~/.local/nf/bin/"
myOpenSfx    = "setsid -f mpv --no-video ~/.local/share/sounds/open.mp3; "
myMenuSfx    = "setsid -f mpv --no-video ~/.local/share/sounds/menu.open.mp3; "

-- center and float window
centerWindow :: Window -> X ()
centerWindow win = do
 (_, W.RationalRect x y w h) <- floatLocation win
 windows $ W.float win (W.RationalRect ((1 - w) / 2) ((1 - h) / 2) w h)
 return ()

-- Keybinds
myKeys = \c -> mkKeymap c $
 [ ("M-S-<Return>", spawn (myOpenSfx <+> "kitty"  )) -- Terminal Emulator
 , ("M-b",          spawn (myOpenSfx <+> "firefox")) -- Web Browser
 , ("M-e",          spawn (myOpenSfx <+> "thunar" )) -- File Browser

 , ("M-S-c", kill) -- Close the Focused Window
 , ("M-p", spawn (myMenuSfx <+> "rofi -show drun -show-icons")) -- Run Prompt

 , ("<XF86AudioMute>",        spawn (myExecFolder <+> "pf-volume mute"))
 , ("<XF86AudioLowerVolume>", spawn (myExecFolder <+> "pf-volume down"))
 , ("<XF86AudioRaiseVolume>", spawn (myExecFolder <+> "pf-volume up"  ))

 , ("<XF86MonBrightnessDown>", spawn (myExecFolder <+> "pf-brightness down"))
 , ("<XF86MonBrightnessUp>",   spawn (myExecFolder <+> "pf-brightness up"))

 , ("M-<Print>", spawn (myExecFolder <+> "pf-screenshot fullscreen"))
 , ("<Print>", spawn (myExecFolder <+> "pf-screenshot rectangle"))
 , ("M-S-p", spawn "loginctl lock-session") -- Locks the Screen

 , ("M-.", spawn "~/.local/nf/bin/pf-emoji")
 , ("M-,", spawn "~/.local/nf/bin/pf-kaomoji")
 , ("M-o", spawn "keepmenu &")

 , ("M-d c b", spawn "rofi-bluetooth")

     -- Rotate through the available layout algorithms
 , ("M-s", sendMessage NextLayout)

    -- Resize viewed windows to the correct size
 , ("M-<F5>", refresh)

    -- Move focus to the next window
 , ("M-j", windows W.focusDown)
 , ("M-k", windows W.focusUp)

    -- Move focus to the master window
 , ("M-m", windows W.focusMaster)
 , ("M-<Return>", windows W.swapMaster)

    -- Swap the focused window with the next window
 , ("M-S-j", windows W.swapDown)
 , ("M-S-k", windows W.swapUp)

    -- Shrink the master area
 , ("M-S-h", sendMessage Shrink)
 , ("M-S-l", sendMessage Expand)

    -- Push window back into tiling
 , ("M-t", withFocused $ windows . W.sink)
 , ("M-f", withFocused $ centerWindow)

    -- Increment the number of windows in the master area
 , ("M-i", sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
 , ("M-u", sendMessage (IncMasterN (-1)))

    -- Quit xmonad
 , ("M-S-q", io (exitWith ExitSuccess))

    -- Restart xmonad
 , ("M-q", spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
 , ("M-S-/", spawn ("cat ~/.local/share/xmonad-data/xmonad.help | gxmessage -ontop -title 'XMonad Help :3' -file -"))

    -- Go to Workspace
 , ("M-1", windows $ W.greedyView $ myWorkspaces !! 0)
 , ("M-2", windows $ W.greedyView $ myWorkspaces !! 1)
 , ("M-3", windows $ W.greedyView $ myWorkspaces !! 2)
 , ("M-4", windows $ W.greedyView $ myWorkspaces !! 3)
 , ("M-5", windows $ W.greedyView $ myWorkspaces !! 4)
 , ("M-6", windows $ W.greedyView $ myWorkspaces !! 5)
 , ("M-7", windows $ W.greedyView $ myWorkspaces !! 6)
 , ("M-8", windows $ W.greedyView $ myWorkspaces !! 7)
 , ("M-9", windows $ W.greedyView $ myWorkspaces !! 8)

    -- Move Window to Workspace
 , ("M-S-1", windows $ W.shift $ myWorkspaces !! 0)
 , ("M-S-2", windows $ W.shift $ myWorkspaces !! 1)
 , ("M-S-3", windows $ W.shift $ myWorkspaces !! 2)
 , ("M-S-4", windows $ W.shift $ myWorkspaces !! 3)
 , ("M-S-5", windows $ W.shift $ myWorkspaces !! 4)
 , ("M-S-6", windows $ W.shift $ myWorkspaces !! 5)
 , ("M-S-7", windows $ W.shift $ myWorkspaces !! 6)
 , ("M-S-8", windows $ W.shift $ myWorkspaces !! 7)
 , ("M-S-9", windows $ W.shift $ myWorkspaces !! 8)

 , ("M-h", prevWS)  -- Move to Previous Workspace
 , ("M-l", nextWS)] -- Move to Next Workspace

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
 [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster))
 , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
 , ((modm, button3), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster))
 ]

-- Layouts
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Below is a variation of the above except no borders are applied
-- if fewer than two windows. So a single window has no gaps.
mySpacing' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

myLayout = avoidStruts ( tiled ||| Mirror tiled ) ||| noBorders Full
 where
   tiled   = renamed [Replace "Tall"] $ mySpacing 4 $ Tall nmaster delta ratio
   nmaster = 1
   ratio   = 1/2
   delta   = 3/100

-- Window rules:
myManageHook = composeAll
 [ className =? "Gxmessage" --> doCenterFloat
 , ( className =? "steam" <&&> title /=? "Steam" ) --> doCenterFloat ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
 spawnOnce "xcompmgr &"
 spawnOnce "mpv --no-video ~/.local/share/sounds/startup.mp3 &"
 spawnOnce "keepassxc &"
 spawnOnce "~/.local/nf/bin/pf-trayer"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
 xmproc <- spawnPipe "xmobar ~/.config/xmobar.rc"
 xmonad $ ewmhFullscreen $ ewmh  $ docks defaults
   { logHook = dynamicLogWithPP xmobarPP
     { ppOutput = \x -> hPutStrLn xmproc x
         , ppCurrent = xmobarColor "#99d1db" "" . wrap "[" "]"
         , ppHidden = xmobarColor "#949cbb" ""  . wrap "" "*" . clickable
         , ppTitle = xmobarColor "#c6d0f5" ""
         , ppSep = "<fc=#a5adce> <fn=1>|</fn> </fc>"
         , ppExtras = []
         , ppOrder = \(ws:l:t:ex) -> [ws,l]++ex++[t]
     }
   }

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
 terminal           = "kitty",
 focusFollowsMouse  = myFocusFollowsMouse,
 clickJustFocuses   = myClickJustFocuses,
 borderWidth        = myBorderWidth,
 modMask            = myModMask,
 workspaces         = myWorkspaces,
 normalBorderColor  = myNormalBorderColor,
 focusedBorderColor = myFocusedBorderColor,

 -- key bindings
 keys               = myKeys,
 mouseBindings      = myMouseBindings,

 -- hooks, layouts
 layoutHook         = myLayout,
 manageHook         = myManageHook,
 handleEventHook    = myEventHook,
 startupHook        = myStartupHook
}
