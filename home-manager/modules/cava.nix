{
    programs.cava = {
        enable = true;
        settings = {
            input.method = "pulse";
            smooth.noise_reduction = 80;
            
            # Hide bars when no audio is playing
            general = {
                bars = 18;
                autosens = 1;
                sensitivity = 100;
                bar_width = 1;
                bar_spacing = 1;
            };
        };
    };
}