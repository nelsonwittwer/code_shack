---
title: Big Data in Rails to the Resque
---
# Big Data in Rails to the Resque
Big Data is Elmo's buzz word of the year this year, so it's only fitting
that I do a blog post on how to use Rails to harness a whole lot of big,
'Merican sized data. A project I'm working on is going to have a ton of
traffic spikes, just the MVP can have up to 1,200 concurrent requests to
write to the database. In order to ease the constraint to the databse,
I'll taking a slightly different approach, in that I'll be writing to a
queue instead of a database. Like most things in ruby/rails land, there
is are a few awesome open source resources out there to make this
easier. In this case, I'll be using [Sidekiq](http://sidekiq.org/),
which is a gem that allows you to use multi-threaded processes to
process jobs on a queue.


