---
title: Séance: Summon Mac Windows
date: November 22, 2026
excerpt: Black magic to save and restore Mac windows in a Space.
---

Projects use so many windows: IDE, browser tabs, Finder, terminal, etc.

I work on so many projects. I fill a Mac Space with windows for one project, and then I open more spaces and do it again for more projects.

Pretty soon I'm sinking Gigabytes of memory, and half my CPU, just to maintain a dozen Mac Spaces filled with windows. If I close the windows, I'll forget what was open, and I don't want to spend time re-arranging all those windows, anyway. So they just keep adding up.

TODO: visual of maxed out spaces and closing them

I decided to design and build a Mac app to save my window locations, and then restore those windows on demand.

## App Form Factor
How should this app present itself to the user?

A traditional window belongs to a Space, and yet this app is responsible for closing and opening all the windows in a Space.

TODO: visual of menu bar popover opening and closing, floated to left

I decided to build this app as a popover that launches from the Mac menu bar. As such, it doesn't really belong to any Space, and it doesn't use a traditional window. It's clear to the user that this app operates at a higher level of control than all other windows and apps on the screen.

## Saving Windows
In a perfect world, saving windows would happen instantaneously. Flip a switch, every window is gone, and its position and state are recorded.

But this is the real world. Things take time.

TODO: Show closing animation

While windows are being closed, the user needs to know that the app knows where all the windows are, and that the app is actively trying to close them.
To accomplish this, the app draws a border around each window it's closing, and animates sparkles to show the user that
progress is being made.

## Restoring Windows
Restoring windows is much more difficult than closing them.

When restoring windows, the app must consider and handle a variety of app configurations:

 * Heavy windows that take many seconds to open
 * Apps that open to a special welcome screen, or update window
 * Multi-window apps (e.g., Chrome with other windows in other Spaces)
 * Project windows (e.g., VSCode working in a specific directory)
 * Threaded windows (e.g., Claude open to a conversation, Slack open to a workspace and conversation)

Putting ourselves in the shoes of a user, the following questions and complaints are critical:

 1. Don't lose any of my windows!
 2. Something went wrong, help me heal it.
 3. This is taking a long time, is it stuck?
 3. Hurry up and finish!

These user concerns are translated to the following app requirements:

 1. Safety - Don't lose windows or configuration, but if you do, help fix it.
 2. Clarity - Show what the app is doing, and make failures obvious.
 3. Speed - Don't make the user wait longer than necessary.

### Safety
To make a best attempt to summon windows without losing any, each window is given 1-2 minutes to summon, before the app gives up.
There must be some point at which the app gives up, but a lot of time is provided, to minimize failures.

Given that each window can take a long time to summon, safety also requires an escape hatch so that the user doesn't
get stuck waiting when he would instead rather cancel and move on to other things. The app provides a mounted display
during summon, which lets the user cancel.

TODO: Show the mounted controls.

Should things go very wrong while summoning, the app continues to remember the original window locations until the user
either updates it, or deletes it. Therefore, the user can try again.

### Clarity
The app highlights and sparkles at every location where it's summoning a window.

After a few seconds, a countdown begins, which represents how long that window has to summon before the app gives up.

TODO: summon example, with timer

Should a window fail to summon, the highlight goes up in smoke, indicating a failure.

TODO: show a failure

### Speed
The app doesn't have much control over the speed of summoning. Each window that's summoned will appear as quickly,
or as slowly as its host app is able to launch it.

The app's focus on speed, instead, is focused on not overwhelming the CPU. Launching a dozen windows at the same
time will bring the system UI to a hault. To help with the appearance of speed, each window summon is staggered by
a few seconds. This takes longer, but often feels quicker, because the UI remains responsive throughout the
process.

TODO: show multiple windows summoned in order

## Naming & Theming
One of my favorite things to do with a new product is to design its brand and theme.

TODO: Show app icon floating to the side

It didn't take long, experimenting with window outlines and particle effects, before I landed on the concept of magic.

Specifically, I decided to frame window restoration as "summoning" windows. The app, which summons those windows, is called Séance.

Séance, and summoning, informed the color scheme, app icon, and the visual effects used to close and summon windows.

## Séance is Publicly Available
You can try Séance for yourself. It's free to <a href="https://seance.randomwalk.design" target="_blank">download</a> and use.