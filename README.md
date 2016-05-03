# TRANSMISSION CLEAN

Script to automatically delete completed torrents that have finished seeding.
I run this script periodically (with a cron task) in my Raspberry Pi, so that it deletes torrents added by other applications (CouchPotato, SickRage...) to the transmission-daemon, but it could be used with any Transmission program with remote access enabled.

## SETUP

1. Install Ruby
2. Install Bundler
3. Install ruby dependencies: `bundle install`
4. Install transmission-daemon or a transmission program and enable RPC
4. Write your own configuration. `cp config/config.example.yml config/config.yml`

## USAGE
```
$> bundle exec ./clean.rb 
```

Ideally you want to have it running periodically in a 24/7 machine (like a server or a Raspberry Pi). Running `whenever -w` will create a cron task to execute the script every hour (to modify this behaviour see [whenever gem](https://github.com/javan/whenever)).