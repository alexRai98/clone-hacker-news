# HN Clone

Use the stories inside `stories.json` to create a replica of the [HN landing page](https://news.ycombinator.com/).

Each story has:
- descendants: this is the comments count
- by: this is the username of the creator
- score: this are the "points" of the post
- title: title
- url: url to an external page, most of the times an article. Note
how HN only shows the hostname in the landing page.
- time: timestamp when the post was created. You can convert it to a `Time` object
with `Time.at(timestamp)`.

[Design support](https://www.figma.com/file/L5ZqplWe3Tb2cd8wEZ90Jc/HN?node-id=0%3A1)

To display the time since a post was posted like "6 minutes" you can use the following
helper included in `app.rb`. A helper is a method that you can use in any route or template, just 
like `erb`. They can be defined by passing a block to `helpers`.

## Extra

### Add more routes

Add routes for:
- "/newest": linked to it by the `new` navigation item. [Actual page](https://news.ycombinator.com/newest)
- "/ask": linked to it by the `ask` navigation item. [Actual page](https://news.ycombinator.com/ask)
- "/show": linked to it by the `show` navigation item. [Actual page](https://news.ycombinator.com/show)
- "/jobs": linked to it by the `jobs` navigation item. [Actual page](https://news.ycombinator.com/jobs)

The `/newest` route should show the stories inside `newstories.json`.
The `/ask` route should show the stories inside `askstories.json`.
The `/show` route should show the stories inside `showstories.json`.
The `/jobs` route should show the stories inside `jobstories.json`.

As you probably noticed, the thing that changes between routes are just the stories
that are displayed.

The "hackernews" text and logo should send to the landing page in the "/" route.

### Show active route

When a specific route is active (ask, show, jobs, new), the link of the
navbar that corresponds to it has a white active state.

If you got to [new](https://news.ycombinator.com/newest), the `new` link
is highlighted white.

Use the HN API to add the pages:
- [newest](https://news.ycombinator.com/newest)
- [ask](https://news.ycombinator.com/ask)
- [show](https://news.ycombinator.com/show)
- [jobs](https://news.ycombinator.com/jobs)