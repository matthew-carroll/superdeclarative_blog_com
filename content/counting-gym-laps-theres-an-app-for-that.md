---
title: Gym Vibes
date: September 7, 2026
excerpt: I got tired of counting laps at the gym, so I vibed an app!
draft: true
---

Every day I walk two miles on the track at my gym. The track is a tenth of a mile long. That's 20 laps, and I can't count that high.

So I built an app to count for me. The catch: I never want to open it, look at it, or even unlock the screen. This is the story of how I got there, and why pushing back on the LLM, hard, was the whole job.

## Software Engineer Hat vs. Product Engineer Hat
As a Software Engineer, my incentive is to build a beautiful UI with lots of features. Show off.

As a Product Engineer, my incentive is the opposite: solve the user's problem as fast as possible. Where I can, don't make the user open the app at all. The user doesn't care about a pretty UI or a pile of features. They care about getting back to their life.

As the only user of this app, I leaned all the way into the Product Engineer.

## Don't Open the App. Don't Even Unlock the Screen.
I don't want to open the app every time I finish a lap. I don't even want to look at the screen. So what are my options?

**Location tracking** was my first thought: detect the laps automatically. But GPS at that granularity is nearly impossible to get right. Not worth the frustration.

**An Apple Watch app** was the second. Not a bad idea, but I don't wear my watch to the gym. Maybe later.

Then I noticed something: I already carry my phone in my hand the whole walk. It's too big and heavy to shove in a sweatpants pocket with my keys, so I just hold it.

That's when it clicked. The **Action Button**.

Modern iPhones have a dedicated hardware button that users can configure, and that apps can hook into. Since I'm already holding the phone, pressing the Action Button every time I pass the track entrance is effortless. I can start, count, and finish my walk without ever looking at the screen, let alone unlocking it. That was the answer.

## The Generated UI Is Good Enough
I'm always tempted to obsess over an app's UI. But for a personal app, especially one designed to keep me *out* of it, does it matter?

Modern LLMs have seen enough fitness apps to generate a reasonable, not-awful UI on the first try. I told the LLM to keep it minimal. That was enough. I was happy with what came back.

INSERT SCREENSHOT

If I were shipping this to the App Store, I'd overhaul the design. For me at the gym, the UI isn't worth another minute.

## Push for the Ideal, Hunt for the Edge Cases
Here's what surprised me: the thing that makes me a bad guy on a human dev team is exactly what makes me effective with an AI.

In my professional life, I ask a lot of questions in code reviews. I raise every edge case I can think of. I ask whether it's been considered, what happens when it breaks, whether there's a test for it, and why this approach won over the alternatives. These questions expose holes in the solution, and blind spots in the original request. But when developers are judged by throughput, and bonuses ride on closed-ticket counts, that kind of questioning makes me the bad guy.

Not with an LLM.

LLMs don't care about promotions or bonuses. They're not itching to move on to the next shiny feature. And they generate code so fast that rework is nearly free. But like a lot of human developers, an LLM left alone will solve the happy path and ignore the many ways it breaks. It'll often ship an anemic version of the happy path at that. So questioning, probing, and pushing back costs nothing, carries no judgment, and is absolutely necessary.

### Getting the Action Button Right
The entire point of the app is to count laps *without* opening it. The LLM didn't see it that way.

The first version made me open the app and tap the counter. Sensible for a generic app; completely wrong for mine. I told the LLM the Action Button had to increment the count with the screen off. It went and implemented it.

On the next review, I pressed the Action Button with the app open. It worked. Then I turned off the screen and pressed it again. Nothing.

I reminded the LLM: the button has to work with the screen off. This time it reached for an iOS Shortcut so the button would fire even when the phone is locked.

But the first Shortcut approach required *me* to configure it by hand: a long list of steps in the Shortcuts app, in exactly the right order. It worked, and some engineers might have called it done. Product hat on, I told the LLM this was ridiculous. You can't ask a user to jump through that just to set up a button.

After more pushback, the LLM finally admitted we could define a custom shortcut *inside* the app instead of making the user build one. Now configuring the Action Button takes a couple of ordinary taps. That was the killer feature.

At every turn, the LLM took the most expedient route, just like a lot of developers. But development effort was never the constraint. User value is the North Star, and with an LLM, more effort costs almost nothing. So I spent it.

## Solving My Own Problem Surfaced More Problems
Entrepreneurs are told to "solve your own problem." Solving mine surfaced a few smaller ones worth solving too.

### The Walk Timer
After a few days, I realized I wanted to record my time each day, something verifiable to push my speed against. The LLM had already built a timer without me asking. I just had it save the history and give it its own screen. Now I can work on getting faster.

