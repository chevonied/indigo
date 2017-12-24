---
title: "The difference between '\n' and 'endl' in C++"
layout: post
date: 2017-12-23 17:00
tag:
- C++
- Syntax
- Programming
- Nuances
- Endl
- \n
image: /assets/images/n_vs_endl/codeheader.PNG
headerImage: true
category: blog
author: chevoniedaniel
description: "A brief comparison between the use of \n and endl to create new lines in C++"
---

About two years ago when I took my first C++ class, I remember my professor used both `\n` and `endl` to create new lines. Having been previously acquainted with `\n` from Python, I wondered what difference the two had on the running of a program. One day after class, I asked him what the difference was and he told me that `endl` also flushes the buffer.

I wanted to find out more about this, so when I got home I checked with the all-knowing StackOverflow for more information on the two and found out that `endl` is a [stream manipulator](http://www.cplusplus.com/reference/library/manipulators/ "cplusplus.com Stream Manipulator Reference") that forces a flush the buffer which negatively impacts the performance of a program. This is contrast to `\n` which is a typical [escape sequence](http://en.cppreference.com/w/cpp/language/escape "cppreference.com Escape Sequences Reference") and only 1 byte (for `'\n'`) or 2 bytes (for `"\n"`) large. One interesting little nitpick is that using `"\n"` will cause the program to run just _slightly_ slower than `'\n'` since it's a string literal representing two characters, the `'\n'` newline character and the null terminator `'\0'`.

Therefore the wanton use of `endl` should be avoided in instances where performance is major issue..