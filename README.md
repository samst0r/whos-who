Whos Who - The App Business
===========================

Description
-----------

- The first section of the App was developed using TDD. This happened less towards the end due to time constraints.
- Images are resized before being displayed to save memory.
- Images are cached using NSURLSession caching.
- Website is parsed using hpple and xPath.

Installation
------------

- Run a pod install to download dependencies.
- Build + Run the workspace.

Compatiable Devices
-------------------

- iPhone (all sizes)
- iPad (all sizes) - I'd prefer to have a custom interface for here but this works.


Future Improvements
-------------------

- Unit test remainder of code.
- Animate the loading of each cells image.
- Customise landscape orientation to make use of the space.
- Limit network requests by checking if the employee image URL has changed when refreshing.


3rd Party Libraries
-------------------

1. hpple - xPath library for parsing web page.
2. Kiwi - BDD library for nicer semantics when unit testing.


