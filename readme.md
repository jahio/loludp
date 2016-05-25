# A (laughably) simplistic UDP client/server

...and all it does is bind somewhere and then put stuff to `STDOUT`. That's seriously it.

It was something to help m sanity-check myself while considering the (possibly insane?) idea of writing a locally-served DNS "overlay" (some might call it a proxy, I like "overlay" better so imma use dat) I could run on localhost on a (hopefully) NON-privileged port. Turns out it doesn't look terribly simple to have OS X's network preferences (note: OS X's dev docs and the comments in `/etc/resolv.conf` literally tell you not to write to the file so I ummm...didn't) query different ports other than 53 even if you type 'em in there. At least for me it was "lol imma just remove everything after this ipv4 octet on the end here haha, you so stupid jah lulz".

So yeah, it's like that yo.

## But dude...why?

Why's it here? So I have an entirely too simple reference if in the future I ever find myself using Ruby to do UDP socket stuffs. Which is definitely on the lower end of the probability spectrum but then again, I mean, c'mon, this is devops (my field anyway), we run into arcane "WHAT THE FRAK?", as-close-as-you-can-get-to-absolute-zero-probability shit like every day. I've learned (the hard way) that once you've got a totally wicked example of something that DEFINITELY works, it makes a helluva good reference a couple years in the future because it's far better "hooked" in your memory and it's not overly-complex and contrived with a bunch of bullshit showing off a hundred features of a DSL only available if you load aaaaaaallll these god-awful gems up FIRST before you actually write a line of code. Seems like that's half the examples I wind up finding online. The other half? Google's cache of some dork's blog post from 2007, also known as "back in the day" and/or "ancient" where nothing discussed works anymore and we laugh with derision at what everybody considered "cutting edge best practices" then.

`/sarcastic stream-of-consciousness rant`

## But dude...how?

First, shove this in `~/.pryrc`:

`Pry.config.editor = "vim"`

Save that file. Next, `gem install pry` optionally followed by `rbenv rehash` if using [rbenv](http://github.com/rbenv/rbenv). Now you should have `pry` in `$PATH`; check if you like with `which pry`. Got it? Good. Moving on...

```
# first tmux session or terminal pane or w/e
$ ruby server.rb
# keep that visible then side-by-side... 
$ pry
1] pry(main)> edit client.rb
# vim will now open with the source code of client.rb
# edit if you like and :wq to save it; when saved,
# you'll be dropped back into pry with the changes
# AUTOMATICALLY RELOADED! How cool is that, right?! :D
# It'll still work even if you didn't make any changes
# and just immediately exited vim.
[2] pry(main)> hi("all up in ur internetz, udp'in ur portz in ur socksitz")
=> "Received the following message from you:\n  all up in ur internetz, udp'in ur portz in ur socksitz\n"
[3] pry(main)>
```

At the (basically) same exact time, in that other window/pane, you should see outuput from the UDP server, too!

```
$ ruby udp/server.rb
all up in ur internetz, udp'in ur portz in ur socksitz

```

Ghetto-as-frak? Yep. Totally inelegant? Affirmative. No tests? LOLWUT?

A simple, explained, (hopefully) humorous and entertaining if not at least (mostly) thorough readme: *priceless*.

(...for everything else, there's beer.)

