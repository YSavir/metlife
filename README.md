## Installation

1. `git clone` the repository.
2. `cd` into the directory
3. Run `bundle install`


### Server

Run `bundle exec rails s`. A server will be available on `localhost:3000`.

### Tests

Run `bundle exec rspec`.

## Biggest Issue Encountered

If I had a nickle for each time I started working on a personal blog from scratch, I would probably be ready to retire. There weren't many new or big problems encountered while completing this work as it's all very familiar ground that I've been through multiple times. On a smaller scale, there were the myriad of micro-problems of setting up and configuring the test suite and dev tools, but nothing requiring more effort or problem solving other than checking the appropriate documentations.

For what it's worth, in terms of operations, I did have to contend with a surprise visit from my parents and balance progressing on the code while also being a son. Easier said than done.

## What I Learned

* `ApplicationRecord#attributes` does not return a `HashWithIndifferentAccess`, as might be expected of a Rails hash-like return value. More interesting was how I managed to go through all these years of using `#attributes` without ever trying to access the results using a symbol.
* I finally managed to remember to *not* name a model `Post`, as I've done countless times in the past, and so avoided the potential conflict and confusion with all existing uses of the word `post`. Naming the model `Entry` was not a great substitute, as it often felt awkward in use. `JournalEntry` would have been a much better name.
* Despite having made blog-like applications dozens of times, I still found opportunities to try small things I haven't done before, or opportunities to improve on things I've done in the past. I'm always amazed to learn how much we can improve on even simple, well-trodden proccesses.
* Using the pattern I did for shared controller specs worked very well. I've done similar things in the past, but set a goal to go with a cleaner and more explicit style this time around, and I am very happy with the results.

## What I Would Have Done Differently

* Named the `Entry` class `JournalEntry`.
* Not much else. This exercise became an opportunity to answer all previous times I've wished I did things differently, and in that respect, I am fairly happy with the results. I do wish I made somewhat more progress, though, so perhaps one possible improvement would be better juggling of coding assignments with impromptu family visits.
