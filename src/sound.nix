{
  inputs,
  pkgs,
  ...
}:
{
  # Enable sound with pipewire.
  security.polkit.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    # alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = false;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    wireplumber.enable = true;
    # https://nixos.wiki/wiki/PipeWire#Advanced_Configuration
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        # 32/48kHz is very aggressive and can underrun (crackle) on many systems.
        # Keep latency low, but allow the graph to breathe.
        "default.clock.quantum" = 128;
        "default.clock.min-quantum" = 32;
        "default.clock.max-quantum" = 1024;
      };
    };
    extraConfig.pipewire-pulse."92-low-latency" = {
      context.modules = [
        {
          name = "libpipewire-module-protocol-pulse";
          args = {
            pulse.min.req = "32/48000";
            pulse.default.req = "128/48000";
            pulse.max.req = "1024/48000";
            pulse.min.quantum = "32/48000";
            pulse.max.quantum = "1024/48000";
          };
        }
      ];
      stream.properties = {
        node.latency = "128/48000";
        resample.quality = 4;
      };
    };
    wireplumber.extraConfig = {
      "10-bluez" = {
        "monitor.bluez.properties" = {
          # Enable advanced codecs
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;

          # Supported codecs: sbc, sbc_xq, aac, aptx, aptx_hd, aptx_ll, aptx_ll_duplex, faststream, faststream_duplex, ldac, opus_05, opus_05_51, opus_05_71, opus_g, lc3plus_hr
          # Sets the preferred codec order (try LDAC first, then AptX HD, etc.)
          "bluez5.codecs" = [
            "ldac"
            "aptx-hd"
            "aptx"
            "aac"
            "sbc-xq"
            "sbc"
          ];
        };
        # Rules to apply properties to specific devices
        "monitor.bluez.rules" = [
          {
            matches = [ { "node.name" = "~bluez_output.*"; } ];
            actions = {
              "update-props" = {
                # LDAC encoding quality
                # "auto" (default) - adjusts bitrate based on signal strength
                # "hq"   - 990 kbps (High Quality, high latency, might stutter)
                # "sq"   - 660 kbps (Standard Quality)
                # "mq"   - 330 kbps (Mobile Use Quality, low latency)
                "bluez5.a2dp.ldac.quality" = "auto";
              };
            };
          }
        ];
      };
      "11-bluetooth-priority" = {
        "monitor.bluez.rules" = [
          {
            matches = [
              {
                # This matches all bluetooth output devices
                "node.name" = "~bluez_output.*";
              }
            ];
            actions = {
              "update-props" = {
                # Default is usually 1000. Setting it higher forces the switch.
                "priority.driver" = 1100;
                "priority.session" = 1100;
              };
            };
          }
        ];
      };
    };
  };

}
