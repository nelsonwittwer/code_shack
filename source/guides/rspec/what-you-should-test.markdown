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
Sandi talks about how there are two types of messages that code will
make, and depending on the type of code, your testing behavior will
change. Query means it is looking something up, and does not modify
anything. Command methods will modify attributes or variables.

#### Query Method

```ruby
class Waiter
  attr_accessors :ratings
  
  ...

  def average_rating
    sum_of_ratings = ratings.inject { |sum, rating| sum + rating }
    sum_of_ratings / ratings.count
  end

end
```

This message does not make any modifications to the user object, it just
calculates the average rating a given waiter has received. 

#### Command Method

```ruby
class Waiter
  attr_accessor :hourly_rate
  ...
  
  def set_hourly_rate(new_rate)
    @hourly_rate = new_rate
  end
end
```
This method obviously will modify the current waiter's role, making this
message a command rather than a query.

Now that we understand the differences between query and command
messages, let's dive in and figure out how we should test each type in
these scenarios Sandi has laid out:

## Incoming Messages
An incoming message is essentially any method that gets 
called on your object. We wont worry about how they are called, 
because we'll see later that those are examples of outgoing messages.

Looking at Sandi's matrix, you'll notice that incoming messages are the
only place where you will actually assert values. 
#### Query Messages
What really matters when testing a query message, is that the
result is what you are expecting. In the above mentioned scenario, we
want to make sure that the ```average_rating``` method returns the
waiter's average rating:

```ruby
describe Waiter do
  context '#average_rating' do
    let(:user) { User.new(:ratings => [3, 4, 5] }
    it "should calculate waiter's average rating" do
      user.average_rating.should eq(4)
    end
  end
end
```

#### Command Messages
Looking at our above mentioned example for a command message, we'll be
testing the method ```set_hourly_rate```. 

```ruby
describe Waiter do
  context '#set_hourly_rate' do
    let(:user) { User.new }
    it "should set the hourly rate base on the input" do
      user.set_hourly_rate(15.75)
      user.hourly_rate.should eq(15.75)
    end
  end
end
```
The rule here is to test direct public side effects. It's this class'
responsibility to assert the value here. As you see, it is pretty
straight forward.

## Sent to Self
There general rule of thumb is you do not test messages sent to self. In
other words, you don't test private methods. You may have heard the
phrase test the interface, not the implementation. Not testing private
methods essentially means you have the freedom to change how you
implemented the black box to turn inputs into outputs. You should be
able to find better ways to making that transformation in the future,
and you should be able to do so without breaking tests. 

## Outgoing

