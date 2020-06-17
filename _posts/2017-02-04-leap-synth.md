---
layout: post
title: LEAP Synthesizer in Pure Data
tags: [music, portfolio, linux]
comments: true
cover-img: /img/posts/leap-synth.jpg
---

To make up for the missed month, here is another post that finally came out of drafts on a similar topic.

Since forever I had this idea about creating and altering music or sound with just a wave of a hand. With more free time available after I finished my master's and reduced amount of procrastination, I set a goal to at least do some fun project that is related to this idea. And after [LEAP Motion](https://www.leapmotion.com/) controller was ordered and delivered to my door I had no excuses to postpone it any longer.

For my first proof-of-concept, I decided to make a simple synthesizer that will take input from LEAP and use the distance to hand as one parameter to generate simple sound. So here I present to you simple tutorial on how to do integrate LEAP as a controller into [PureData](https://puredata.info/) (PD). I will be using Ubuntu environment (Kubuntu 16.06), but I believe it can be easily done for other Debian-based distributions and not so easily, but still possible on other ones. 

{% include youtube.html id='VDKKXf6C7zQ' %}

## LEAP + Linux

Because we don't need full VR SDK for LEAP (moreover which is currently only supported on Windows), first we need to download and install Linux driver and SDK. You will need to create an account on the LEAP motion website to download it. Go to [SDK webpage](https://developer.leapmotion.com/sdk/v2), download archive and install .deb package (2.3.1 was the latest version at the time, replace it with your version). You will also need to copy the content of `LeapSDK` folder to your system for integration with PD.

```bash
$ tar xvf Leap_Motion_SDK_Linux_2.3.1.tgz
$ cd LeapDeveloperKit_2.3.1+31549_linux/
$ sudo dpkg --install Leap-2.3.1+31549-x64.deb
$ cp -r LeapSDK ~  # replace "~" with your location for SDK
```

After installation, you should have `leapd` and `LeapControlPanel` executables on your path. If you have later versions of Ubuntu that are using `systemd` as service manager, you will have this message:

```bash
This does not appear to be a Debian or Ubuntu-compatible distro
If you would like Leap Motion to run as a service, it is up to you
to configure systemd or /etc/init.d appropriately.
```

Before configuring `systemd` let's test if everything is working. Run `leapd` in one terminal window (it requires superuser hardware access permissions), and `LeapControlPanel` in another terminal.

```bash
$ sudo leapd
[Info] WebSocket server started
[Info] Secure WebSocket server started
[Info] Leap Motion Controller detected: S323A036298
[Info] Firmware is up to date.
```

You should see a new icon in your system's tray. It might actually happen that there will be no icon, just an empty space, but it should be intractable anyway. Right click on it and open Settings.

![No Icon Bug](/img/leap/no-icon.png){: .center-block :}

![Settings](/img/leap/context-settings.png){: .center-block :}

Go to *Troubleshooting* tab in Leap Motion Control Panel and click on *Diagnostic Visualizer* to see if everything is working.

![Control Panel](/img/leap/control-panel.png){: .center-block :}

![Diagnostic Visualizer](/img/leap/diagnostic-visualizer.png){: .center-block :}

Now if you don't want to start `leapd` each time manually, you can create a systemd service file for it: `/etc/systemd/system/leapd.service` (check your executable path with `which leap`):

```systemd
[Unit]
Description=LeapMotion Daemon
After=syslog.target

[Service]
Type=simple
ExecStart=/usr/sbin/leapd
# ExecStart=/usr/sbin/LeapControlPanel  # uncomment this line if you want to autostart it also
Restart=on-failure
RestartSec=3

[Install]
WantedBy=multi-user.target
```

Then you need to apply changes and start it this time manually. Next time after reboot or login it will be automatically up and running.

```bash
$ sudo systemctl daemon-reload
$ sudo systemctl start leapd.service
$ sudo status leapd.service
● leapd.service - LeapMotion Daemon
   Loaded: loaded (/lib/systemd/system/leapd.service; enabled; vendor preset: enabled)
   Active: active (running) since Sat 2017-02-04 17:40:40 CST; 7s ago
   Main PID: 21482 (leapd)
   CGroup: /system.slice/leapd.service
           └─21482 /usr/sbin/leapd

Feb 04 17:40:40 astra systemd[1]: Started LeapMotion Daemon.
Feb 04 17:40:40 astra leapd[21482]: [Info] WebSocket server started
Feb 04 17:40:40 astra leapd[21482]: [Info] Secure WebSocket server started
Feb 04 17:40:41 astra leapd[21482]: [Info] Leap Motion Controller detected: XXXXXXXXXXX
Feb 04 17:40:41 astra leapd[21482]: [Info] Firmware is up to date.
```

## PureData (PD)

```bash
$ sudo apt-get update
$ sudo apt-get install pd-extended
```

For more details on installation [check official website](https://puredata.info/docs/faq/debian). Test your audio setup by running PD and going to *Media* > *Test Audio and MIDI*. In the new window (right on the picture) check if you can make some sound (see test tones). If not, check your audio settings (bottom left on the picture). Usually, ALSA engine works pretty good on Debian based systems, so select it in the menu, and select proper output device in *Audio Settings*. If no options work for your setup, check the forums, or use more advanced [Jack](http://www.jackaudio.org/) audio engine. Note: although most of Linux music software works with Jack out of the box, you might need to reconfigure your system's audio players, browsers or other software.

![PD setup](/img/leap/pd-setup-ed.png){: .center-block :}

## Integration

If you are new to PD, the most important things here are *objects*. You can have a signal generator, output, input, and a lot of other objects making the core of your patch. The most simple PD patch consists of sine wave oscillator hooked up into the output. There is [a free book for beginners](http://www.pd-tutorial.com/) as well as [comprehensive documentation](https://puredata.info/docs) on PD, so if you want, you can dig deep into it. Although I would recommend learning [Max](https://cycling74.com/products/max/) because it has much more functionality and is more user-friendly, it is not yet available on Linux.

![PD simple patch](/img/leap/pd-osc.png){: .center-block :}

So now we need to integrate LEAP into PD. Thankfully [Chikashi Miyama](http://www.chikashi.net/) have developed a [plugin](http://puredatajapan.info/?page_id=1514) that does exactly what we need. Unfortunately for me, there was no binary file for Linux available for download, only source code, so I had to compile it myself using [flext](https://github.com/grrrr/flext) written by [Thomas Grill](http://grrrr.org/). Fortunately for those of you on 64-bit Linux reading this post [here](/files/pd/leapmotion.pd_linux) you can download binary PD plugin.

Now you can try creating *leapmotion* object in PD. Make sure it is in the same directory as your new .pd file and insert an object (*Put* > *Object*). Type *leapmotion* and click somewhere else inside the window. 

![Initial test](/img/leap/pd-leap0.png){: .center-block :}

If you see no errors in console, congratulations, your PD found Leap SDK (highly unlikely). If you see an error in console similar to mine, it means PD recognized *leapmotion* as a plugin, but couldn't load it because of `undefined symbol: _ZTIN4Leap9InterfaceE`. In other words, it didn't find the implementation for LEAP interface. And that's where SDK comes into play.

The last step is to utilize Leap SDK to connect the actual device to PD plugin. Although PD's preferences have library loading functionality, it didn't work for me, so I have used the command line to load SDK library into PD's runtime

```bash
LD_PRELOAD=/path/to/LeapSDK/lib/x64/libLeap.so puredata file.pd
```

![Success](/img/leap/pd-leap1.png){: .center-block :}

If you see no errors in console, like on the picture above, congratulations, everything is working now. If not, check if Leap is connected, service is running `systemctl status leapd`, troubleshoot it with *LeapControlPanel*. 

Now we can create a [simple patch](/files/pd/leap-synth.pd) to change the pitch of sine wave with a wave of a hand. I will not go into details why it is designed in exactly this way, but I left some comments to understand the overall structure.

![Synth](/img/leap/pd-leap2.png){: .center-block :}

You can find more patch examples in PD-Japan [blog post](http://puredatajapan.info/?page_id=1514) zip file for Mac. 

## Going above and beyond

Starting from here and learning about more capabilities of Pure Data, you can play with adding more variables received from LEAP Motion Controller: hand position, direction, gestures, fingers. There is huge room for the creativity of designing flow of data processing and transformation into music, not mentioning algorithms to smooth out our natural motions for the better musical experience.
