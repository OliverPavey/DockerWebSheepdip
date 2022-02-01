# SheepDip dockerized WebBrowser

SheepDip makes use of Docker and an X11 server to allow the visiting of an untrusted website in a
relatively secure manner, without the expense of a separate computer.

The browsers supported are Firefox, Chromium (the open source sister of Chrome) and Luakit.

**For performane reasons I recommend the use of Luakit.**  Both Firefox and Chromium are very slow
to us when run with sheepdip.

> In computing "sheepdip" is a term for a computer which is not connected to any network, and which
> has security software (such as a virus scanner).  This can then be used to scan incoming media
> (such as memory cards, usb sticks and devices, CD/DVD media and floppy disks.)

## Pre-requisites

You will need to have installed:

- Docker.
- An X11 Server.  

You need to know how to launch and type commands at a bash prompt.  It will help if you have some
basic Docker knowledge too, but you don't need to be an expert.

> Windows users will gain a bash prompty by installing docker. Other operating systems should already
> have a bash prompt.

## Usage Instructions

- Install Docker
- Install MobaXTerm
- Run "./sheepdip build" to build the Docker images
- Launch MobaXTerm (which includes an X11 server)
- Set your DISPLAY variable to point to your X11 server. *e.g.
  `export DISPLAY=192.168.0.???:0.0` where 192.168.0.??? is your machines network IP address.*
- Run "./sheepdip luakit" or "./sheepdip luakit" or "./sheepdip luakit"
- Answer yes to the X11 prompts. (Typically there are four of these.)
- The browser window should open.
- Close the browser window when finished.

N.B. You can only launch one sheepdip at a time. This is intentional.

> Your IP address can be found with `ip a` or `ifconfig` on Linux, or `iconfig` on Windows.

## Syntax

- `./sheepdip.sh build` Build the docker images.
- `./sheepdip.sh luakit` Start the luakit sheepdip docker container.
- `./sheepdip.sh firefox` Start the firefox sheepdip docker container.
- `./sheepdip.sh chromium` Start the chromium sheepdip docker container.
- `./sheepdip.sh stop` Stop the sheepdip docker container, if the browser window cannot be closed.
- `./sheepdip.sh logs` Follow the output of the sheepdip container.
- `./sheepdip.sh bash` Launch a bash prompt in the sheepdip container.

## Using Luakit

Luakit is a keyboard driven browser.  At a minium you will nee to know that 'o' is the shortcut
open or navigate to a URL, after which you type or paste the URL and press enter.

For more information see the [Luakit quick start guide](https://luakit.github.io/docs/pages/03-quick-start-guide.html)

## Other X11 Servers

The X11 server in MobaXTerm will ask if the application should open.  If you use an alternate X11 Server
such as XMing you will need to configure, or disable, access control.

## Retrieving downloaded files

Files can be copied from the docker container before the browser window is closed, using the command:

`docker cp sheepdip:/path-to-file/filename local-filename`

e.g.

`docker cp sheepdip:/home/document.txt document.txt`
