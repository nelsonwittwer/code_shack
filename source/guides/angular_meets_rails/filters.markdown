---
title: Angular Meets Rails - Filters
---
# Angular Meets Rails: Filters
Filters allow you to format the data you display for humans. Since the
filters are called on the view layer, they are not meant to perform
business logic, but make it easier for humans to understand the data.

## Built In Filters
Angular gives us a lot of built in filters for free.99, let's take a
look at the currency filter to get an idea of how filters are used:

```
{{ 3.99 | currency }}
```

```
$3.99
```

Pretty cool, eh? As you you might have gathered, the syntax for filters
asks for the data first (in this case we just have a single number) then
a pipe, then the name of the filter you'd like to use.

Filters can also accept parameters, which would be the third argument.
You can include as many parameters as you'd like, you'll just need to
seperate them with colons like so:

```
{{ 3.99 | currency | number:0 }}
```

```
$3
```

## Build Your Own Filter
You can also build your own filters. Let's try this out by converting
nasty tweenager talk into readable prose. After we do the typical
Angular setup, we'll want to create a filter on our mainModule, which we
have named 'quietFilter.' We'll loop through each word and change it
from all caps to lower case, and then return to result. Pretty straight
forward stuff. Now, when we take the text from our controller and run it
through our quietFilter, you'll notice that you no longer want to punch
something in the jugular. 

### index.html
```html
<html>
  <body ng-app='MainModule' ng-controller="MainController">
    <h1>{{ tweenagerTalk | quietFilter }}</h1>
  </body>

  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.4/angular.min.js"></script>
  <script src="main.js"></script>
</html>
```

### main.js
```js
var mainModule = angular.module('MainModule', []);

mainModule.filter('quietFilter', function() {
  var quietFilter = function(input) {
    var words = input.split(' ');
    for (var i = 0; i < words.length; i++) {
      words[i] = words[i].toLowerCase()
    }
    return words.join(' ');
  };
  return quietFilter;
});

function MainController($scope) {
  $scope.tweenagerTalk = 'I AM A LOUD TWEENAGER';
}
```

### Output of Index.html
```
i am a loud tweenager
```

## Code is on GitHub
[Quiet Filter Repo](https://github.com/CodeShackBaby/angular_filters)
