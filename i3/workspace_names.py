#!/usr/bin/env python3
import logging

import i3ipc

# Set up logging for debugging
logging.basicConfig(level=logging.DEBUG, format="%(asctime)s - %(message)s")

# Define app-to-icon mapping
APP_ICONS = {
    "firefox": "󰈹 ",
    "chrome": " ",
    "brave-browser": " ",
    "thorium-browser": " ",
    "telegram-desktop": " ",
    "code": " ",
    "kitty": " ",
    "alacritty": " ",
    "gnome-terminal": " ",
    "konsole": " ",
    "spotify": " ",
    "vlc": "󰕼 ",
    "mpv": " ",
    "thunar": " ",
    "nautilus": " ",
    "pcmanfm": " ",
    "slack": " ",
    "thunderbird": " ",
    "obsidian": " ",
    "libreoffice": " ",
    "steam": " ",
    # Add editor icons for Neovim, Vim, and Emacs
    "neovim": " ",
    "vim": " ",
    "emacs": " ",
    "kate": " ",
}

# Connect to i3
i3 = i3ipc.Connection()


def update_workspace_names():
    """Updates workspace names dynamically based on running apps."""
    workspaces = i3.get_workspaces()
    windows = i3.get_tree().leaves()

    # Track workspace contents
    ws_icons = {ws.num: [] for ws in workspaces}

    for win in windows:
        ws_num = win.workspace().num
        app = win.window_class.lower() if win.window_class else "?"

        # Log the window class for debugging
        logging.debug(f"Window Class: {win.window_class} (App: {app})")

        # Use icon based on app class
        icon = APP_ICONS.get(app, "")  # Default icon if unknown

        # If the window is a terminal-based editor (Neovim, Vim, Emacs), use the code editor icon
        if any(editor in app for editor in ["neovim", "vim", "emacs", "kate"]):
            icon = APP_ICONS["neovim"]  # You can customize to any icon, e.g., ""
            logging.debug(f"Using code editor icon for {app}")

        # Assign icon to the workspace
        ws_icons[ws_num].append(icon)

    # Rename workspaces
    for ws in workspaces:
        icons = " ".join(set(ws_icons[ws.num]))  # Unique icons
        new_name = f"{ws.num}: {icons}" if icons else str(ws.num)
        i3.command(f'rename workspace "{ws.name}" to "{new_name}"')


# Listen for events
def on_window_event(_i3, _event):
    update_workspace_names()


# Subscribe to i3 events
i3.on("window::new", on_window_event)
i3.on("window::close", on_window_event)
i3.on("window::move", on_window_event)
i3.on("workspace::focus", on_window_event)

# Initial update
update_workspace_names()

# Start listening for events
i3.main()
