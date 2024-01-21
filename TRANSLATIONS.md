# Instructions for Contributors
First and foremost, a big thank you for your interest and contribution.

Follow these steps to contribute your translations:

Note: You should save the text file using the proper encoding format that corresponds to the language you're translating. If you don't, characters will not appear correctly. Language information can be found in media/lua/shared/Translate/%lang%/language.txt files or in the [Modding Localization](https://pzwiki.net/wiki/Modding#Localization) section on the PZ wiki.

1. Check for the language directory in "/media/lua/client/shared/Translate/". If it doesn't exist, create one for your language.
    <br>1a. Copy these files into your language's directory, located at "Translate/\<LANGUAGE\>", and rename them as:
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"IGUI_\<LANGUAGE\>". (e.g., IGUI_EN.txt)
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"ContextMenu_\<LANGUAGE\>.txt".  (e.g., ContextMenu_EN.txt)
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Items_\<LANGUAGE\>.txt".  (e.g., Items_EN.txt)
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Recipes_\<LANGUAGE\>.txt".  (e.g., Recipes_EN.txt)
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Sandbox_\<LANGUAGE\>.txt".  (e.g., Sandbox_EN.txt)
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"Tooltip_\<LANGUAGE\>.txt".  (e.g., Tooltip_EN.txt)

2. The 'header' in the instructions must correspond with the name of the text file.
    <br>For instance, both the text file and its header should be labeled as IGUI_EN, IGUI_RU, IGUI_FR, etc.

3. Begin translating!

Translation Files:
-You'll find the lines that require translation in "/media/lua/client/shared/Translate/\<YOUR_LANGUAGE_FOLDER\>". 
-This folder (e.g., EN, RU, FR) will contain all necessary files.

Important Note:
-Ensure the table header "IGUI_XX" aligns with the in-game language abbreviation used by Project Zomboid.
