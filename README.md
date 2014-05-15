markblog
========

Simple markdown compiler for using in blogs.

## Installation

    $ npm install markblog

## Usage

 Given `post1.md` like

```
---
title: This is the post title.
date: 2014-5-15
---

This is a dummy post.
```

```js
var markblog = require('markblog');

var post = markblog.read('./posts/post1.md');
var lotofposts = markblog.readFolder('./posts');

/* 
  post = { 
    title:'This is the post title.',
    date: Date(2014-4-15),
    body:
      html: '<p>This is a dummy post.</p>',
      markdown: 'This is a dummy post.'
  }
  
  and

  lotofposts == [post]
*/
```

## License

```
The MIT License (MIT)

Copyright (c) 2014 Leonardo Kewitz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```