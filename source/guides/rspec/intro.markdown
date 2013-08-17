---
title: Test Dummy Intro
---

# Test Dummy Intro

If you haven't felt some sort of religious guilt for not learning to
test your code yet, you either haven't spent enough time in the ruby
community to know the error of your ways, or your soul is beyond saving.

Tests are important. I know what's it like to be a new developer and say
something along the lines of, "I just want to get my code working, tests
make that process slower." That was me not too long ago. It's time to
buckle down, put on our big kid pants, and learn how to correctly and
effectively test our code. As we'll soon find out, testing first
actually helps you code faster as you'll find your code actually works
and you'll spend less time debugging.

### Testing? What's the Point, Bro?
If you are one of those who doesn't quite know why you test, let me give
you a quick primer. There are many different opinions out there as to why you should test.
[Gary Hernhardt](https://twitter.com/garybernhardt) has one of my
favorite explanations. According to his almighty experience, there are
three main purposes for testing:

1. prevent regression
2. prevent fear
3. prevent bad design

### Preventing Regression
Regression, just like it sounds, means your code is going backward not
forward. The magic thing of having tests for all of your code, is you'll
know if changing something broke something that you already busted your
butt to write. 

### Prevent Fear
This point goes hand in hand with the previous, you can add/modify code
with confidence knowing you'll have a pretty good indicator that your
code still works. I've met many people in the development world who are
all kinds of nervous to write and release code, mainly because they had
no automated way of knowing if their changes broke all the things.

Specs are really handy dandy when you are refactoring lots
of code. You can make your refactor generally know if your code still
works by having passing tests.

### Prevent Bad Design
If you are writing specs correctly, you are almost forced to make good
design decisions. You'll find your code is much more modular and well
structured. Future you and future developers who inherit your code will
praise your name for testing. 

Pretty cool, eh? Check out [Gary's full presentation](http://www.youtube.com/watch?v=RAxiiRPHS9k) if you need further brain washing.
