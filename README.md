# nabbot-locales
Locales for NabBot multilanguage feature.

## Translation Guidelines
1. Values between curly braces are keywords that are replaced dynamically, and should not be translated. For example:
    ```po
    msgid "I don't have permission to use {channel}."
    msgstr "No tengo permisos para usar ese {channel}."
    ```
2. Punctuation should be the same on the translation string, do not add or remove periods at the end or remove spaces before the string.
3. Discord related terms should be translated the same way the Discord client translates them.
4. Tibia elements should not be translated, for example, vocations, items, cities, monsters, etcetera.