### Lock Screen Notifications
Not unlocking my phone was great, until I caught myself wondering: am I on lap 5 or lap 15? So I had the LLM add a live notification to the lock screen during a walk. Now I get the hands-off Action Button *and* a glanceable status. Best of both.

## Verify the Feature, Not the Code
On professional teams, we hunt bugs by reading code changes. It's tedious, frustrating, and surprisingly ineffective, but there aren't many better options.

Vibe coding an app for myself, I can skip the diff and just *use* the app. Whatever breaks, I note it and tell the LLM to fix it. Because I'm the only user, there are no irate customers dragging me across the internet over a bug. Ignoring the code feels like freedom.

### The Timer Bug
Normally I reset the tracker the moment I finish a walk. One day I forgot. It shouldn't matter, since it's just a state change, but the timer kept ticking until I hit reset. My 40-minute walk was logged as 1 hour 35. I came home, told the LLM to fix it, and it did.

### The Popup Bug
I verify changes at my desk before I get to the gym. But once I added history tracking, every test run was polluting my walk history. So I asked for the ability to delete entries, handy for tests, and for the days I start a walk by accident.

The LLM added deletion fast. It also added a little "entry deleted" popup, a nice touch, except it parked the popup at the bottom of the screen, right on top of the records and the reset button. I couldn't delete another entry or reset until it disappeared. A helpful notification became an instant irritation. It took a few rounds of pushing to move it up top, where it only covers the rarely used settings button.

## The Whole Job Was Saying "Not Good Enough"
The LLM wrote the code. My job was to keep insisting it wasn't done: work with the screen off, don't make the user configure a Shortcut, don't cover the reset button. Every one of those took pushback the LLM wouldn't have volunteered.

That's the shift. The bottleneck was never writing the code. It was refusing to accept the happy path. Wear the Product Engineer hat, keep asking the annoying questions, and you get an app so good you never have to look at it.


----
Every day I walk two miles on a track at the gym. The problem is, the track is only 1/10th of mile long.
That's 20 laps to count! I can't count that high, so I designed and built an app to do it for me.
This is that story.

## Software Engineer Hat vs Product Engineer Hat
As a Software Engineer, my incentive is to create a beautiful UI with lots of features. Show
off my skills.

As a Product Engineer, my incentives are different. Solve user problems quickly.
Where possible, don't make the user open the app at all. The user doesn't care about a pretty UI,
or a bundle of features. He cares about getting back to life.

As the only user of this new app, I leaned into the Product Engineer role.

## Don't Open the App. Don't Even Unlock the Screen.
Not only do I not want to open the app every time I complete a lap. I don't even want to look at
the screen. What can I do?

First thought is a location tracker that automatically detects the laps. But location tracking
at that granularity is often impossible to get right. Not worth the effort and frustration.

Second thought is an Apple Watch app. Not a bad idea, but as of this moment I'm not wearing
my Apple Watch to the gym. Maybe later.

Third thought is about the fact that I'm currently carrying my phone in my hand as I walk. I do
this because the phone is relatively large and heavy. I don't want to shove it in my sweatpants
pocket with my wallet or keys. So I carry it.

I decided to leverage a unique hardware capability of iPhones - the Action Button.

Modern iPhones have a dedicated hardware button called the Action Button. This button can be
configured by the user to do various things, and apps can publish behaviors that a user can
trigger with the action button.

Given that I hold my phone in my hand as I walk, anyway, it's trivial for me to press the
Action Button every time I pass the track entrance. By hooking into this button, I can start,
progress, and complete my walk without ever looking at the screen, let alone unlock it. This
is the answer for me.

## The Generated UI is Good Enough
I'm always tempted to focus on an app's UI design. But for a personal app, especially an app that's
designed to keep me out of it, do I really need to worry about it?

It turns out that modern LLMs have seen enough fitness apps to generate a reasonable, not awful
app UI.

I instructed the LLM to create a minimal UI. Those instructions proved to be sufficient. I was
happy enough with what was generated.

INSERT SCREENSHOT

If I were to ship this to the app stores, I would certainly overhaul the UI. But for me at the gym,
the UI isn't worth any further investment.

## Pushing for Ideal Features, Identifying Edge Cases
In the world of vibe coding, I've discovered that the approach that makes me a villain in
traditional app teams is actually a benefit when working with AI.

In my professional life, I ask a lot of questions in code reviews. I bring up every edge case I
can think of, asking the developer if he's considered it, and what the effect would be. I
recommend tests for each such edge case, where possible. I ask about alternative approaches that
were considered, and why this approach was chosen. Questions like this often expose holes in the
solution, and even blind spots in the original feature request. But in a world where developers
are judged by throughput, promotions and bonuses are based on closed ticket count, and developer
interest is based on novelty, asking these questions makes me the bad guy.

Not the case with vibe coding.

