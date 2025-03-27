from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
import os
import subprocess
from typing import Dict, List

# ========== Color Theme ==========
theme = {
    "bg": "#282c34",         # OneDark background
    "bg_alt": "#21252b",     # Darker variant
    "fg": "#bbc2cf",         # Text color
    "accent": "#f5c2e7",     # Purple (Catppuccin inspired)
    "accent2": "#e5c07b",    # Yellow
    "red": "#e06c75",        # Red
    "blue": "#61afef",       # Blue
    "green": "#98c379",      # Green
    "cyan": "#56b6c2",       # Cyan
    "gray": "#5c6370"        # Muted gray
}

# ========== Core Configuration ==========
mod = "mod4"
terminal = "alacritty"

# ========== Key Bindings ==========
keys = [
    # Application launchers
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "e", lazy.spawn("thunar")),
    Key([mod], "d", lazy.spawn("/home/msbis/.config/rofi/launchers/type-1/launcher.sh")),
    Key([mod], "x", lazy.spawn("/home/msbis/.config/rofi/powermenu/type-1/powermenu.sh")),
    Key([mod], "Tab", lazy.spawn("rofi -show window")),
    
    # System controls
    Key([mod, "shift"], "r", lazy.reload_config()),
    Key([mod, "control"], "r", lazy.reload_config()),
    Key([mod, "shift"], "q", lazy.shutdown()),
    Key([mod], "c", lazy.spawn("clip")),
    
    # Window management
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "space", lazy.window.toggle_floating()),
    Key([mod, "shift"], "f", lazy.window.toggle_floating()),
    
    # Layout controls
    Key([mod], "s", lazy.layout.toggle_split()),
    Key([mod], "w", lazy.next_layout()),
    
    # Volume controls
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    
    # Custom shortcuts
    Key(["control"], "6", lazy.spawn("chromium")),
    Key(["control"], "4", lazy.spawn("radio")),
    Key(["control"], "5", lazy.spawn("slideshow")),
    Key(["control"], "1", lazy.spawn("volume down")),
    Key(["control"], "2", lazy.spawn("volume up")),
    Key(["control"], "3", lazy.spawn("volume mute")),
    Key([], "Print", lazy.spawn("flameshot gui")),
]

# Workspace keys (1-10)
for i in range(1, 10):
    keys.extend([
        Key([mod], str(i), lazy.group[str(i)].toscreen()),
        Key([mod, "shift"], str(i), lazy.window.togroup(str(i))),
    ])
keys.extend([
    Key([mod], "0", lazy.group["10"].toscreen()),
    Key([mod, "shift"], "0", lazy.window.togroup("10")),
])

# ========== Groups with Default Icons ==========
groups = [
    Group("1", label=" "),   # Browser
    Group("2", label=" "),   # Terminal
    Group("3", label=" "),   # Code
    Group("4", label="󰕼 "),   # Media
    Group("5", label=" "),   # Files
    Group("6", label=" "),   # Docs
    Group("7", label=" "),   # Video
    Group("8", label=" "),   # Games
    Group("9", label=" "),   # Chat
    Group("10", label=" "), # Settings
]

# ========== Layouts ==========
layout_theme = {
    "border_width": 2,
    "margin": 12,
    "border_focus": theme["accent"],
    "border_normal": theme["bg_alt"],
    "single_border_width": 2
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Floating(
        border_focus="#f5c2e7",
        border_normal="#333333",
        border_width=2
    )
]

# ========== Bar Configuration ==========
def init_bottom_bar():
    return bar.Bar(
        [
            widget.CurrentLayoutIcon(
                scale=0.65,
                foreground=theme["accent"],
                padding=6
            ),
            widget.GroupBox(
                font="CaskaydiaCove Nerd Font Bold",
                fontsize=12,
                margin_y=3,
                margin_x=0,
                padding_y=6,
                padding_x=6,
                borderwidth=0,
                active=theme["fg"],
                inactive=theme["gray"],
                highlight_color=theme["bg_alt"],
                highlight_method="line",
                this_current_screen_border=theme["accent"],
                urgent_alert_method="text",
                urgent_border=theme["red"],
                disable_drag=True,
                rounded=True,
                hide_unused=False,
                spacing=5
            ),
            widget.WindowName(
                foreground=theme["fg"],
                font="CaskaydiaCove Nerd Font Bold",
                max_chars=50,
                empty_group_string="～",
                padding=10
            ),
            widget.CPU(
                format="   {load_percent}%",
                foreground=theme["green"],
                padding=6,
                update_interval=2
            ),
            widget.Memory(
                format="   {MemUsed: .0f}{mm}",
                foreground=theme["blue"],
                padding=6,
                measure_mem="G"
            ),
            widget.Volume(
                fmt="     {}",
                foreground=theme["accent"],
                padding=6,
                volume_app="pavucontrol"
            ),
            widget.Clock(
                foreground=theme["fg"],
                format="   %I:%M %p",
                padding=6
            ),
            widget.Systray(
                icon_size=18,
                padding=6
            ),
        ],
        size=26,
        background=theme["bg"] + "cc",
        margin=[0, 0, 0, 0],
        opacity=0.95
    )

screens = [Screen(bottom=init_bottom_bar())]

# ========== Startup Applications ==========
@hook.subscribe.startup
def autostart():
    startup_commands = [
        "nitrogen --restore",
        # "dex --autostart --environment qtil",
        "picom",
        # "autotiling",
        "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
        "xss-lock --transfer-sleep-lock -- betterlockscreen -l dimblur",
        "clipmenud",
    ]
    
    for cmd in startup_commands:
        subprocess.Popen(cmd.split(), env=os.environ.copy())

# ========== Mouse Bindings ==========
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
]

# ========== General Config ==========
dgroups_key_binder = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
wmname = "LG3D"

# ========== Window Rules ==========
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="pavucontrol"),
        Match(wm_class="mate-system-monitor"),
        Match(title="Notification"),
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ],
    border_focus=theme["accent2"],
    border_normal=theme["bg_alt"]
)
