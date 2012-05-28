## What the crap is Spindle? (aka Vaporware)
The goal of Spindle is to provide a single language that is specialized for creating rich modern websites and applications. It is not meant to be used as a general purpose language, though seeing as rich modern web applications are quite broad in scope, it does have to have a good range.

## Challenges
The challenges I see include:

 - Intelligently utilizing the range of web technologies available: html/css/js/http/new html5 apis
 - Providing a language that goes with the grain: it should feel *webby*
 - Distributed computing: making it easy to work between client and server
 - No Threads: nor would I want them, but I would like my language to aid in the asynchrony common to javascript

## Features
After playing around with the challenges for a while, the approach that I'd like to start with has the following key features:

 - Declarative/Functional: Should be able to express UI in a declarative style, and even have pattern matching elements that can be used in a similar fashion to CSS or XPath. This is pretty webby - look at XML,JSON,HTML,CSS
 - Structural typing, with simplified nominal elements (nominal pieces allowing for some of the benefits of enums and ADTs)
 - Type inference as much as possible to maintain a dynamic feel, but allow for stronger type guarantees for larger applications
 - OCap as a security model
 - Promises to handle asynchrony: Promises and OCap are some of the founding features of the E programming language and influential 