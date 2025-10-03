{...}: {
  home.file.".config/rofi/config-long.rasi".text = ''
    @import "~/.config/rofi/config.rasi"
    window {
      width: 750px;
      border-radius: 20px;
      opacity: 0.92;
    }
    mainbox {
      orientation: vertical;
      children: [ "inputbar", "listbox" ];
    }
    inputbar {
      padding: 50px 10px;
      background-color: transparent;
      background-image: url("/etc/nixos/home-manager/modules/rofi/background.jpg", width);
      height: 200%;
      text-color: @foreground;
      children: [ "textbox-prompt-colon", "entry" ];
    }
    textbox-prompt-colon {
      padding: 12px 20px;
      border-radius: 100%;
      background-color: @bg-alt;
      text-color: @foreground;
    }
    entry {
      expand: true;
      padding: 12px 16px;
      border-radius: 100%;
      background-color: @bg-alt;
      text-color: @foreground;
    }
    button {
      padding: 12px;
      border-radius: 100%;
    }
    element {
      spacing: 10px;
      padding: 12px;
      border-radius: 100%;
    }
    textbox {
      padding: 12px;
      border-radius: 100%;
    }
    error-message {
      border-radius: 0px;
    }
  '';
}
