# nbfc.nix
{
  config,
  inputs,
  pkgs,
  ...
}:
let
  myUser = "toonzzzrock"; # adjust this to your username
  command = "bin/nbfc_service --config-file '/home/${myUser}/.config/nbfc.json'";
in
{
  systemd.services.nbfc_service = {
    enable = true;
    description = "NoteBook FanControl service";
    serviceConfig.Type = "simple";
    path = [ pkgs.kmod ];

    # if you are on stable uncomment the next line
    # script = "${inputs.nbfc-linux.packages.x86_64-linux.default}/${command}";
    # if you are on unstable uncomment the next line
    script = "${pkgs.nbfc-linux}/${command}";

    wantedBy = [ "multi-user.target" ];
  };
  # /var/lib/nbfc/configs/Acer Nitro AN515-47.json
  #  {
  #  "NotebookModel": "Acer Nitro AN515-47",
  #  "Author": "Josesk Volpe",
  #  "EcPollInterval": 3000,
  #  "ReadWriteWords": true,
  #  "CriticalTemperature": 90,
  #  "FanConfigurations": [
  #  {
  #  "ReadRegister": 19,
  #  "WriteRegister": 55,
  #  "MinSpeedValue": 0,
  #  "MaxSpeedValue": 100,
  #  "IndependentReadMinMaxValues": true,
  #  "MinSpeedValueRead": 0,
  #  "MaxSpeedValueRead": 7317,
  #  "ResetRequired": true,
  #  "FanSpeedResetValue": 0,
  #  "FanDisplayName": "CPU fan",
  #  "TemperatureThresholds": [
  #  {
  #  "UpThreshold": 40,
  #  "DownThreshold": 0,
  #  "FanSpeed": 20.0
  #  },
  #  {
  #  "UpThreshold": 50,
  #  "DownThreshold": 41,
  #  "FanSpeed": 30.0
  #  },
  #  {
  #  "UpThreshold": 64,
  #  "DownThreshold": 51,
  #  "FanSpeed": 40.0
  #  },
  #  {
  #  "UpThreshold": 70,
  #  "DownThreshold": 65,
  #  "FanSpeed": 50.0
  #  },
  #  {
  #  "UpThreshold": 78,
  #  "DownThreshold": 69,
  #  "FanSpeed": 80.0
  #  },
  #  {
  #  "UpThreshold": 80,
  #  "DownThreshold": 75,
  #  "FanSpeed": 86.0
  #  },
  #  {
  #  "UpThreshold": 85,
  #  "DownThreshold": 75,
  #  "FanSpeed": 90.0
  #  },
  #  {
  #  "UpThreshold": 89,
  #  "DownThreshold": 78,
  #  "FanSpeed": 95.0
  #  },
  #  {
  #  "UpThreshold": 90,
  #  "DownThreshold": 85,
  #  "FanSpeed": 100.0
  #  }
  #  ],
  #  "FanSpeedPercentageOverrides": []
  #  },
  #  {
  #  "ReadRegister": 21,
  #  "WriteRegister": 58,
  #  "MinSpeedValue": 0,
  #  "MaxSpeedValue": 100,
  #  "IndependentReadMinMaxValues": true,
  #  "MinSpeedValueRead": 0,
  #  "MaxSpeedValueRead": 7317,
  #  "ResetRequired": true,
  #  "FanSpeedResetValue": 0,
  #  "FanDisplayName": "GPU fan",
  #  "TemperatureThresholds": [
  #  {
  #  "UpThreshold": 40,
  #  "DownThreshold": 0,
  #  "FanSpeed": 20.0
  #  },
  #  {
  #  "UpThreshold": 50,
  #  "DownThreshold": 41,
  #  "FanSpeed": 30.0
  #  },
  #  {
  #  "UpThreshold": 64,
  #  "DownThreshold": 51,
  #  "FanSpeed": 40.0
  #  },
  #  {
  #  "UpThreshold": 70,
  #  "DownThreshold": 65,
  #  "FanSpeed": 50.0
  #  },
  #  {
  #  "UpThreshold": 78,
  #  "DownThreshold": 69,
  #  "FanSpeed": 80.0
  #  },z
  #  {
  #  "UpThreshold": 80,
  #  "DownThreshold": 75,
  #  "FanSpeed": 86.0
  #  },
  #  {
  #  "UpThreshold": 85,
  #  "DownThreshold": 75,
  #  "FanSpeed": 90.0
  #  },
  #  {
  #  "UpThreshold": 89,
  #  "DownThreshold": 78,
  #  "FanSpeed": 95.0
  #  },
  #  {
  #  "UpThreshold": 90,
  #  "DownThreshold": 85,
  #  "FanSpeed": 100.0
  #  }
  #  ],
  #  "FanSpeedPercentageOverrides": []
  #  }
  #  ],
  #  "RegisterWriteConfigurations": [
  #  {
  #  "WriteMode": "Set",
  #  "WriteOccasion": "OnInitialization",
  #  "Register": 34,
  #  "Value": 12,
  #  "ResetRequired": true,
  #  "ResetValue": 4,
  #  "ResetWriteMode": "Set",
  #  "Description": "CPU fan manual mode"
  #  },
  #  {
  #  "WriteMode": "Set",
  #  "WriteOccasion": "OnInitialization",
  #  "Register": 33,
  #  "Value": 48,
  #  "ResetRequired": true,
  #  "ResetValue": 16,
  #  "ResetWriteMode": "Set",
  #  "Description": "GPU fan manual mode"
  #  },
  #  {
  #  "WriteMode": "Set",
  #  "WriteOccasion": "OnInitialization",
  #  "Register": 3,
  #  "Value": 17,
  #  "ResetRequired": false,
  #  "Description": "Enables fan control in Linux for some reason"
  #  }
  #  ]
  #  }
}
