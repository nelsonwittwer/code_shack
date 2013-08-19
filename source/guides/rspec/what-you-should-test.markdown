---
title: What You Should Test
---
# What You Should Test

This question sparks holy wars. I'll tread lightly here. This section
largely comes from [this stellar rails conf talk on the
matter](http://www.confreaks.com/videos/2452-railsconf2013-the-magic-tricks-of-testing)
so when someone questions this opinion, make sure you lean on Sandi's
testing expertise, not mine. She has much more nerd cred than I.

## What Makes a Solid Unit Test?
You'll want to think of unit tests as stages of the assembly line. You
want to test that the materials going into a black box are properly
converted to what they need to become. In the above mentioned talk,
Sandi drew out this diagram to explain what needs to be tested where:

Message | Query | Command
--- | --- | ---
incoming | **Assert Result** | **Assert direct public side effects**
sent to self | ignore | ignore
outgoing | ignore | **Expect to send**

## Query vs Command

## Incoming Messages
Incoming messages are like the raw materials going into the magic box.
Let's take a look at them.

## Sent to Self
There general rule of thumb is you do not test messages sent to self. In
other words, you don't test private methods. You may have heard the
phrase test functionality, not implementation. Not testing private
methods essentially means you have the freedom to change how you
implemented the black box to turn inputs into outputs. You should be
able to find better ways to making that transformation in the future,
and you should be able to do so without breaking tests. 

## Outgoing

