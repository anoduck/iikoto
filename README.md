iikoto (Refreshed instance)
------

## iikoto

This is one of the various forks of iikoto from muso/iikoto. Counting from the original going upstream, this should be number five.
This fork hopes to keep the various improvements and additions to iikoto that occurred during the previous forks, 
while removing the personalization and alterations that were performed unneedlessly to this repository for a sole instance of it as wirechan.


## Setup (incomplete at the moment)

1. Create database file and import the incomplete sql template

	sqlite2 imageboard.db < models/schemas/sqlite.sql

This will create the database file and extract the sql framework into
the file. 

2. run ruby bundle install

	/usr/local/bin/ruby24 bundle install

3. Then run iikoto 

	/usr/local/bin/ruby24 ikoto.rb
	
4. Using the port provided from running the command, access iikoto.

5. Once you have accessed iikoto, you will be immediately directed to
   access the administration panel at `/adm`. do so. 
   
6. Then will ask your for the username and password of the default
   user. The username is assummed to be 'admin'. The password is
   __unknown__ . 
   
7. Currently, this where development stands.

An entry in the database under the table labeled 'users' needs to be
added in the following format.
	
	users(username,password,salt)

Which states in the table users, in the first column add username,
etc...

It is still unclear if the framework works at all. 

Finally, the developer of this repo knows absolutely nothing of ruby
at all. All modifications and alterations were more than likely
performed under the influence too much caffeine. 

---

**This is not the Wirechan version of iikoto**

--If you want to create your own imageboard, you'd be better using the upstream version.

Please contribute code modifications there too if possible as it saves time!

Thank you.--

---

iikoto is an imageboard written in ruby with sinatra!
it's meant to be a replacement for vichan/kusaba/oh gosh those horrible legacy scripts

it tries to be good at security [citation needed]

the style is based on steinuil's negoto and stein has worked with me to
make the interface look acceptable. thanks stein.

the requirements are:
- gem 'sinatra'
- gem 'sqlite3' # For ActiveRecord's sqlite support (I think)
- gem 'activerecord'
- gem 'sinatra-flash'
- gem 'slim'
- gem 'sass'
- gem 'mini_magick'
- gem 'rack_csrf'
- gem 'mimemagic'

screenshot
----------
could be out of date, but here's how it looks
![screenshot](/screenshot.png)
