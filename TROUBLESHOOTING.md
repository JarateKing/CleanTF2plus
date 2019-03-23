# Troubleshooting

You may run into issues installing and running properly. This serves as an FAQ for some common issues when installing.

## Error Messages

> When I run it, I get an error message saying it was unable to find a certain vpk / exe

The most common cause of this is CleanTF2plus not being in the proper install directory. It should exist in:

```
steam\steamapps\common\Team Fortress 2\tf\custom\CleanTF2plus
```

## Warnings

> When I run it, I get a warning saying things might not work

This is a potential issue with running batch files on your computer, most likely. While (hopefully) things should generate fine, you might find things getting generated even though you never selected them. There is no current fix for this, other than deleting and removing things that were wrongly generated.

## Grainey textures

> When I enable flat textures, instead of being one color they are lots of lines and grainey textures

This is the result of resized flat textures on sv_pure -- it's the original image, except resized down from 512x512 to 1x1 (if you look closely, the 'line' effect is actually just very small textures). The fix for this is to not use the resized option, so that the original size is preserved with the flat textures. This is a tradeoff between returning to default textures in sv_pure 1 or 2, but having a much larger filesize.

## Broken textures

> When I enable fullbright materials, some textures appear fully bright, some appear completely dark, and some don't render at all

This happens when the fullbright / unlit materials are used in a server with sv_pure 1 or 2. This is the reason that currently it's not included in generate.bat and instead is in its own .bat file. If you know that you'll only be playing on community servers with sv_pure 0, you can choose to use this without issue.
