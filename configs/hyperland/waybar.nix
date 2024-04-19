# This is a complete mess -- need to refactor soon.


{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
        ${builtins.readFile "${pkgs.waybar}/etc/xdg/waybar/style.css"}

        @define-color backgroundlight #000000;
        @define-color backgrounddark #000000;
        @define-color workspacesbackground1 #000000;
        @define-color workspacesbackground2 #222222;
        @define-color bordercolor #000000;
        @define-color textcolor1 #FFFFFF;
        @define-color textcolor2 #FFFFFF;
        @define-color textcolor3 #000000;
        @define-color iconcolor #000000;


        /* -----------------------------------------------------
        * General 
        * ----------------------------------------------------- */

        * {
            font-family: "Fira Sans Semibold", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
            border: none;
            border-radius: 0px;
        }

        window#waybar {
            background: rgba(0, 0, 0, 0);
            border-bottom: 0px solid #ffffff;
            /* color: #FFFFFF; */
            transition-property: background-color;
            transition-duration: .5s;
        }

        /* -----------------------------------------------------
        * Workspaces 
        * ----------------------------------------------------- */

        #workspaces {
            background: @workspacesbackground1;
            margin: 5px 1px 6px 1px;
            padding: 0px 1px;
            border-radius: 15px;
            border: 0px;
            font-weight: bold;
            font-style: normal;
            opacity: 0.8;
            font-size: 16px;
            color: @textcolor1;
        }

        #workspaces button {
            padding: 0px 5px;
            margin: 4px 3px;
            border-radius: 15px;
            border: 0px;
            color: @textcolor1;
            background-color: @workspacesbackground2;
            transition: all 0.3s ease-in-out;
            opacity: 0.4;
        }

        #workspaces button.active {
            color: @textcolor1;
            background: @workspacesbackground2;
            border-radius: 15px;
            min-width: 40px;
            transition: all 0.3s ease-in-out;
            opacity:1.0;
        }

        #workspaces button:hover {
            color: @textcolor1;
            background: @workspacesbackground2;
            border-radius: 15px;
            opacity:0.7;
        }

        /* -----------------------------------------------------
        * Tooltips
        * ----------------------------------------------------- */

        tooltip {
            border-radius: 10px;
            background-color: @backgroundlight;
            opacity:0.8;
            padding:20px;
            margin:0px;
        }

        tooltip label {
            color: @textcolor2;
        }

        /* -----------------------------------------------------
        * Window
        * ----------------------------------------------------- */

        #window {
            background: @backgroundlight;
            margin: 8px 15px 8px 0px;
            padding: 2px 10px 0px 10px;
            border-radius: 12px;
            color:@textcolor2;
            font-size:16px;
            font-weight:bold;
            opacity:0.8;
        }

        window#waybar.empty #window {
            background-color:transparent;
        }

        /* -----------------------------------------------------
        * Taskbar
        * ----------------------------------------------------- */

        #taskbar {
            background: @backgroundlight;
            margin: 6px 15px 6px 0px;
            padding:0px;
            border-radius: 15px;
            font-weight: normal;
            font-style: normal;
            opacity:0.8;
            border: 3px solid @backgroundlight;
        }

        #taskbar button {
            margin:0;
            border-radius: 15px;
            padding: 0px 5px 0px 5px;
        }

        /* -----------------------------------------------------
        * Modules
        * ----------------------------------------------------- */

        .modules-left:first-child {
            margin-left: 10px;
        }

        .modules-right:last-child {
            margin-right: 10px;
        }

        /* -----------------------------------------------------
        * Custom Quicklinks
        * ----------------------------------------------------- */

        #custom-brave, 
        #custom-browser, 
        #custom-keybindings, 
        #custom-outlook, 
        #custom-filemanager, 
        #custom-teams, 
        #custom-chatgpt, 
        #custom-calculator, 
        #custom-windowsvm, 
        #custom-cliphist, 
        #custom-wallpaper, 
        #custom-settings, 
        #custom-wallpaper, 
        #custom-system,
        #custom-waybarthemes {
            margin-right: 23px;
            font-size: 20px;
            font-weight: bold;
            opacity: 0.8;
            color: @iconcolor;
        }

        #custom-system {
            margin-right:15px;
        }

        #custom-wallpaper {
            margin-right:25px;
        }

        #custom-waybarthemes, #custom-settings {
            margin-right:20px;
        }

        #custom-ml4w-welcome {
            margin-right: 15px;
            background-image: url("../assets/ml4w-icon.png");
            background-repeat: no-repeat;
            background-position: center;
            padding-right: 24px;
        }

        #custom-chatgpt {
            margin-right: 15px;
            background-image: url("../assets/ai-icon-20.png");
            background-repeat: no-repeat;
            background-position: center;
            padding-right: 24px;
        }

        /* -----------------------------------------------------
        * Idle Inhibator
        * ----------------------------------------------------- */

        #idle_inhibitor {
            margin-right: 15px;
            font-size: 22px;
            font-weight: bold;
            opacity: 0.8;
            color: @iconcolor;
        }

        #idle_inhibitor.activated {
            margin-right: 15px;
            font-size: 20px;
            font-weight: bold;
            opacity: 0.8;
            color: #dc2f2f;
        }

        /* -----------------------------------------------------
        * Custom Modules
        * ----------------------------------------------------- */

        #custom-appmenu {
            background-color: @backgrounddark;
            font-size: 16px;
            color: @textcolor1;
            border-radius: 15px;
            padding: 0px 10px 0px 10px;
            margin: 6px 15px 6px 14px;
            opacity:0.8;
            border:3px solid @bordercolor;
        }

        /* -----------------------------------------------------
        * Custom Exit
        * ----------------------------------------------------- */

        #custom-exit {
            margin: 0px 20px 0px 0px;
            padding:0px;
            font-size:20px;
            color: @iconcolor;
        }

        /* -----------------------------------------------------
        * Custom Updates
        * ----------------------------------------------------- */

        #custom-updates {
            background-color: @backgroundlight;
            font-size: 16px;
            color: @textcolor2;
            border-radius: 15px;
            padding: 2px 10px 0px 10px;
            margin: 8px 15px 8px 0px;
            opacity:0.8;
        }

        #custom-updates.green {
            background-color: @backgroundlight;
        }

        #custom-updates.yellow {
            background-color: #ff9a3c;
            color: #FFFFFF;
        }

        #custom-updates.red {
            background-color: #dc2f2f;
            color: #FFFFFF;
        }

        /* -----------------------------------------------------
        * Custom Youtube
        * ----------------------------------------------------- */

        #custom-youtube {
            background-color: @backgroundlight;
            font-size: 16px;
            color: @textcolor2;
            border-radius: 15px;
            padding: 2px 10px 0px 10px;
            margin: 8px 15px 8px 0px;
            opacity:0.8;
        }

        /* -----------------------------------------------------
        * Hardware Group
        * ----------------------------------------------------- */

        #disk,#memory,#cpu,#language {
            margin:0px;
            padding:0px;
            font-size:16px;
            color:@iconcolor;
        }

        #language {
            margin-right:10px;
        }

        /* -----------------------------------------------------
        * Clock
        * ----------------------------------------------------- */

        #clock {
            background-color: @backgrounddark;
            font-size: 16px;
            color: @textcolor1;
            border-radius: 15px;
            padding: 1px 10px 0px 10px;
            margin: 6px 15px 6px 0px;
            opacity:0.8;
            border:3px solid @bordercolor;
        }

        /* -----------------------------------------------------
        * Pulseaudio
        * ----------------------------------------------------- */

        #pulseaudio {
            background-color: @backgroundlight;
            font-size: 16px;
            color: @textcolor2;
            border-radius: 15px;
            padding: 2px 10px 0px 10px;
            margin: 8px 15px 8px 0px;
            opacity:0.8;
        }

        #pulseaudio.muted {
            background-color: @backgrounddark;
            color: @textcolor1;
        }

        /* -----------------------------------------------------
        * Network
        * ----------------------------------------------------- */

        #network {
            background-color: @backgroundlight;
            font-size: 16px;
            color: @textcolor2;
            border-radius: 15px;
            padding: 2px 10px 0px 10px;
            margin: 8px 15px 8px 0px;
            opacity:0.8;
        }

        #network.ethernet {
            background-color: @backgroundlight;
            color: @textcolor2;
        }

        #network.wifi {
            background-color: @backgroundlight;
            color: @textcolor2;
        }

        /* -----------------------------------------------------
        * Bluetooth
        * ----------------------------------------------------- */

        #bluetooth, #bluetooth.on, #bluetooth.connected {
            background-color: @backgroundlight;
            font-size: 16px;
            color: @textcolor2;
            border-radius: 15px;
            padding: 2px 10px 0px 10px;
            margin: 8px 15px 8px 0px;
            opacity:0.8;
        }

        #bluetooth.off {
            background-color: transparent;
            padding: 0px;
            margin: 0px;
        }

        /* -----------------------------------------------------
        * Battery
        * ----------------------------------------------------- */

        #battery {
            background-color: @backgroundlight;
            font-size: 16px;
            color: @textcolor2;
            border-radius: 15px;
            padding: 2px 15px 0px 10px;
            margin: 8px 15px 8px 0px;
            opacity:0.8;
        }

        #battery.charging, #battery.plugged {
            color: @textcolor2;
            background-color: @backgroundlight;
        }

        @keyframes blink {
            to {
                background-color: @backgroundlight;
                color: @textcolor2;
            }
        }

        #battery.critical:not(.charging) {
            background-color: #f53c3c;
            color: @textcolor3;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

        /* -----------------------------------------------------
        * Tray
        * ----------------------------------------------------- */

        #tray {
            margin: 8px 15px 8px 0px;
            color: @textcolor3;
            background-color: @backgroundlight;
            border-radius: 15px;
        }

        #tray > * {
            margin: 0px 5px;
        }
    '';
    settings = [{
      layer = "top";
      position = "top";
      margin-top = 0;
      margin-bottom = 0;
      tray = {
        icon-size = 21;
        spacing = 10;

      };
      modules-center = [ "hyprland/workspaces" ];
      modules-left = [ "hyprland/window" ];
      modules-right = [
        "pulseaudio"
        "bluetooth"
        "battery"
        "network"
        # "group/hardware"
        "tray"
        # "custom/exit"
        "clock"
      ];

    bluetooth = {
        on-click = "blueman-manager";
    };

    # Power Menu
    "custom/exit" = {
        format = "";
        on-click = "wlogout";
        tooltip = false;
    };


    # Group Hardware
    "group/hardware" = {
        orientation = "inherit";
        drawer = {
            transition-duration = 300;
            children-class = "not-memory";
            transition-left-to-right = false;
        };
        modules = [
            "custom/system"
            "disk"
            "cpu"
            "memory"
            "hyprland/language"
        ];
    };

    # System
    "custom/system" = {
        format = "";
        tooltip = false;
    };

    # Harddisc space used
    disk = {
        interval = 30;
        format = "D {percentage_used}% ";
        path = "/";
    };

    # CPU
    cpu = {
        format = "/ C {usage}% ";
    };


    # Memory
    memory = {
        format = "/ M {}% ";
    };

    # Language
    "hyprland/language" = {
        format = "/ K {short}";
    };


      # Workspaces
      "hyprland/workspaces" = {
          on-click = "activate";
          active-only = false;
          all-outputs = true;
          format = "{}";
          format-icons = {
            urgent = "";
            active = "";
            default = "";
          };
          persistent-workspaces = {
            "*" = 5;
          };
      };

    # Hyprland Window
    "hyprland/window" = {
        # These apps have some extra things like tab name, etc. displayed at the front, so we don't want to display that.
        rewrite = {
            "(.*) - Brave" = "$1";
            "(.*) - Google Chrome" = "$1";
            "(.*) - Brave Search" = "$1";
            "(.*) - Outlook" = "$1";
            "(.*) Microsoft Teams" = "$1";
        };
        separate-outputs = true;
    };

      battery = {
        format = "{capacity}% {icon}";
        format-alt = "{time} {icon}";
        format-charging = "{capacity}% ";
        format-icons = [ "" "" "" "" "" ];
        format-plugged = "{capacity}% ";
        states = {
          critical = 15;
          warning = 30;
        };
      };
      clock = {
        format-alt = "{:%Y-%m-%d}";
        tooltip-format = "{:%Y-%m-%d | %H:%M}";
      };
      network = {
        interval = 1;
        format-alt = "{ifname}: {ipaddr}/{cidr}";
        format-disconnected = "Disconnected ⚠";
        format-ethernet = "{ifname}: {ipaddr}/{cidr}   up: {bandwidthUpBits} down: {bandwidthDownBits}";
        format-linked = "{ifname} (No IP) ";
        format-wifi = "{essid} ({signalStrength}%) ";
      };
      pulseaudio = {
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-icons = {
          car = "";
          default = [ "" "" "" ];
          handsfree = "";
          headphones = "";
          headset = "";
          phone = "";
          portable = "";
        };
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        on-click = "pavucontrol";
      };
      temperature = {
        critical-threshold = 80;
        format = "{temperatureC}°C {icon}";
        format-icons = [ "" "" "" ];
      };
    }];
  };
}
