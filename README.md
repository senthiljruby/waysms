# Waysms

Waysms is a ruby gem that help you to send text messages to India Mobiles through India's Top Messaging Service (way2sms)

This is my first gem :) :)
Thanks @gg, @prince who guided me and being first person to make my step on right path till now...

## Installation

    $ gem install waysms

## Usage
    require 'waysms'
    texter = WaySms::SmsSender.new("username","password")
    texter.send("9944425528", "Cool Buddy...")

## Rails integration
    1) gemfile
        gem 'waysms'
        gem 'mechanize'
    2) Inside rails,
        require 'waysms'
        sms_me = WaySms::SmsSender.new("username","password")
        sms_me.send("9944425528", "Cool Buddy...")