LLMs aren't worried about promotions or bonuses. They're not in a hurry to move on to the next
neat feature. They're not distracted by a desire to impress the bosses. They generate code so
quickly as to render rework speed to be trivial. But, as with many human developers, LLMs left
to their own devices will often solve the happy path, without giving any consideration to the
many ways that path can go wrong. Moreover, LLMs often embrace anemic versions of the happy path,
itself. So questioning, probing, and pushing back against the LLM is both free of judgment, and 
critically necessary.

### Getting the Action Button Right
The core goal of the Laps app is to increment laps without opening the app.

The LLM didn't see it that way. The first implementation required that I open the app and tap
on the lap counter to increment it. This made sense from a very generic app perspective, but
completely missed the point of the app, for me.

I told the LLM that I needed to be able to increment the lap count using the Action Button, with
the screen off. The LLM went off to implement it.

Upon a second review, as I looked at the running app, I was able to press the Action Button to
increment the lap count. Good. Then I turned off the screen and pressed the Action Button, again. 
Nothing happened. Not good.

I followed up again with the LLM, reminding it that the Action Button needs to work, even when the
screen is off. The LLM decided that we needed to use an iOS Shortcut so that the Action Button
would work even when the screen is locked.

At first, the LLM implemented an approach which required me, the user, to manually configure an
iOS shortcut, using the Shortcuts app. The LLM gave me a long list of instructions for behaviors
to search for in the app, and how to configure them in the correct order. This approach worked,
and some technically minded developers might even let this pass. But wearing my Product Engineering
hat, I told the LLM that this requirement was ridiculous. You can't expect a user to ever jump
through these hurdles just to configure the Action Button.

Finally, after more pushback, the LLM admitted and acknowledged that we could define a custom
shortcut within the Laps app, instead of making the user set it up manually. As a result,
configuring the Action Button required only a couple, typical steps by the user. I finally had
the Killer Feature for my Laps app.

The LLM, much like many developers, took the most expedient development route at each turn. But
development effort is never the prevailing concern. The North Star is user value. Fortunately,
when it comes to LLMs, increasing development effort costs almost nothing. User value was
delivered.

## Discover New Features
Entrepreneurs are told to "solve your own problems". By solving my own problem, I quickly
discovered other little problems to solve, too.

### The Walk Timer
After a few days of using the app at the gym, it became obvious that I'd like to record my walk
time each day. This way, I can try to increase my walk speed, and do so with verifiable results.

The LLM had already integrated a timer without me ever asking it to. I just needed to ask the
LLM to record the history, and to make the full history available on its own screen.

Now I can work on my speed walking.

### Lock Screen Notifications
As I walked my 20 laps each day, I was glad that I didn't need to unlock the phone to report laps.
However, I found myself wondering about my progress. Am I on lap 5, or lap 15?

To report progress, I had the LLM add a notification to the lock screen during a walk.

With this notification, at any time I can glance at the screen and see which lap I'm on. I get
the hands-off approach of the Action Button, with the easy status updates of a notification.

## Feature Verification Over Code Validation
In professional teams, we try to find bugs by reading changes to the code. It's tedious, 
frustrating, and surprisingly ineffective. But there aren't a lot of better options.

When vibe coding an app for my own use-cases, I can ignore the code changes, and instead just use
the app. Whatever issues I find, I note, and then tell the LLM to fix. Because I'm the developer,
I don't have to worry about irate users dragging me all over the internet for shipping a bug.
It feels like freedom to ignore code changes.

### Timer Bug
In the case of this app, I came across a bug after completing a walk. Usually, when using the app,
I would reset the walk tracker as soon as I finished the walk. But one day I forgot to do that. It 
shouldn't matter when I reset - it's just a state change. But I discovered that the app's walk timer 
kept ticking, even after the completion of the walk, until I hit the reset button. As a result, my 
40 minute walk was recorded as taking 1hr 35 mins. So, I came home from the gym and told the LLM to 
fix. And it did.

### Popup Placement Bug
When vibing the app, I first verify the changes at my desk. I want to catch the obvious bugs before
I get to the gym. But after adding history tracking, all of my quick verifications were adding
entries to my walk history.

I asked the LLM to let me delete historical entries, so that I can delete testing results. Added
bonus, if I ever start a walk by mistake, I can delete that entry, too.

The LLM quickly implemented entry deletion. No problem there. However, the LLM added a little
popup notification to tell me the entry was deleted. This was a fine UX decision. However, the
LLM positioned the notification at the bottom of the screen, which just so happened to cover
up most of the historical records, as well as the reset button. As a result, I couldn't delete
any more records, or reset the walk, until that notification went away. This turned a useful
notification into an immediate irritation.

I had to push the LLM a few times to get the notification positioned somewhere better. We ended
up placing it at the top of the screen. The top position still covered the settings button, but
that button is hardly ever pressed, so not a big deal.