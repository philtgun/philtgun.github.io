---
layout: post
title: Software Checklist
tags: [general, software]
comments: true
bigimg: 
  - "/img/posts/software-checklist.jpg": "Photo by Liz West"
---

Since I am working with different OS's and reinstalling them on different devices due to a multitude of reasons (e.g. Windows requires reinstalling every 2-3 years to be stable), I decided to compile a list of software and tools that are essential for me for comfortable usage and/or working. I don't think everybody needs all of them, but if you haven't heard of some, I recommend to take a look and give it a try. Who knows, maybe it will lead to "How could I live without it before!" moment. Cross-platformness is one of the important characteristics, so if not mentioned otherwise, it at least works on Windows, Mac, Ubuntu/Debian, and Android.

## Essentials

Regardless of what I am doing with the device, it is most likely that I will install the following software

### [Dropbox](http://dropbox.com/)

Given that I use it as primary sync service, it is an absolute necessity. Yeah, it requires some space, but with smart usage of selective sync, it is manageable. Moreover, it is very useful on mobile devices for quick access to some important files. I still use Google Drive for documents, spreadsheets, and presentations given that collaboration is better, but for everything else I use Dropbox.

### [RescueTime](http://rescuetime.com/)

If you like to gather and analyze data about your activities, or just trying to keep procrastination in control take a look at this service. It has activity categorization, goals and weekly reports, and is very easy to setup and use.

### [Flux](http://justgetflux.com/)

This software makes your screen color warmer in the evening, simple as that. I use it primarily on Windows and Linux. Macs have this feature built-in system, and there is no flux for android. I am using [CF.Lumen](https://play.google.com/store/apps/details?id=eu.chainfire.lumen) because my device is rooted, but otherwise I think [Twilight](https://play.google.com/store/apps/details?id=com.urbandroid.lux) works as good (I was using it before).

## Development

I know there are a lot of IDEs for specific purposes, here I'll just list general ones.

### [Git](https://git-scm.com/)

_Note from future: in 2019 GitHub allows users to have private repos, so the point in favor of GitLab loses its weight a bit_

I refuse to believe that person reading this doesn't know about git. [GitHub](http://github.com) is my go-to service for public repos, for private ones I recommend [GitLab](http://gitlab.com). It has a lot of features including issue boards, inbuilt CI (continuous integration) and is growing pretty fast. You get an unlimited number of repositories and an unlimited number of collaborators (unlike BitBucket). It is also installable on private VMs and servers for free - good for startups.

### [Sublime Text](http://sublimetext.com/)  

My go-to text editor for everything that doesn't fall under specific IDE and just text files. The abundance of plugins and customizability is the primary reason for using it. Apart from widely-used syntax highlighting formats it is very easy to write your own, or download extra ([ChucK](https://packagecontrol.io/packages/ChucK%20Syntax), [Path of Exile item filters](https://www.reddit.com/r/pathofexile/comments/3dllva/item_filter_syntax_highlighting_for/)).
  
Notable plugins:

* [Sublime Linter](http://www.sublimelinter.com/)  
  Base plugin for syntax error checking for various languages (some may require additional software, see [full list](https://github.com/SublimeLinter))
* [GitHub Markdown Preview](https://github.com/facelessuser/MarkdownPreview)  
  Compiles markdown into HTML preview, so you can take a look if you messed up something before committing
* [Git Gutter](https://github.com/jisaacks/GitGutter)  
  After using IntelliJ-based IDEs I really felt lack of visualization of changes since the last commit in the editor, this plugin solves it (a bit slow, but better than nothing) _Another note from the future: Sublime now does that out of the box_

## Linux Console

Packages that I install on Linux-based systems and Mac that have some kind of package manager

### Cowsay & Fortune

![Isn't it adorable?](/img/software/cowsay_fortune.png)

Every time you open your console, you will be greeted with wisdom from a cow. Installing it is as easy as installing those two packages and editing `.bashrc`.

```bash
$ sudo apt-get install cowsay fortune  # use your distribution's package manager
$ echo "fortune | cowsay" >> ~/.bashrc
```

### Steam Locomotive
![What typo in ls can lead to](/img/software/sl.gif)

It depends on a person, but for me, a simple typo can sometimes help to relieve stress and relax during work/coding. Again, available from your favorite package manager.

### TheFuck console helper
![Example from GitHub repo](https://raw.githubusercontent.com/nvbn/thefuck/master/example.gif)

However hilarious and mean this program may seem, it can be customized and configured from bottom up. Don't want to curse? Change it to "please". Don't want the addition of sudo before commands? Disable it! Visit [github page](https://github.com/nvbn/thefuck) for all info.
