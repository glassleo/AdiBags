# AdiBags

## [v1.10.0](https://github.com/AdiAddons/AdiBags/tree/v1.10.0) (2023-01-08)
[Full Changelog](https://github.com/AdiAddons/AdiBags/compare/v1.9.54...v1.10.0) [Previous Releases](https://github.com/AdiAddons/AdiBags/releases)

- New Theme Engine (#880)  
    This patch significantly enhances the skinning and theme system for AdiBags. The overall goal of this version is to make some more user-friendly defaults for first time users, while also enhancing the ability to customize the look and feel of AdiBags for more advanced users. Highlights include:  
    * Full Masque support for backpack and banks independently. Configure Masque from the Masque configuration screen.  
    * Addition of a theme system, where backpack, bank, and reagent bank can be independently themed. Multiple user defined themes can also be saved and loaded. Skins from any previous version of AdiBags will be saved as a new theme called "legacy theme", so that user settings are not lost upon upgrade.  
    * An external Theme API for addon developers. The AdiBags look and feel can now be modified by external addons, which will allow for a much more customizable experience when integrating with other addons.  
    * Removal of the "Anchored" mode for bag movement. Bags now can only be moved by clicking and dragging the header of the bag.  
    * Cleaner defaults for new users, such as a slightly revamped new default theme, normalized scaling, and better initial currency display options.  
    Overall, this patch should clean up a lot of the major asks people have had of AdiBags over the years. As always, please report any issues you come up against to github.com/AdiAddons/AdiBags/issues  