# Terminology of Testings
If you haven't noticed this yet, there are several types of tests. Unit,
integration, and acceptance tests, for example, might all be automated,
but are very different in design and purpose. If you've done the [Rails
Tutorial](http://www.railstutorial.org) for instance, you'll have tested
core application logic (unit tests) and end-to-end logic (integration
tests).

## Examples of Unit and Acceptance Testing
![Tesla Assembly
Line](http://www.technologyreview.com/sites/default/files/styles/body_embed/public/legacy/tesla.deathwatchx616.jpg?itok=sN1K4X86)

Let's put on our billionaire hats for a moment, and imagine that we are
all Elon Musk at our humble car company, Tesla. These cars are
automagically built by robots, which if I were Mr. Musk, I would ensure
would be tested like mad. You'd want to know that your manufacturing
process is bullet-proof. Let's use the paradigm of car making to get
examples of what types of tests are out there.

To get started, let's think about the types of tests we want to have.
Our inner novice might think that the most important tests are the final
tests. You'll want to make sure that the car drives as you expect;
however, you might have realized that that is essentially testing that
every system, from brakes to steering, works. It might be incredibly
difficult to understand what is broken. This is how I started testing
software, and why a lot of people get burnt out on it quickly. Their
tests come too late, and are extremely brittle. The better approach is
to test each system first in isolation, then in integration with it's
partner systems, and finally as a whole.

### Unit Tests - Testing One Station, and Only One Station
This is the bread and butter of testing, and most of your time and
effort should be dedicated to this camp. If your brakes don't work in
isolation, it would take divine intervention to see them working in the
completed product. When people talk about testing, they are generally
talking about unit testing, because that is where most time is spent.
Some software shops, will only do automated unit testing and leave humans to do
the rest of the testing.

### Integration Testing - Moving from Station to Station
Back to the cars example, we'll want to test that systems in the car
work together as we might expect. The gas pedal and the gear box for
instance, have some pretty heavy dependencies. Integration testing is
the art of testing that these dependencies are correctly handled. 

### Acceptance Testing - Test Driving the Completed Product
This is test drive at the end of the production cycle. This is really
the last line of defense, and if unit and integration tests are working
correctly, should see little if any defect. This is the stage where you
open the browser and make sure your stuff works. You have to imagine
that cars on the test track are rarely turned back to the factory. In
fact, if several cars did come back, you'd know you have a problem in
your process and you'd go back to the drawing board and find ways to
catch these errors better in the future, which usually means more unit
tests.

