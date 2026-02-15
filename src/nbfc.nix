# nbfc.nix
{
  pkgs,
  ...
}:
let
  myUser = "toonzzzrock"; # adjust this to your username
  command = "bin/nbfc_service --config-file '/home/${myUser}/.config/nbfc.json'";
  nbfcCfg = pkgs.writeText "Acer-Nitro-AN515-47.json" ''
    {
     "NotebookModel": "Acer Nitro AN515-47",
     "Author": "Josesk Volpe",
     "EcPollInterval": 3000,
     "ReadWriteWords": true,
     "CriticalTemperature": 90,
     "FanConfigurations": [
      {
       "ReadRegister": 19,
       "WriteRegister": 55,
       "MinSpeedValue": 0,
       "MaxSpeedValue": 100,
       "IndependentReadMinMaxValues": true,
       "MinSpeedValueRead": 0,
       "MaxSpeedValueRead": 7317,
       "ResetRequired": true,
       "FanSpeedResetValue": 0,
       "FanDisplayName": "CPU fan",
       "TemperatureThresholds": [
        { "UpThreshold": 30, "DownThreshold": 0, "FanSpeed": 30.0 },
        { "UpThreshold": 35, "DownThreshold": 30, "FanSpeed": 40.0 },
        { "UpThreshold": 40, "DownThreshold": 35, "FanSpeed": 50.0 },
        { "UpThreshold": 45, "DownThreshold": 40, "FanSpeed": 60.0 },
        { "UpThreshold": 50, "DownThreshold": 45, "FanSpeed": 70.0 },
        { "UpThreshold": 55, "DownThreshold": 50, "FanSpeed": 80.0 },
        { "UpThreshold": 60, "DownThreshold": 55, "FanSpeed": 90.0 },
        { "UpThreshold": 70, "DownThreshold": 60, "FanSpeed": 100.0 },
       ],
       "FanSpeedPercentageOverrides": []
      },
      {
       "ReadRegister": 21,
       "WriteRegister": 58,
       "MinSpeedValue": 0,
       "MaxSpeedValue": 100,
       "IndependentReadMinMaxValues": true,
       "MinSpeedValueRead": 0,
       "MaxSpeedValueRead": 7317,
       "ResetRequired": true,
       "FanSpeedResetValue": 0,
       "FanDisplayName": "GPU fan",
       "TemperatureThresholds": [
        { "UpThreshold": 30, "DownThreshold": 0, "FanSpeed": 30.0 },
        { "UpThreshold": 35, "DownThreshold": 30, "FanSpeed": 40.0 },
        { "UpThreshold": 40, "DownThreshold": 35, "FanSpeed": 50.0 },
        { "UpThreshold": 45, "DownThreshold": 40, "FanSpeed": 60.0 },
        { "UpThreshold": 50, "DownThreshold": 45, "FanSpeed": 70.0 },
        { "UpThreshold": 55, "DownThreshold": 50, "FanSpeed": 80.0 },
        { "UpThreshold": 60, "DownThreshold": 55, "FanSpeed": 90.0 },
        { "UpThreshold": 70, "DownThreshold": 60, "FanSpeed": 100.0 },
       ],
       "FanSpeedPercentageOverrides": []
      }
     ],
     "RegisterWriteConfigurations": [
      {
       "WriteMode": "Set",
       "WriteOccasion": "OnInitialization",
       "Register": 34,
       "Value": 12,
       "ResetRequired": true,
       "ResetValue": 4,
       "ResetWriteMode": "Set",
       "Description": "CPU fan manual mode"
      },
      {
       "WriteMode": "Set",
       "WriteOccasion": "OnInitialization",
       "Register": 33,
       "Value": 48,
       "ResetRequired": true,
       "ResetValue": 16,
       "ResetWriteMode": "Set",
       "Description": "GPU fan manual mode"
      },
      {
       "WriteMode": "Set",
       "WriteOccasion": "OnInitialization",
       "Register": 3,
       "Value": 17,
       "ResetRequired": false,
       "Description": "Enables fan control in Linux for some reason"
      }
     ]
    }
  '';
in
{
  systemd.services.nbfc_service = {
    enable = true;
    description = "NoteBook FanControl service";
    serviceConfig.Type = "simple";
    path = [ pkgs.kmod ];

    script = "${pkgs.nbfc-linux}/${command}";

    wantedBy = [ "multi-user.target" ];
  };

  systemd.tmpfiles.rules = [
    "d /var/lib/nbfc/configs 0755 root root - -"
    # Remove any existing file/symlink so it gets replaced reliably.
    "r /var/lib/nbfc/configs/Acer\\x20Nitro\\x20AN515-47.json - - - -"
    # Create (and overwrite) a symlink to the Nix store config.
    "L+ /var/lib/nbfc/configs/Acer\\x20Nitro\\x20AN515-47.json 0644 root root - ${nbfcCfg}"
  ];

  # Optional: apply immediately on switch (not only on boot)
  system.activationScripts.nbfcTmpfiles = ''
    ${pkgs.systemd}/bin/systemd-tmpfiles --create
  '';
}
