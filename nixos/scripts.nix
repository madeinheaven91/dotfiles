{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "niri-nmtui" ''
      #!/bin/sh
      NEWT_COLORS='
        root=white,#1e1e2e
        window=white,#1e1e2e
        border=blue,#1e1e2e
        actborder=blue,#1e1e2e
        shadow=#1e1e2e,#1e1e2e
        title=red,#1e1e2e
        button=#1e1e2e,blue
        actbutton=#1e1e2e,white
        checkbox=white,#1e1e2e
        actcheckbox=#1e1e2e,white
        entry=white,#1e1e2e
        disentry=white,#1e1e2e
        label=yellow,#1e1e2e
        listbox=white,#1e1e2e
        sellistbox=#1e1e2e,white
        actsellistbox=#1e1e2e,white
        actlistbox=#1e1e2e,#1e1e2e
        textbox=white,#1e1e2e
      ' ${pkgs.alacritty}/bin/alacritty -e nmtui &
    '')

    (writeShellScriptBin "niri-powermenu" ''
      #!/bin/sh
      choice=$(echo -e "󰐥 Shutdown\n󰑓 Reboot\n󰒲 Suspend" | ${pkgs.fuzzel}/bin/fuzzel --dmenu --lines 4 --border-radius=0)
      case $choice in
        *"󰐥 Shutdown") systemctl poweroff ;;
        *"󰑓 Reboot") systemctl reboot ;;
        *"󰒲 Suspend") systemctl suspend ;;
      esac
    '')

    (writeShellScriptBin "niri-wall-next" ''
      #!/bin/sh
      DIR="$HOME/Pictures/Wallpapers"
      STATE_FILE="$HOME/.cache/wall-index"

      mkdir -p "$DIR"
      [ ! -f "$STATE_FILE" ] && echo "0" > "$STATE_FILE"

      INDEX=$(cat "$STATE_FILE")
      FILES=($(
        ls -1 "$DIR"/*.jpg "$DIR"/*.png "$DIR"/*.jpeg "$DIR"/*.gif 2>/dev/null | head -n 100
      ))
      COUNT=''${#FILES[@]}

      [ $COUNT -eq 0 ] && { echo "No wallpapers in $DIR" >&2; exit 1; }

      NEXT_INDEX=$(( (INDEX + 1) % COUNT ))
      echo "$NEXT_INDEX" > "$STATE_FILE"

      ${pkgs.swww}/bin/swww img "''${FILES[$NEXT_INDEX]}" --transition-type fade --transition-duration 1
    '')
  ];
}
