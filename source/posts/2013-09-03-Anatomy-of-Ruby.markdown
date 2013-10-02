---
title: Anatomy of Ruby
---
# The Anatomy of Ruby
The time has come for us to have the birds and the bees discussion about
Ruby. Why, you might ask? Well, all the other kids on the playground know
about this stuff, so it's high time you learned how the core elements in
Ruby really work together.

## Objects, Instance Variables, and Classes
Let's start off by looking at objects. Where do you suppose an object's
instance variables and methods live? Let's take a look at an example and
see what we can figure out.

```ruby
class McHammer
  def initialize
    @message = "Hammer Time."
  end

  def stop
    p @message
  end
end

m = McHammer.new => #<McHammer:0x007fe44b822058 @message="Hammer Time.">

```

So when we create a new object from our McHammer class, you'll see that
irb gives us a nice pretty reperesentation of this object. We see that
it is an McHammer object with an instance variable of @message, that
reads "Hammer Time." This gives us our first clue on the anatomy of ruby
objects. They contain a) a reference to their ruby class and b) their
instance variables. Cool. But riddle me this, where do you suppose
methods for this object live? How come they didn't show up in irb's
response when we created the object? Let me answer that question with
another question, do all instances of 'McHammer' have the samve methods?
Of course they do, so it would make sense that their methods wouldn't
live on the object, but on the class itself. 



