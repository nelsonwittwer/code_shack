---
title: SOA Introduction
---

# Service Oriented Architecture

There comes a time in an application's maturing life, when you have a to
have a serious discussion about weight loss. You'll know when that time
comes when it takes you longer to run your test suite than it takes for
you to read 8 sub-reddits and flame someone on Hacker News. Perhaps
you take a look at the 86 controllers your app is sporting and realize
maybe that is why it is so hard to introduce new change sets. If this
has ever happened to you, it might be a good time to start thinking
about a service oriented architecture (SOA). 

One major point of clarifcation before we move on though: you should
only adapt SOA if you are feeling the pain of a monolithic app,
not when you are rolling a new app. This is an expensive process. You do
this step only AFTER you have an app that has gained traction and some
weight.

## SOA Rails Stack

I've had an incredible opportuity the past year to work with an
enterprise Rails SOA stack at (MoneyDesktop)[moneydesktop.com] and wanted 
to share some lessons we've learned as we have scaled to support over
400 banks with it. Our core architure has been open sourced by
our architects, and I'll be using those gems here to show you how we do
what we do.

Our stack has 3 main elements:

Rails
Google Protocol Buffers
Active Remote

## Google Protocol Buffers
Google Protocol Buffers, or Protobuf, is used as our serialization layer
of our achitecture. It allows us to understand the structure of the 
models and services within our internal APIs. We

## Active Remote

