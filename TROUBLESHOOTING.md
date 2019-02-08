# Troubleshooting

You may run into issues installing and running properly. This serves as an FAQ for some common issues when installing.

## Empty folders

> When I run it, I get no errors, but the materials / models / etc. folders are empty

The most common cause of this is CleanTF2plus not being in the proper install directory. It should exist in:

```
steam\steamapps\common\Team Fortress 2\tf\custom\CleanTF2plus
```

## Broken textures

> When I enable fullbright materials, some textures appear fully bright, some appear completely dark, and some don't render at all

This happens when the fullbright / unlit materials are used in a server with sv_pure 1 or 2. This is the reason that currently it's not included in generate.bat and instead is in its own .bat file. If you know that you'll only be playing on community servers with sv_pure 0, you can choose to use this without issue.