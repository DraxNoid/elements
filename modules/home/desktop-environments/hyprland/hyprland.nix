{ lib, config, ... }: 

{
    options = {
        hyprland.enable = lib.mkEnableOption "enables hyprland";
    };

    config = lib.mkIf config.hyprland.enable {
        wayland.windowManager.hyprland = {
            enable = true;
            settings = {
                monitor="eDP-1,1920x1080@60,0x0,1.20";

                "$mainMod" = "SUPER";
                "$browser" = config.shared.browser;
                "$terminal" = config.shared.terminal;
                "$fileManager" = "thunar";
                "$menu" = "rofi -show drun";

                exec-once = [
                    "lxqt-policykit-agent"
                    "waybar"
                    "hyprpaper"
                    "hyprlock"
                    "mako"
                    "[workspace 1 silent] $browser"
                    "[workspace 2] code"
                    "[workspace 3 silent] $terminal"
                    "wl-clip-persist --clipboard regular"
                    "clipse -listen"
                ];

                workspace = [
                    "1, persistent:true"
                    "2, persistent:true"
                    "3, persistent:true"
                ];
                env = [
                    "XCURSOR_SIZE,24"
                    "HYPRCURSOR_SIZE,24"
                ];

                general = { 
                    gaps_in = 5;
                    gaps_out = 5;

                    border_size = 1;

                    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
                    "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
                    "col.inactive_border" = "rgba(595959aa)";

                    # Set to true enable resizing windows by clicking and dragging on borders and gaps
                    resize_on_border = false;

                    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
                    allow_tearing = false;

                    layout = "dwindle";
                };

                decoration = {
                    rounding = 5;

                    # Change transparency of focused and unfocused windows
                    active_opacity = 1.0;
                    inactive_opacity = 1.0;

                    shadow = {
                        enabled = true;
                        range = 4;
                        render_power = 3;
                        color = "rgba(1a1a1aee)";
                    };

                    # https://wiki.hyprland.org/Configuring/Variables/#blur
                    blur = {
                        enabled = true;
                        size = 3;
                        passes = 1;
                        
                        vibrancy = 0.1696;
                    };
                };
                # https://wiki.hyprland.org/Configuring/Variables/#animations
                animations = {
                    enabled = true;

                    # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

                    bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

                    animation = [
                        "windows, 1, 7, myBezier"
                        "windowsOut, 1, 7, default, popin 80%"
                        "border, 1, 10, default"
                        "borderangle, 1, 8, default"
                        "fade, 1, 7, default"
                        "workspaces, 1, 6, default"
                    ];
                };

                # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
                dwindle = {
                    pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
                    preserve_split = true; # You probably want this
                };

                # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
                master = {
                    new_status = "master";
                };

                # https://wiki.hyprland.org/Configuring/Variables/#misc
                misc = { 
                    force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
                    disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
                };


                #############
                ### INPUT ###
                #############

                # https://wiki.hyprland.org/Configuring/Variables/#input
                input = {
                    kb_layout = "us";
                    follow_mouse = 1;
                    sensitivity = 0;
                    accel_profile = "flat";
                    touchpad = {
                        natural_scroll = true;
                    };
                }; 

                # https://wiki.hyprland.org/Configuring/Variables/#gestures
                gestures = {
                };

                # Example per-device config
                # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
                device = [
                    # {
                    # 	name = "logitech-mx-master-3s";
                    # 	sensitivity = 0;
                    # 	accel_profile = "flat";
                    # }
                ];


                ####################
                ### KEYBINDINGSS ###
                ####################

                # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
                bind = [
                    "$mainMod, T, exec, $terminal"
                    "$mainMod, B, exec, $browser"
                    "$mainMod, Q, killactive,"
                    "$mainMod, M, exit,"
                    "$mainMod, E, exec, $fileManager"
                    "$mainMod, F, togglefloating,"
                    "$mainMod, SPACE, exec, $menu"
                    "$mainMod, L, exec, hyprlock"
                    "$mainMod, P, pseudo, # dwindle"
                    "$mainMod, J, togglesplit, # dwindle"
                    "$mainMod, V, exec, [float] $terminal -e 'clipse'"
                    
                    # screenshot
                    "$mainMod, PRINT, exec, hyprshot --clipboard-only -m window"
                    ", PRINT, exec, hyprshot --clipboard-only -m output"
                    "$mainMod SHIFT, PRINT, exec, hyprshot --clipboard-only -m region"
                    
                    # focus with mainMod + arrow keys
                    "$mainMod, Left, movefocus, l"
                    "$mainMod, Right, movefocus, r"
                    "$mainMod, Up, movefocus, u"
                    "$mainMod, Down, movefocus, d"
                    "$mainMod, F, fullscreen, 2"
                    "$mainMod, S, togglegroup"

                    # h workspaces with mainMod + [0-9]
                    "$mainMod, 1, workspace, 1"
                    "$mainMod, 2, workspace, 2"
                    "$mainMod, 3, workspace, 3"
                    "$mainMod, 4, workspace, 4"
                    "$mainMod, 5, workspace, 5"
                    "$mainMod, 6, workspace, 6"
                    "$mainMod, 7, workspace, 7"
                    "$mainMod, 8, workspace, 8"
                    "$mainMod, 9, workspace, 9"
                    "$mainMod, 0, workspace, 10"

                    # active window to a workspace with mainMod + SHIFT + [0-9]
                    "$mainMod SHIFT, 1, movetoworkspace, 1"
                    "$mainMod SHIFT, 2, movetoworkspace, 2"
                    "$mainMod SHIFT, 3, movetoworkspace, 3"
                    "$mainMod SHIFT, 4, movetoworkspace, 4"
                    "$mainMod SHIFT, 5, movetoworkspace, 5"
                    "$mainMod SHIFT, 6, movetoworkspace, 6"
                    "$mainMod SHIFT, 7, movetoworkspace, 7"
                    "$mainMod SHIFT, 8, movetoworkspace, 8"
                    "$mainMod SHIFT, 9, movetoworkspace, 9"
                    "$mainMod SHIFT, 0, movetoworkspace, 10"

                    # le special workspace (scratchpad)
                    "$mainMod, S, togglespecialworkspace, magic"
                    "$mainMod SHIFT, S, movetoworkspace, special:magic"

                    # l through existing workspaces with mainMod + scroll"
                    "$mainMod, mouse_down, workspace, e+1"
                    "$mainMod, mouse_up, workspace, e-1"
                ];

                binde = [
                    ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%+ -l 1"
                    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
                    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
                    ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"
                    ", XF86MonBrightnessUp, exec, brightnessctl set 10%+"
                    ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
                ];
                # Move/resize windows with mainMod + LMB/RMB and dragging
                bindm = [
                    "$mainMod, mouse:272, movewindow"
                    "$mainMod, mouse:273, resizewindow"
                ];


                ##############################
                ### WINDOWS AND WORKSPACES ###
                ##############################

                # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
                # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

                #windowrule = [
                #    "float on, match:title ^(Picture-in-Picture)$"
                #];
            };
        };
    };
}
