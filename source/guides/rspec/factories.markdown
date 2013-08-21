---
title: factories
---

# Factories 'n Such
When I first started testing, I had no idea why I should use factories.
In fact, I thought they were just another hurdle to start testing, so I
said 'screw it,' and started tested without them. I didn't make it long before I
realized that my tests were 2-3x the size of my classes. Learn from my
experience. Friends don't let friends test without factories.

## Factories, Done Right
The promise of using factories, like
[FactoryGirl](https://github.com/thoughtbot/factory_girl), is the
ability to be able to setup your tests with minimal effort, and to be
able test your app's database integration if desired. 

When I first started testing, I used Factories because the [Rails
Tutorial](http://ruby.railstutorial.org/) told me it was a good idea,
but I wasn't doing it correctly at all. Let's take a look at my early
sins by examining my [first app I
wrote.](https://github.com/nelsonwittwer/disrupt) To give quick
background on the app, the idea was to build a social network for people
to discuss startups. 

### Sloppy Comment Spec Setup
```ruby
require 'spec_helper'

describe Comment do

  before do
    User.delete_all
    @startup=FactoryGirl.create(:startup)
    @user=FactoryGirl.create(:user)
    @topic = Topic.new(name: "Topic")
    @discussion = @startup.discussions.new(user_id: @user.id, topic_id: @topic.id)
    @comment=@discussion.comments.new(text: "this is a comment", user_id: @user.id)
  end
  
  ...
end
```
Alright class, who can tell me where I dropped the ball with this spec's
setup?  You don't even
have to look at my factory file to see how bad it is going to be.
Besides the horrific styling implored here, here is a list of things I
see I screwed up on:

1. User.delete_all? WTF???
2. Blatant lack of associations. Fail.
3. Inconsistent setup. I guess Factories are only needed for startups
   and users...

So ya, I dropped the ball in at least three places. Awesome town. At
least I can say it was my first app, right?
Let's add to my public shame by looking at the factories:

#### Gold Diggin' FactoryGirl (Bad Example)
```ruby
FactoryGirl.define do
  factory :startup do |s|
    s.sequence(:name)     { |n| "Starupt #{n}"}
    s.sequence(:url)    {|i| "startup#{i}.com"}
    s.description "startup from heaven"
    s.twitter "@startupzz"
    s.crunchbase "crunchbase.com/companies/startupzz"
  end

  factory :user do
    sequence(:name) { |n| "User#{n}" }
    sequence(:email) { |n| "User#{n}@example.com" }
    password    "foobar"
    password_confirmation "foobar"
    role_id 3
  end

  factory :discussion do
  end

  factory :comment do
  end
end
```
This Factory will do nothing but take my money when I'm in need.
Let's clean this baby up.

#### Clean Up 
First, does anyone see why I had to nuke all the users before each test,
but not any other table? Anyone? Anyone? Bueller? I would take a guess
and say that my user factory is missing a key piece in it's block, an
iterator. Sequences are pretty cool in that they allow you to test your
database constraints, in this case I had a uniqueness constraint setup
on the User's name and email fields. So I could create several users
with this factory with the same call and it would make sure these fields
were unique, but only if I had done it correctly. Let's fix that up real
quick:

```ruby
factory :user do |u|
  u.sequence(:name) { |n| "User#{n}" }
  u.sequence(:email) { |n| "User#{n}@example.com" }
  u.password    "foobar"
  u.password_confirmation "foobar"
  u.role_id 3
end
```

Next, let's take a look at associations. The cool thing about using
associations with FactoryGirl, is that you can leverage your previous
factories and their sequences. Let's build out our discussion and
comment factories:

```ruby
  factory :discussion do |d|
    d.sequence(:title) { |n| "Title #{n}" }
    d.user
    d.startup
  end

  factory :comment do
    user
    discussion
  end
```
Taking a look at [FactoryGirl's
documentation](https://github.com/thoughtbot/factory_girl/wiki/Usage),
you'll see that putting an active_recrod association in factories is as
simple as I've illustrated above, just name the factory in the factory
block. Easy peasy, lemon squeezy.

Lastly, now that we have properly setup our factories, let's revisit how
my tests were setup:

```ruby
require 'spec_helper'

describe Comment do
  let(:user) { FactoryGirl.build(:user) }
  let(:startup) { FactoryGirl.build(:startup) }
  let(:discussion) { FactoryGirl.build(:discussion) }
  let(:comment) { FactoryGirl.build(:comment) }
end
```

Well, I think that goes a long way. Now I am actually testing correct
uniqueness constraints on my user table, and I have my active_record
relationships baked into my factories. Finally, I don't have to manually
provide my variables with attributes, as that is handled by my
factories. I think we've done good work here today. Let's all use
factories a little smarter moving forward.
