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
        { "UpThreshold": 40, "DownThreshold": 0, "FanSpeed": 0.0 },
        { "UpThreshold": 70, "DownThreshold": 65, "FanSpeed": 5.0 },
        { "UpThreshold": 78, "DownThreshold": 69, "FanSpeed": 10.0 },
        { "UpThreshold": 80, "DownThreshold": 75, "FanSpeed": 30.0 },
        { "UpThreshold": 85, "DownThreshold": 75, "FanSpeed": 70.0 },
        { "UpThreshold": 89, "DownThreshold": 78, "FanSpeed": 80.0 },
        { "UpThreshold": 90, "DownThreshold": 85, "FanSpeed": 100.0 }
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
        { "UpThreshold": 52, "DownThreshold": 0, "FanSpeed": 0.0 },
        { "UpThreshold": 60, "DownThreshold": 48, "FanSpeed": 8.0 },
        { "UpThreshold": 73, "DownThreshold": 55, "FanSpeed": 30.0 },
        { "UpThreshold": 80, "DownThreshold": 69, "FanSpeed": 52.0 },
        { "UpThreshold": 89, "DownThreshold": 70, "FanSpeed": 80.0 },
        { "UpThreshold": 90, "DownThreshold": 83, "FanSpeed": 100.0 }
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
    "C /var/lib/nbfc/configs/Acer\\x20Nitro\\x20AN515-47.json 0644 root root - ${nbfcCfg}"
  ];

  # Optional: apply immediately on switch (not only on boot)
  system.activationScripts.nbfcTmpfiles = ''
    ${pkgs.systemd}/bin/systemd-tmpfiles --create
  '';
}
