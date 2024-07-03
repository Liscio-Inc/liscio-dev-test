# Liscio Developer Test

## Introduction
Goal of test isn't to "gotcha" you and your rails knowledge.

It's to give a microcosm of our general app and an idea of the space we work in, while also providing you and us an opportunity to see what it's like to work together. Technical screens are hard to get right. There is a great deal of bias in them that generally hedges on the wrong things. We'd rather provide the candidate an opportunity to see if they like us and vice versa.

Bare with us, this will always be an evolving process! Long term goal is one test, but we're in the middle of the transition:)

## Problem Statement
The test is two parts. Let's add a controller action, test it, and then discuss what it would take to extend the functionality.

And also give space to ask questions around the culture and identity of Liscio

## Setup
Theoretically `bin/setup` will get you most of the way there assuming you're using a machine currently configured with Rails/Ruby. However, to get completely setup you might need a few things:

1. Install [homebrew](https://brew.sh/) by running this command, this also installs xcode command line tools:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
** Note the instructions to add the brew shell env to your profile, this is very useful, don’t skip that.

## Interacting with the App

Feel free to play around! But the thing we mostly want to see working as a good test is creating a message with recipients

Use whatever tool is most comfortable, but here's a sample cURL command
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

* Ruby version
    * 3.1.6
* Postgres Version
  * 1.5.6
