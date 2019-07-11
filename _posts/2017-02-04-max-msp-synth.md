---
layout: post
title: Noise Resonance Synthesizer in Max
tags: [music, portfolio]
comments: true
bigimg: /img/posts/max-msp-synth.png
---

This is one of the posts dedicated to old projects of mine that I deem as cool and worth sharing. Today I'll talk a bit about a class that I was taking in NCTU from [Master Program of Sound and Music Innovative Technologies](http://www.imu.nctu.edu.tw/imu/e-intro.php): **Computer Media: MAX/MSP** and my final project in it.

This class was basically teaching how to manipulate sound in [Max software](https://cycling74.com/products/max/) starting from sine waves and finishing with filters. It was aimed at musicians, not engineers, but still, some important [DSP](https://en.wikipedia.org/wiki/Digital_signal_processing) concepts were introduced and explained from the mathematical point of view (sampling, time domain vs frequency domain). I'd say that learning Max and playing with it helps to understand some fundamental concepts of *digital sound design*, synthesis and how signal flows in audio processors, so if you are interested in that, definitely grab a [trial of Max (30 days)](https://cycling74.com/downloads/#.WJWRIyF96Ht) and go watch some tutorials on youtube to get into it. I definitely recommend [dude837's youtube channel](https://www.youtube.com/channel/UCHen0AQzqOMaPbpjYBhfsTA), he has *loads* of videos from beginner up to advanced level.

## My Final Project

{% include youtube.html id='_dxFC48-V2o' %}

Final project for this class was building a non-standard synthesizer from scratch in Max and do a 5 min live performance with it. After taking inspiration from some tutorials from above-mentioned youtube channel, this is what I came up with.

The core is one noise source that is fed into 3 panned resonance feedback loops. By controlling gain and frequency of feedback loops, you can bring each of 3 modules to an equilibrium or lack of it. Clicking the buttons synchronizes either gain or frequency and resets the system to a more stable state. By experimenting with faders you can get some pretty trippy sounds that oscillate between different pitches up and down and sometimes you can even hear how noise slowly transforms into pitched sound and back. There was no particular goal for this synthesizer, but after it was completed I understood that it gives good insight into how resonance works and why it is important. 

## Learn more

If you are interested in this kind of visual audio programming but don't have money for Max, there is an open-source alternative: [PureData](https://puredata.info/). It is good for people with some background in programming or engineering, although it still can work for beginners with enough motivation and patience (it is not as user-friendly as Max).

For programmers who want to delve into depths of sound design, I would also recommend checking out [ChucK](http://chuck.cs.princeton.edu/) programming language.