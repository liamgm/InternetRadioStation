# InternetRadioStation
This is a very simple means to set up an internet radio station on Windows (64-bit versions.) All software aside from the startup.bat and a few configuration files are not
my work, but rather outstanding projects made successful by the efforts of many other programmers and are available at links below.

The idea of this project is is to broadcast your radio station using IceCast, a very standard streaming server for live, radio-like broadcasts. To provide audio for IceCast to stream,
it uses Mixxx, a quite sophisticated application for live DJ'ing music designed to connect to IceCast servers like yours. You can set those two applications up yourself, their websites are:

[MIXXX.org](https://mixxx.org/)

[IceCast.org](http://icecast.org/)

Alternatively, you can use this project to set it up as automatically as I could manage. I assumed that most schools would be using Windows computers built within the last
half-decade and so that would be the most widely useful setup.

To do so, [download this project](https://github.com/liamgm/InternetRadioStation/archive/master.zip) to your Windows computer, unzip it, and run the startup.bat batch file.

In general, it is *a bad idea* to run batch (.bat) files provided by strangers over the internet.

The batch file in this project cites sources for anything non-trivial that it's doing.

This is what it does:

1. It checks to see if you have already run Mixxx, which would create a set of configuration files in your windows user profile. If you haven't, it starts the configuration file to tell MIXXX how to connect to your IceCast server.
2. It finds your computer's IP address and creates a shortcut to your computer's address on the internet where IceCast will be available
3. It starts the IceCast server in a new window, so you can turn it off easily, by closing that window
4. It starts the Mixxx DJ software that you'll use to play audio on your server

This is what you'll experience:

1. A message may appear warning you that running batch files you downloaded from the internet is *a bad idea* just like I said. If you let it run, then you'll see a black window with a lot of white text flowing on it. (A command prompt.)
2. When IceCast starts up, Windows will prompt you that IceCast wants you to open up port 8000 on your computer's firewall: doing so will allow other computers to connect to Icecast. (If you want to run the radio station, you should do this.)
3. When Mixxx starts up for the first time, it will prompt you to choose a Music Library Directory: a folder on your computer containing the audio you'd like to make available to you for broadcasting.
4. Once Mixxx loads, you should click the Options menu, and choose "Enable Live Broadcasting". An alert window should tell you that it successfully connected to the streaming server.

You now have a radio station ready!

To load audio into Mixxx, you can either use [AutoDJ](https://www.mixxx.org/manual/latest/chapters/library.html#auto-dj-automate-your-mix) or load a long audio file into a deck and set it to loop.

I'll describe how to use the latter technique, since it is more set-and-forget.

1. Get the audio file into your library, either by having it in the folder that you chose for your Music Library Direcory or by dragging it into the Library panel across most of the bottom of the Mixxx window.
2. Right click on the audio file in that library pane and select "Load to Deck 1"
3. You'll se a waveform calculated for the audio file at the top left of corner of the window (Deck 1). find the Play/Pause button underneath Deck 1's red CUE button and press it.
4. To loop that audio, click the "Repeat" icon in the middle of the top row of buttons to the right of where the waveform for this audio is shown.
5. In the InternetRadioStation folder, double-click on the LinkToClassRadioStation shortcut, which will open your default web browser to the location of your IceCast server and you should see "Mount Point /classradiostation"
6. Underneath that is an HTML5 audio player, plus some information about your radio station. If you press play on the radio station, you'll hear your music slightly delayed playing over the music coming out of Mixxx.
7. If you send the url in your web browser to your class, they can access the IceCast server and listen to the radio broadcast.

Again, to shut down the Radio Station, you only need to close the command prompt window that IceCast is running in.

To restart the radio station, use the startup.bat file, which will again run the routine described above.

Some caveats to this setup:

Your school's network very likely is firewalled from the public internet, meaning that the link to your server won't work for computers outside of your school or for mobile devices that aren't on the school's network. Computers in the library or elsewhere in the classroom will be able to connect.  If you have open-access school wi-fi, I'm very impressed with your school district and mobile devices on the wi-fi network will likely be able to receive your stream.

Similarly, if you run this on your home network, you can listen to your radio station from anywhere else on the home network, but your network's firewall, built into the router, will prevent anyone from outside the home network from accessing your radio station.

Providing your computer's IP address to students involves exposure to some amount of risk if your computer is unsafely built, meaning that its own firewall is allowing more public access beyond what you opened for IceCast.

It would be best to change the passwords for IceCast as well from the setup provided here. After [changing the passwords in the configuration/icecast.xml file](http://icecast.org/docs/icecast-2.4.1/config-file.html#authentication), you would also need to [change them in Mixxx as well](https://www.mixxx.org/manual/latest/chapters/livebroadcasting.html#id1).

## Source Code

[Source code for Mixxx](https://github.com/mixxxdj/mixxx)

[Source code for IceCast](https://github.com/xiph/Icecast-Server)