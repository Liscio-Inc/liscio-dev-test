# Liscio Developer Test

## Introduction
Goal of test isn't to "gotcha" you and your rails knowledge.

It's to give a microcosm of our general app and an idea of the space we work in, while also providing you and us an 
opportunity to see what it's like to work together. Technical screens are hard to get right. There is a great deal of 
bias in them that generally hedges on the wrong things. We'd rather provide the candidate an opportunity to see if they 
like us and vice versa.

Bare with us, this will always be an evolving process! Long term goal is one test, but we're in the middle of the transition:)

## Problem Statement
Some pre-knowledge!

* We're going to be looking at Messages. They are at the core of our product. While this does *not* match our 
actual implementation, it is meant to be a much simpler version of it (something you might see as a first draft).
* This app has most of this implemented already! Worth checking out 
and exploring in advance, although it should not be entirely necessary. 
 [Public View Only Miro Board](https://miro.com/app/board/uXjVK9cbZxE=/?share_link_id=598759584903)

![](app/assets/images/LiscioFullStackDevTest.jpg)

The exercise is two parts. Let's add some (hopefully) simple functionality, test it, and then have a conversation to 
what it would take to extend messages long term.

It is also important to give space to ask questions around the culture and identity of Liscio

Format:
* 20 Minutes pairing
* 20 Minutes discussion
* 10 minutes of questions (these can also be peppered in your test, by all means use the time to get to know us!)

## Setup
Theoretically `bin/setup` will get you most of the way there assuming you're using a machine currently configured with Rails/Ruby. However, to get completely setup you might need a few things:

1. Install [homebrew](https://brew.sh/) by running this command, this also installs xcode command line tools:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
** Note the instructions to add the brew shell env to your profile, this is very useful, don’t skip that.

2. Use Homebrew to install your Ruby Version manager (if you don't already have one)


[asdf](https://asdf-vm.com/guide/getting-started.html):
```
brew install asdf
```

[Ensure the plugin for asdf](https://github.com/asdf-vm/asdf-ruby) is installed
```
asdf plugin add ruby
```

Then install Ruby 3.1.6
```
asdf install ruby 3.1.6
asdf global ruby 3.1.6
```
3. Get ready to install postgres
```
brew install \
  libyaml \
  openssl@3 \
  gmp
```


4. Use Brew to install Postgres
   You’ve got some options with Postgres. If you want an all inclusive package, do the following:

```
brew install --cask postgres-unofficial
sudo mkdir -p /etc/paths.d && \
   echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp

brew install libpq postgresql@15
brew services start postgresql@15

# add libpq to your path for ZSH - sometimes it is required in a different bash profile
echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> ~/.zshrc

# make sure Postgres is running
pg_isready
```

5. If you haven't already, clone this repo into a folder of your choice
6. Run the setup from the repo directory
```
bin/setup
```

7. Run rails (Hopefully!)
```
rails s
```


----
If you get stuck with *any* of the above, feel free to reach out! It's a side note but if there are issues (sometimes 
there are!) bring them to the interview. A worthwhile exercise might just be troubleshooting your issues since this is supposed to mimic a dev experience :)

## Interacting with the App

Feel free to play around! But the thing we mostly want to see working as a good test is creating a message with 
recipients

Use whatever IDE/etc you're most comfortable with, but here's a sample cURL command for viewing all messages:
```
curl -v \
  -H "Accept: application/json" \
  -H "Content-type: application/json" \
  http://localhost:3000/messages
```

Sample Command for creating a message:
```
curl -v \
  -H "Accept: application/json" \
  -H "Content-type: application/json" \
  -X POST \
  -d '{ "text":"this!","sender_id":"2", "message_recipients": "[3,4,5]"}' \
  http://localhost:3000/messages

```

## Resources

Ruby Version Manager
* [We currently use asdf](https://asdf-vm.com/) but feel free to use whatever you're comfortable with. Even if that's good ol' `ruby`

Serializers:
* [Documentation](https://guides.rubyonrails.org/v4.2/active_model_basics.html)
* [Gem used](https://github.com/rails-api/active_model_serializers)

Annotation:
[Annotate Gem](https://github.com/ctran/annotate_models)

Various Rails/Dev Resources
* [rspec cheat sheet](https://www.rubypigeon.com/posts/rspec-expectations-cheat-sheet/)

* Undoing some of the installing you have done:
  * [Uninstall homebrew packages](https://mac.install.guide/homebrew/7)


### Misc Notes:
* Ruby version
    * 3.1.6
* Postgres Version
  * 1.5.6
