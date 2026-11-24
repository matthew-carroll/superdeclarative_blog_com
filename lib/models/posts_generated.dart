// GENERATED CODE - DO NOT MODIFY BY HAND
import 'post.dart';

const List<BlogPost> mockPosts = [
  BlogPost(
    id: 'seance-summon-mac-windows',
    title: 'Séance: Summon Mac Windows',
    date: 'November 22, 2026',
    excerpt: 'Black magic to save and restore Mac windows in a Space.',
    content: '''<p>Projects use so many windows: IDE, browser tabs, Finder, terminal, etc.</p>
<p>I work on so many projects. I fill a Mac Space with windows for one project, and then I open more spaces and do it again for more projects.</p>
<p>Pretty soon I\'m sinking Gigabytes of memory, and half my CPU, just to maintain a dozen Mac Spaces filled with windows. If I close the windows, I\'ll forget what was open, and I don\'t want to spend time re-arranging all those windows, anyway. So they just keep adding up.</p>
<p>TODO: visual of maxed out spaces and closing them</p>
<p>I decided to design and build a Mac app to save my window locations, and then restore those windows on demand.</p>
<h2 id="app-form-factor">App Form Factor</h2>
<p>How should this app present itself to the user?</p>
<p>A traditional window belongs to a Space, and yet this app is responsible for closing and opening all the windows in a Space.</p>
<p>TODO: visual of menu bar popover opening and closing, floated to left</p>
<p>I decided to build this app as a popover that launches from the Mac menu bar. As such, it doesn\'t really belong to any Space, and it doesn\'t use a traditional window. It\'s clear to the user that this app operates at a higher level of control than all other windows and apps on the screen.</p>
<h2 id="saving-windows">Saving Windows</h2>
<p>In a perfect world, saving windows would happen instantaneously. Flip a switch, every window is gone, and its position and state are recorded.</p>
<p>But this is the real world. Things take time.</p>
<p>TODO: Show closing animation</p>
<p>While windows are being closed, the user needs to know that the app knows where all the windows are, and that the app is actively trying to close them.
To accomplish this, the app draws a border around each window it\'s closing, and animates sparkles to show the user that
progress is being made.</p>
<h2 id="restoring-windows">Restoring Windows</h2>
<p>Restoring windows is much more difficult than closing them.</p>
<p>When restoring windows, the app must consider and handle a variety of app configurations:</p>
<ul>
<li>Heavy windows that take many seconds to open</li>
<li>Apps that open to a special welcome screen, or update window</li>
<li>Multi-window apps (e.g., Chrome with other windows in other Spaces)</li>
<li>Project windows (e.g., VSCode working in a specific directory)</li>
<li>Threaded windows (e.g., Claude open to a conversation, Slack open to a workspace and conversation)</li>
</ul>
<p>Putting ourselves in the shoes of a user, the following questions and complaints are critical:</p>
<ol>
<li>Don\'t lose any of my windows!</li>
<li>Something went wrong, help me heal it.</li>
<li>This is taking a long time, is it stuck?</li>
<li>Hurry up and finish!</li>
</ol>
<p>These user concerns are translated to the following app requirements:</p>
<ol>
<li>Safety - Don\'t lose windows or configuration, but if you do, help fix it.</li>
<li>Clarity - Show what the app is doing, and make failures obvious.</li>
<li>Speed - Don\'t make the user wait longer than necessary.</li>
</ol>
<h3 id="safety">Safety</h3>
<p>To make a best attempt to summon windows without losing any, each window is given 1-2 minutes to summon, before the app gives up.
There must be some point at which the app gives up, but a lot of time is provided, to minimize failures.</p>
<p>Given that each window can take a long time to summon, safety also requires an escape hatch so that the user doesn\'t
get stuck waiting when he would instead rather cancel and move on to other things. The app provides a mounted display
during summon, which lets the user cancel.</p>
<p>TODO: Show the mounted controls.</p>
<p>Should things go very wrong while summoning, the app continues to remember the original window locations until the user
either updates it, or deletes it. Therefore, the user can try again.</p>
<h3 id="clarity">Clarity</h3>
<p>The app highlights and sparkles at every location where it\'s summoning a window.</p>
<p>After a few seconds, a countdown begins, which represents how long that window has to summon before the app gives up.</p>
<p>TODO: summon example, with timer</p>
<p>Should a window fail to summon, the highlight goes up in smoke, indicating a failure.</p>
<p>TODO: show a failure</p>
<h3 id="speed">Speed</h3>
<p>The app doesn\'t have much control over the speed of summoning. Each window that\'s summoned will appear as quickly,
or as slowly as its host app is able to launch it.</p>
<p>The app\'s focus on speed, instead, is focused on not overwhelming the CPU. Launching a dozen windows at the same
time will bring the system UI to a hault. To help with the appearance of speed, each window summon is staggered by
a few seconds. This takes longer, but often feels quicker, because the UI remains responsive throughout the
process.</p>
<p>TODO: show multiple windows summoned in order</p>
<h2 id="naming-amp-theming">Naming &amp; Theming</h2>
<p>One of my favorite things to do with a new product is to design its brand and theme.</p>
<p>TODO: Show app icon floating to the side</p>
<p>It didn\'t take long, experimenting with window outlines and particle effects, before I landed on the concept of magic.</p>
<p>Specifically, I decided to frame window restoration as &quot;summoning&quot; windows. The app, which summons those windows, is called Séance.</p>
<p>Séance, and summoning, informed the color scheme, app icon, and the visual effects used to close and summon windows.</p>
<h2 id="sance-is-publicly-available">Séance is Publicly Available</h2>
<p>You can try Séance for yourself. It\'s free to <a href="https://seance.randomwalk.design" target="_blank">download</a> and use.</p>
''',
    headings: const [
      BlogPostHeading(text: 'App Form Factor', level: 2),
      BlogPostHeading(text: 'Saving Windows', level: 2),
      BlogPostHeading(text: 'Restoring Windows', level: 2),
      BlogPostHeading(text: 'Safety', level: 3),
      BlogPostHeading(text: 'Clarity', level: 3),
      BlogPostHeading(text: 'Speed', level: 3),
      BlogPostHeading(text: 'Naming &amp; Theming', level: 2),
      BlogPostHeading(text: 'Séance is Publicly Available', level: 2),
    ],
  ),
  BlogPost(
    id: 'counting-gym-laps-theres-an-app-for-that',
    title: 'Gym Vibes',
    date: 'September 7, 2026',
    excerpt: 'I got tired of counting laps at the gym, so I vibed an app!',
    draft: true,
    content: '''<p>Every day I walk two miles on the track at my gym. The track is a tenth of a mile long. That\'s 20 laps, and I can\'t count that high.</p>
<p>So I built an app to count for me. The catch: I never want to open it, look at it, or even unlock the screen. This is the story of how I got there, and why pushing back on the LLM, hard, was the whole job.</p>
<h2 id="software-engineer-hat-vs-product-engineer-hat">Software Engineer Hat vs. Product Engineer Hat</h2>
<p>As a Software Engineer, my incentive is to build a beautiful UI with lots of features. Show off.</p>
<p>As a Product Engineer, my incentive is the opposite: solve the user\'s problem as fast as possible. Where I can, don\'t make the user open the app at all. The user doesn\'t care about a pretty UI or a pile of features. They care about getting back to their life.</p>
<p>As the only user of this app, I leaned all the way into the Product Engineer.</p>
<h2 id="dont-open-the-app-dont-even-unlock-the-screen">Don\'t Open the App. Don\'t Even Unlock the Screen.</h2>
<p>I don\'t want to open the app every time I finish a lap. I don\'t even want to look at the screen. So what are my options?</p>
<p><strong>Location tracking</strong> was my first thought: detect the laps automatically. But GPS at that granularity is nearly impossible to get right. Not worth the frustration.</p>
<p><strong>An Apple Watch app</strong> was the second. Not a bad idea, but I don\'t wear my watch to the gym. Maybe later.</p>
<p>Then I noticed something: I already carry my phone in my hand the whole walk. It\'s too big and heavy to shove in a sweatpants pocket with my keys, so I just hold it.</p>
<p>That\'s when it clicked. The <strong>Action Button</strong>.</p>
<p>Modern iPhones have a dedicated hardware button that users can configure, and that apps can hook into. Since I\'m already holding the phone, pressing the Action Button every time I pass the track entrance is effortless. I can start, count, and finish my walk without ever looking at the screen, let alone unlocking it. That was the answer.</p>
<h2 id="the-generated-ui-is-good-enough">The Generated UI Is Good Enough</h2>
<p>I\'m always tempted to obsess over an app\'s UI. But for a personal app, especially one designed to keep me <em>out</em> of it, does it matter?</p>
<p>Modern LLMs have seen enough fitness apps to generate a reasonable, not-awful UI on the first try. I told the LLM to keep it minimal. That was enough. I was happy with what came back.</p>
<p>INSERT SCREENSHOT</p>
<p>If I were shipping this to the App Store, I\'d overhaul the design. For me at the gym, the UI isn\'t worth another minute.</p>
<h2 id="push-for-the-ideal-hunt-for-the-edge-cases">Push for the Ideal, Hunt for the Edge Cases</h2>
<p>Here\'s what surprised me: the thing that makes me a bad guy on a human dev team is exactly what makes me effective with an AI.</p>
<p>In my professional life, I ask a lot of questions in code reviews. I raise every edge case I can think of. I ask whether it\'s been considered, what happens when it breaks, whether there\'s a test for it, and why this approach won over the alternatives. These questions expose holes in the solution, and blind spots in the original request. But when developers are judged by throughput, and bonuses ride on closed-ticket counts, that kind of questioning makes me the bad guy.</p>
<p>Not with an LLM.</p>
<p>LLMs don\'t care about promotions or bonuses. They\'re not itching to move on to the next shiny feature. And they generate code so fast that rework is nearly free. But like a lot of human developers, an LLM left alone will solve the happy path and ignore the many ways it breaks. It\'ll often ship an anemic version of the happy path at that. So questioning, probing, and pushing back costs nothing, carries no judgment, and is absolutely necessary.</p>
<h3 id="getting-the-action-button-right">Getting the Action Button Right</h3>
<p>The entire point of the app is to count laps <em>without</em> opening it. The LLM didn\'t see it that way.</p>
<p>The first version made me open the app and tap the counter. Sensible for a generic app; completely wrong for mine. I told the LLM the Action Button had to increment the count with the screen off. It went and implemented it.</p>
<p>On the next review, I pressed the Action Button with the app open. It worked. Then I turned off the screen and pressed it again. Nothing.</p>
<p>I reminded the LLM: the button has to work with the screen off. This time it reached for an iOS Shortcut so the button would fire even when the phone is locked.</p>
<p>But the first Shortcut approach required <em>me</em> to configure it by hand: a long list of steps in the Shortcuts app, in exactly the right order. It worked, and some engineers might have called it done. Product hat on, I told the LLM this was ridiculous. You can\'t ask a user to jump through that just to set up a button.</p>
<p>After more pushback, the LLM finally admitted we could define a custom shortcut <em>inside</em> the app instead of making the user build one. Now configuring the Action Button takes a couple of ordinary taps. That was the killer feature.</p>
<p>At every turn, the LLM took the most expedient route, just like a lot of developers. But development effort was never the constraint. User value is the North Star, and with an LLM, more effort costs almost nothing. So I spent it.</p>
<h2 id="solving-my-own-problem-surfaced-more-problems">Solving My Own Problem Surfaced More Problems</h2>
<p>Entrepreneurs are told to &quot;solve your own problem.&quot; Solving mine surfaced a few smaller ones worth solving too.</p>
<h3 id="the-walk-timer">The Walk Timer</h3>
<p>After a few days, I realized I wanted to record my time each day, something verifiable to push my speed against. The LLM had already built a timer without me asking. I just had it save the history and give it its own screen. Now I can work on getting faster.</p>
<h3 id="lock-screen-notifications">Lock Screen Notifications</h3>
<p>Not unlocking my phone was great, until I caught myself wondering: am I on lap 5 or lap 15? So I had the LLM add a live notification to the lock screen during a walk. Now I get the hands-off Action Button <em>and</em> a glanceable status. Best of both.</p>
<h2 id="verify-the-feature-not-the-code">Verify the Feature, Not the Code</h2>
<p>On professional teams, we hunt bugs by reading code changes. It\'s tedious, frustrating, and surprisingly ineffective, but there aren\'t many better options.</p>
<p>Vibe coding an app for myself, I can skip the diff and just <em>use</em> the app. Whatever breaks, I note it and tell the LLM to fix it. Because I\'m the only user, there are no irate customers dragging me across the internet over a bug. Ignoring the code feels like freedom.</p>
<h3 id="the-timer-bug">The Timer Bug</h3>
<p>Normally I reset the tracker the moment I finish a walk. One day I forgot. It shouldn\'t matter, since it\'s just a state change, but the timer kept ticking until I hit reset. My 40-minute walk was logged as 1 hour 35. I came home, told the LLM to fix it, and it did.</p>
<h3 id="the-popup-bug">The Popup Bug</h3>
<p>I verify changes at my desk before I get to the gym. But once I added history tracking, every test run was polluting my walk history. So I asked for the ability to delete entries, handy for tests, and for the days I start a walk by accident.</p>
<p>The LLM added deletion fast. It also added a little &quot;entry deleted&quot; popup, a nice touch, except it parked the popup at the bottom of the screen, right on top of the records and the reset button. I couldn\'t delete another entry or reset until it disappeared. A helpful notification became an instant irritation. It took a few rounds of pushing to move it up top, where it only covers the rarely used settings button.</p>
<h2 id="the-whole-job-was-saying-quotnot-good-enoughquot">The Whole Job Was Saying &quot;Not Good Enough&quot;</h2>
<p>The LLM wrote the code. My job was to keep insisting it wasn\'t done: work with the screen off, don\'t make the user configure a Shortcut, don\'t cover the reset button. Every one of those took pushback the LLM wouldn\'t have volunteered.</p>
<p>That\'s the shift. The bottleneck was never writing the code. It was refusing to accept the happy path. Wear the Product Engineer hat, keep asking the annoying questions, and you get an app so good you never have to look at it.</p>
<hr />
<p>Every day I walk two miles on a track at the gym. The problem is, the track is only 1/10th of mile long.
That\'s 20 laps to count! I can\'t count that high, so I designed and built an app to do it for me.
This is that story.</p>
<h2 id="software-engineer-hat-vs-product-engineer-hat">Software Engineer Hat vs Product Engineer Hat</h2>
<p>As a Software Engineer, my incentive is to create a beautiful UI with lots of features. Show
off my skills.</p>
<p>As a Product Engineer, my incentives are different. Solve user problems quickly.
Where possible, don\'t make the user open the app at all. The user doesn\'t care about a pretty UI,
or a bundle of features. He cares about getting back to life.</p>
<p>As the only user of this new app, I leaned into the Product Engineer role.</p>
<h2 id="dont-open-the-app-dont-even-unlock-the-screen">Don\'t Open the App. Don\'t Even Unlock the Screen.</h2>
<p>Not only do I not want to open the app every time I complete a lap. I don\'t even want to look at
the screen. What can I do?</p>
<p>First thought is a location tracker that automatically detects the laps. But location tracking
at that granularity is often impossible to get right. Not worth the effort and frustration.</p>
<p>Second thought is an Apple Watch app. Not a bad idea, but as of this moment I\'m not wearing
my Apple Watch to the gym. Maybe later.</p>
<p>Third thought is about the fact that I\'m currently carrying my phone in my hand as I walk. I do
this because the phone is relatively large and heavy. I don\'t want to shove it in my sweatpants
pocket with my wallet or keys. So I carry it.</p>
<p>I decided to leverage a unique hardware capability of iPhones - the Action Button.</p>
<p>Modern iPhones have a dedicated hardware button called the Action Button. This button can be
configured by the user to do various things, and apps can publish behaviors that a user can
trigger with the action button.</p>
<p>Given that I hold my phone in my hand as I walk, anyway, it\'s trivial for me to press the
Action Button every time I pass the track entrance. By hooking into this button, I can start,
progress, and complete my walk without ever looking at the screen, let alone unlock it. This
is the answer for me.</p>
<h2 id="the-generated-ui-is-good-enough">The Generated UI is Good Enough</h2>
<p>I\'m always tempted to focus on an app\'s UI design. But for a personal app, especially an app that\'s
designed to keep me out of it, do I really need to worry about it?</p>
<p>It turns out that modern LLMs have seen enough fitness apps to generate a reasonable, not awful
app UI.</p>
<p>I instructed the LLM to create a minimal UI. Those instructions proved to be sufficient. I was
happy enough with what was generated.</p>
<p>INSERT SCREENSHOT</p>
<p>If I were to ship this to the app stores, I would certainly overhaul the UI. But for me at the gym,
the UI isn\'t worth any further investment.</p>
<h2 id="pushing-for-ideal-features-identifying-edge-cases">Pushing for Ideal Features, Identifying Edge Cases</h2>
<p>In the world of vibe coding, I\'ve discovered that the approach that makes me a villain in
traditional app teams is actually a benefit when working with AI.</p>
<p>In my professional life, I ask a lot of questions in code reviews. I bring up every edge case I
can think of, asking the developer if he\'s considered it, and what the effect would be. I
recommend tests for each such edge case, where possible. I ask about alternative approaches that
were considered, and why this approach was chosen. Questions like this often expose holes in the
solution, and even blind spots in the original feature request. But in a world where developers
are judged by throughput, promotions and bonuses are based on closed ticket count, and developer
interest is based on novelty, asking these questions makes me the bad guy.</p>
<p>Not the case with vibe coding.</p>
<p>LLMs aren\'t worried about promotions or bonuses. They\'re not in a hurry to move on to the next
neat feature. They\'re not distracted by a desire to impress the bosses. They generate code so
quickly as to render rework speed to be trivial. But, as with many human developers, LLMs left
to their own devices will often solve the happy path, without giving any consideration to the
many ways that path can go wrong. Moreover, LLMs often embrace anemic versions of the happy path,
itself. So questioning, probing, and pushing back against the LLM is both free of judgment, and
critically necessary.</p>
<h3 id="getting-the-action-button-right">Getting the Action Button Right</h3>
<p>The core goal of the Laps app is to increment laps without opening the app.</p>
<p>The LLM didn\'t see it that way. The first implementation required that I open the app and tap
on the lap counter to increment it. This made sense from a very generic app perspective, but
completely missed the point of the app, for me.</p>
<p>I told the LLM that I needed to be able to increment the lap count using the Action Button, with
the screen off. The LLM went off to implement it.</p>
<p>Upon a second review, as I looked at the running app, I was able to press the Action Button to
increment the lap count. Good. Then I turned off the screen and pressed the Action Button, again.
Nothing happened. Not good.</p>
<p>I followed up again with the LLM, reminding it that the Action Button needs to work, even when the
screen is off. The LLM decided that we needed to use an iOS Shortcut so that the Action Button
would work even when the screen is locked.</p>
<p>At first, the LLM implemented an approach which required me, the user, to manually configure an
iOS shortcut, using the Shortcuts app. The LLM gave me a long list of instructions for behaviors
to search for in the app, and how to configure them in the correct order. This approach worked,
and some technically minded developers might even let this pass. But wearing my Product Engineering
hat, I told the LLM that this requirement was ridiculous. You can\'t expect a user to ever jump
through these hurdles just to configure the Action Button.</p>
<p>Finally, after more pushback, the LLM admitted and acknowledged that we could define a custom
shortcut within the Laps app, instead of making the user set it up manually. As a result,
configuring the Action Button required only a couple, typical steps by the user. I finally had
the Killer Feature for my Laps app.</p>
<p>The LLM, much like many developers, took the most expedient development route at each turn. But
development effort is never the prevailing concern. The North Star is user value. Fortunately,
when it comes to LLMs, increasing development effort costs almost nothing. User value was
delivered.</p>
<h2 id="discover-new-features">Discover New Features</h2>
<p>Entrepreneurs are told to &quot;solve your own problems&quot;. By solving my own problem, I quickly
discovered other little problems to solve, too.</p>
<h3 id="the-walk-timer">The Walk Timer</h3>
<p>After a few days of using the app at the gym, it became obvious that I\'d like to record my walk
time each day. This way, I can try to increase my walk speed, and do so with verifiable results.</p>
<p>The LLM had already integrated a timer without me ever asking it to. I just needed to ask the
LLM to record the history, and to make the full history available on its own screen.</p>
<p>Now I can work on my speed walking.</p>
<h3 id="lock-screen-notifications">Lock Screen Notifications</h3>
<p>As I walked my 20 laps each day, I was glad that I didn\'t need to unlock the phone to report laps.
However, I found myself wondering about my progress. Am I on lap 5, or lap 15?</p>
<p>To report progress, I had the LLM add a notification to the lock screen during a walk.</p>
<p>With this notification, at any time I can glance at the screen and see which lap I\'m on. I get
the hands-off approach of the Action Button, with the easy status updates of a notification.</p>
<h2 id="feature-verification-over-code-validation">Feature Verification Over Code Validation</h2>
<p>In professional teams, we try to find bugs by reading changes to the code. It\'s tedious,
frustrating, and surprisingly ineffective. But there aren\'t a lot of better options.</p>
<p>When vibe coding an app for my own use-cases, I can ignore the code changes, and instead just use
the app. Whatever issues I find, I note, and then tell the LLM to fix. Because I\'m the developer,
I don\'t have to worry about irate users dragging me all over the internet for shipping a bug.
It feels like freedom to ignore code changes.</p>
<h3 id="timer-bug">Timer Bug</h3>
<p>In the case of this app, I came across a bug after completing a walk. Usually, when using the app,
I would reset the walk tracker as soon as I finished the walk. But one day I forgot to do that. It
shouldn\'t matter when I reset - it\'s just a state change. But I discovered that the app\'s walk timer
kept ticking, even after the completion of the walk, until I hit the reset button. As a result, my
40 minute walk was recorded as taking 1hr 35 mins. So, I came home from the gym and told the LLM to
fix. And it did.</p>
<h3 id="popup-placement-bug">Popup Placement Bug</h3>
<p>When vibing the app, I first verify the changes at my desk. I want to catch the obvious bugs before
I get to the gym. But after adding history tracking, all of my quick verifications were adding
entries to my walk history.</p>
<p>I asked the LLM to let me delete historical entries, so that I can delete testing results. Added
bonus, if I ever start a walk by mistake, I can delete that entry, too.</p>
<p>The LLM quickly implemented entry deletion. No problem there. However, the LLM added a little
popup notification to tell me the entry was deleted. This was a fine UX decision. However, the
LLM positioned the notification at the bottom of the screen, which just so happened to cover
up most of the historical records, as well as the reset button. As a result, I couldn\'t delete
any more records, or reset the walk, until that notification went away. This turned a useful
notification into an immediate irritation.</p>
<p>I had to push the LLM a few times to get the notification positioned somewhere better. We ended
up placing it at the top of the screen. The top position still covered the settings button, but
that button is hardly ever pressed, so not a big deal.</p>
''',
    headings: const [
      BlogPostHeading(text: 'Software Engineer Hat vs. Product Engineer Hat', level: 2),
      BlogPostHeading(text: 'Don\'t Open the App. Don\'t Even Unlock the Screen.', level: 2),
      BlogPostHeading(text: 'The Generated UI Is Good Enough', level: 2),
      BlogPostHeading(text: 'Push for the Ideal, Hunt for the Edge Cases', level: 2),
      BlogPostHeading(text: 'Getting the Action Button Right', level: 3),
      BlogPostHeading(text: 'Solving My Own Problem Surfaced More Problems', level: 2),
      BlogPostHeading(text: 'The Walk Timer', level: 3),
      BlogPostHeading(text: 'Lock Screen Notifications', level: 3),
      BlogPostHeading(text: 'Verify the Feature, Not the Code', level: 2),
      BlogPostHeading(text: 'The Timer Bug', level: 3),
      BlogPostHeading(text: 'The Popup Bug', level: 3),
      BlogPostHeading(text: 'The Whole Job Was Saying &quot;Not Good Enough&quot;', level: 2),
      BlogPostHeading(text: 'Software Engineer Hat vs Product Engineer Hat', level: 2),
      BlogPostHeading(text: 'Don\'t Open the App. Don\'t Even Unlock the Screen.', level: 2),
      BlogPostHeading(text: 'The Generated UI is Good Enough', level: 2),
      BlogPostHeading(text: 'Pushing for Ideal Features, Identifying Edge Cases', level: 2),
      BlogPostHeading(text: 'Getting the Action Button Right', level: 3),
      BlogPostHeading(text: 'Discover New Features', level: 2),
      BlogPostHeading(text: 'The Walk Timer', level: 3),
      BlogPostHeading(text: 'Lock Screen Notifications', level: 3),
      BlogPostHeading(text: 'Feature Verification Over Code Validation', level: 2),
      BlogPostHeading(text: 'Timer Bug', level: 3),
      BlogPostHeading(text: 'Popup Placement Bug', level: 3),
    ],
  ),
  BlogPost(
    id: 'about',
    title: 'About',
    date: '',
    excerpt: '',
    content: '''<p>Hi, I\'m Matt, also known online as SuperDeclarative!</p>
<p>I\'m a software engineer who builds Flutter apps for clients. I previously worked at Google on the Flutter SDK, and the Nest Android app.</p>
<p>When I\'m not writing Flutter code for clients, I design and build my own apps, websites, and games. Sometimes I build them just for me. Sometimes I build them for everyone.</p>
<p>Check out my <a href="/">Product Designs</a> to see how I approach user needs and UX design.</p>
<h3 id="random-walk-design">Random Walk Design</h3>
<p>I\'m the co-founder of <a href="https://randomwalk.design">Random Walk Design</a>, where we design and build apps to solve any problem we can find.</p>
<h3 id="contact-amp-follow">Contact &amp; Follow</h3>
<ul>
<li>X: <a href="https://x.com/suprdeclarative">@SuprDeclarative</a></li>
<li>Dev Services: <a href="https://superdeclarative.com">SuperDeclarative.com</a></li>
<li>YouTube: <a href="https://www.youtube.com/@SuperDeclarative">@SuperDeclarative</a></li>
<li>OSS Development: <a href="https://flutterbountyhunters.com">Flutter Bounty Hunters</a></li>
</ul>
''',
    headings: const [
      BlogPostHeading(text: 'Random Walk Design', level: 3),
      BlogPostHeading(text: 'Contact &amp; Follow', level: 3),
    ],
  ),
];
