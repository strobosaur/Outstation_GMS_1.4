///sh_chrome_shake(wave, jitter, saturation, contrast)

    sys_display.sh_wavelen_mod += argument0 * 2.5// + (argument0 * 0.025);
    sys_display.sh_jitterlen_mod += argument1 * 2.25// + (argument1 * 0.025);
    sys_display.sh_saturation_mod += argument2 * 0.5// + (argument2 * 0.25);
    sys_display.sh_contrast_mod = argument3 * 0.125// + (argument3 * 0.1);
