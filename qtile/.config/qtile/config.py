# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
# Copyright (c) 2018 Juan Riquelme
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, widget, hook
from libqtile.command import lazy
from libqtile.config import Click, Drag, Group, Key, Match, Screen
import os
import subprocess

mod = "mod4"
alt = "mod1"

keys = [
    # keys for switch between my groups
    Key(["control", "mod1"], "Left", lazy.screen.prev_group()),
    Key(["control", "mod1"], "Right", lazy.screen.next_group()),

    # Switch between windows in current stack pane
    Key([mod], "Up", lazy.layout.down()),
    Key([mod], "Down", lazy.layout.up()),

    # Move windows up or down in current stack
    Key([mod, "control"], "Up", lazy.layout.shuffle_down()),
    Key([mod, "control"], "Down", lazy.layout.shuffle_up()),

    # Switch window focus to other pane(s) of stack
    Key([mod], "Right", lazy.layout.next()),

    # Switch window focus to previous/next window in the group
    Key([alt, "shift"], "Tab", lazy.group.prev_window()),
    Key([alt], "Tab", lazy.group.next_window()),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "control"], "Return", lazy.layout.toggle_split()),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout()),
    Key([alt], "q", lazy.window.kill()),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),

    # Power management
    Key([mod], "Escape", lazy.spawn("systemctl suspend")),

    # Disable floating window
    Key([mod, "shift"], "f", lazy.window.disable_floating()),

    # Increase space for windows
    Key(
        [mod],
        "l",
        lazy.layout.delete(),  # Stack, delete aditional stacks (columns)
        lazy.layout.grow()),  # MonadTall, increase size of main window
    # Decrease space for windows
    Key(
        [mod],
        "h",
        lazy.layout.add(),  # Stack, add aditional stacks (columns)
        lazy.layout.shrink()),  # MonadTall, decrease size of main window

    # Normalize size of the windows
    Key([mod], "n", lazy.layout.normalize()),  # MonadTall

    # Toggle fullscreen mode (window with the focus)
    Key([], "F12", lazy.window.toggle_fullscreen()),

    # open a prompt for execute a command
    Key([alt], "F2", lazy.spawncmd()),

    # APP KEYBINDINGS
    Key([mod], "Return", lazy.spawn("urxvtc")),
    Key([mod], "f", lazy.spawn("thunar")),
    Key([mod], "t", lazy.spawn("thunderbird")),
    Key([mod], "e", lazy.spawn("pluma")),
    Key([mod], "z", lazy.spawn("zeal")),
    Key([mod], "q", lazy.spawn("xkill")),
    Key([mod], "v", lazy.spawn("vlc")),
    Key([mod], "g", lazy.spawn("gimp")),
    Key([mod], "c", lazy.spawn("urxvtc -e cmus")),
    Key(["control", alt], "d", lazy.spawn("firefox-developer-edition")),
    Key(["control", alt], "f", lazy.spawn("firefox")),
    Key(["control", alt], "c", lazy.spawn("chromium")),
    Key(["control", alt], "space", lazy.spawn("lxtask")),
    Key(["control", "shift"], "c", lazy.spawn("code")),
    Key([], "Print", lazy.spawn("scrot")),
    # cmus control
    Key(["control", alt], "ntilde", lazy.spawn("cmus-remote -u")),  # pause
    Key(["control", alt], "p", lazy.spawn("cmus-remote -r")),  # prev song
    Key(["control", alt], "n", lazy.spawn("cmus-remote -n")),  # next song
    # audio control
    Key([mod], "0", lazy.spawn("amixer -q set Master toggle")),  # mute/unmute
    # vol-
    Key([mod], "minus", lazy.spawn("amixer -c 0 sset Master 1- unmute")),
    Key([mod], "plus", lazy.spawn("amixer -c 0 sset Master 1+ unmute"))  # vol+
]

# My groups (workspaces) "im", "w", "d", "d2", "img", "mm", "vm"
groups = [
    Group("im",
          matches=[
              Match(wm_class=["Firefox"]),
              Match(wm_class=["skypeforlinux"]),
              Match(wm_class=["Ripcord"])
          ]),
    Group("w",
          matches=[
              Match(wm_class=["Firefox Developer Edition"]),
              Match(wm_class=["Chromium"])
          ]),
    Group("d", matches=[Match(wm_class=["Atom"]),
                        Match(wm_class=["Code"])]),
    Group("d2",
          matches=[Match(wm_class=["Zeal"]),
                   Match(wm_class=["Thunderbird"])]),
    Group("img",
          matches=[
              Match(wm_class=["Gimp"]),
              Match(wm_class=["Darktable"]),
              Match(wm_class=["Inkscape"]),
              Match(wm_class=["Simple-scan"]),
              Match(wm_class=["Nitrogen"])
          ]),
    Group("mm",
          matches=[
              Match(wm_class=["mpv"]),
              Match(wm_class=["Audacious"]),
              Match(title=["cmus"]),
              Match(wm_class=["Vlc"])
          ]),
    Group("vm", matches=[Match(wm_class=["Virtualbox"])]),
]

# Layouts configuration
border = dict(border_focus='#8FC971', border_normal='#CDCDCD', border_width=4)
layouts = [
    layout.Max(),
    layout.MonadTall(**border),
    layout.Stack(autosplit=True, num_stacks=2, **border),
    layout.Matrix(columns=4, **border)
]

widget_defaults = dict(
    font='monospace',
    fontsize=16,
    padding=3,
)


def get_shared_widget_config():
    return [
        widget.GroupBox(),
        widget.Prompt(),
        # shows actual group tasklist
        widget.TaskList(fontsize=14, highlight_method='block'),
        widget.Cmus(max_chars=50),
        widget.CapsNumLockIndicator(),
        widget.HDDBusyGraph(),
        # shows current layout name
        widget.CurrentLayout(),
        widget.Systray(),
        widget.Battery(charge_char='▲',
                       foreground='09c25a',
                       discharge_chart='▼',
                       update_delay=300),
        widget.Clock(format='%d-%m-%Y %a %I:%M %p')
    ]


screens = [
    Screen(
        top=bar.Bar(  # bar on top
            get_shared_widget_config(),
            25,  # bar height
            background=["#000000", "#232323"],  # bar with gradient background
        ), ),
    Screen(
        bottom=bar.Bar(  # bar on bottom
            get_shared_widget_config(),
            25,  # bar height
            background=["#000000", "#232323"],  # bar with gradient background
        ), ),
]

# Drag floating layouts.
mouse = [
    Drag([mod],
         "Button1",
         lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod],
         "Button3",
         lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
FLOAT_RULES = [
    {
        "wmclass": "gcolor3"
    },
    {
        "wmclass": "Peek"
    },
]
floating_layout = layout.Floating(float_rules=FLOAT_RULES, **border)
auto_fullscreen = True

# For some Java apps to work correctly, Qtile tricks them here into thinking
# it's a Java application itself (LG3D, a 3D WM which is in their whitelist)
wmname = "LG3D"


# subscribe for screen changes
# (a screen is added or screen config changes, via xrandr)
@hook.subscribe.screen_change
def restart_on_randr(qtile, ev):
    qtile.cmd_restart()


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
