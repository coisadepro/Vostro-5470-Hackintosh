# Vostro 5470 Hackintosh
This repo contains files used in my guide on **How to Hackintosh Vostro 5470**.

If you have this same machine and would like to install macOS on it, you might want to take a look at the guide, as it contains lots of information I obtained after quite a lot of research and trial and error.

## Required tools
- Clover: [RehabMan's fork](https://bitbucket.org/RehabMan/clover/downloads/) - **[Download](https://bitbucket.org/RehabMan/clover/downloads/Clover_v2.4k_r4359.RM-4506.7036cf0a.zip)**
- Shutdown Patch: [GitHub repo](https://github.com/coisadepro/5470-shutdown-patch) - **[Download](https://github.com/coisadepro/5470-shutdown-patch/releases/download/v1.0/5470_Shutdown_Patch_v1.zip)**

## Required kexts
- FakeSMC: [RehabMan's fork](https://bitbucket.org/RehabMan/os-x-fakesmc-kozlek/downloads/) - **[Download](https://bitbucket.org/RehabMan/os-x-fakesmc-kozlek/downloads/RehabMan-FakeSMC-2017-1017.zip)**
- FakePCIID: [RehabMan's fork](https://bitbucket.org/RehabMan/os-x-fake-pci-id/downloads/) - **[Download](https://bitbucket.org/RehabMan/os-x-fake-pci-id/downloads/RehabMan-FakePCIID-2017-1215.zip)**
- FakePCIID\_Intel\_HD_Graphics [RehabMan's fork](https://bitbucket.org/RehabMan/os-x-fake-pci-id/downloads/) - **[Download](https://bitbucket.org/RehabMan/os-x-fake-pci-id/downloads/RehabMan-FakePCIID-2017-1215.zip)**
- Lilu: [RehabMan's fork](https://bitbucket.org/RehabMan/lilu/downloads/) - **[Download](https://bitbucket.org/RehabMan/lilu/downloads/RehabMan-Lilu-2017-1207.zip)**
- IntelGraphicsFixup: [RehabMan's fork](https://bitbucket.org/RehabMan/intelgraphicsfixup/downloads/) - **[Download](https://bitbucket.org/RehabMan/intelgraphicsfixup/downloads/RehabMan-IntelGraphicsFixup-2017-1015.zip)**
- RealtekRTL8111: [RehabMan's fork](https://bitbucket.org/RehabMan/os-x-realtek-network/downloads/) - **[Download](https://bitbucket.org/RehabMan/os-x-realtek-network/downloads/RehabMan-Realtek-Network-v2-2017-0322.zip)**
- ACPIBatteryManager: [RehabMan's fork](https://bitbucket.org/RehabMan/os-x-acpi-battery-driver/downloads/) - **[Download](https://bitbucket.org/RehabMan/os-x-acpi-battery-driver/downloads/RehabMan-Battery-2017-1001.zip)**
- AppleBacklightInjector: [RehabMan's fork](https://www.tonymacx86.com/threads/guide-laptop-backlight-control-using-applebacklightinjector-kext.218222/) - **[Download](https://github.com/coisadepro/Vostro-5470-Hackintosh/blob/master/Kexts/AppleBacklightInjector.kext.zip?raw=true)**
- CodecCommander: [RehabMan's fork](https://bitbucket.org/RehabMan/os-x-eapd-codec-commander/downloads/) - **[Download](https://bitbucket.org/RehabMan/os-x-eapd-codec-commander/downloads/RehabMan-CodecCommander-2017-0501.zip)**
- AppleALC: [Vit9696's fork](https://github.com/vit9696/AppleALC/releases) - **[Download](https://github.com/vit9696/AppleALC/releases/download/1.2.2/1.2.2.RELEASE.zip)**
- ELAN Touchpad (my version): [Source](http://forum.osxlatitude.com/index.php?/topic/1948-elan-focaltech-and-synaptics-smart-touchpad-driver-mac-os-x/) - **[Download](https://github.com/coisadepro/Vostro-5470-Hackintosh/blob/master/Kexts/ApplePS2SmartTouchPad.kext.zip?raw=true)**

## Required Clover Hot Patches
[See here](https://github.com/coisadepro/Vostro-5470-Hackintosh/blob/master/clover-dsdt-patches.md) for the ones that are **required** to be applied

## Required Clover Extra SSDTs
- SSDT-BATT.aml [Source](https://github.com/coisadepro/Vostro-5470-Hackintosh/blob/master/SSDTs/SSDT-BATT.dsl) - **[Download](https://github.com/coisadepro/Vostro-5470-Hackintosh/blob/master/Bin/SSDT-Extra/SSDT-BATT.aml?raw=true)**
- SSDT-DGPU.aml [Source](https://github.com/coisadepro/Vostro-5470-Hackintosh/blob/master/SSDTs/SSDT-DGPU.dsl) - **[Download](https://github.com/coisadepro/Vostro-5470-Hackintosh/blob/master/Bin/SSDT-Extra/SSDT-DGPU.aml?raw=true)**
- SSDT-PNLF.aml [Source](https://github.com/coisadepro/Vostro-5470-Hackintosh/blob/master/SSDTs/SSDT-PNLF.dsl) - **[Download](https://github.com/coisadepro/Vostro-5470-Hackintosh/blob/master/Bin/SSDT-Extra/SSDT-PNLF.aml?raw=true)**
- SSDT-PTSWAK.aml [Source](https://github.com/coisadepro/Vostro-5470-Hackintosh/blob/master/SSDTs/SSDT-PTSWAK.dsl) - **[Download](https://github.com/coisadepro/Vostro-5470-Hackintosh/blob/master/Bin/SSDT-Extra/SSDT-PTSWAK.aml?raw=true)**

## Required Clover config.plist
I **DO** recommend you to [use this](https://raw.githubusercontent.com/coisadepro/Vostro-5470-Hackintosh/master/config.plist) ```config.plist``` as a base for yours, as it's already **properly configured** with tons of required patches and adjustments.

I recommend **against** using Clover Configurator to modify those .plist files as it used to damage the file. **DO NOT USE** text editors to edit ```config.plist```. Your should either use: Xcode or some other plist editor software.

RehabMan about Clover Configurator | [(Full post)](https://www.tonymacx86.com/threads/guide-lenovo-y50-uhd-or-1080p-using-clover-uefi.232960/)

> You can use Clover Configurator to do this (use google to find/download it). **DO NOT** use Clover Configurator to edit your actual config.plist. Instead edit a "dummy" config.plist to create the SMBIOS data and then use copy/paste with a plist editor (I use Xcode) to copy the SMBIOS section into my active config.plist. Clover Configurator is too buggy and cannot be trusted with edits to your real config.plist.

> Repeat: **DO NOT** edit your config.plist with Clover Configurator. Clover Configurator will erase important settings from the config.plist, and as a result, it will not work.

## License
MIT License

Copyright (c) 2018 CoisadePro

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.