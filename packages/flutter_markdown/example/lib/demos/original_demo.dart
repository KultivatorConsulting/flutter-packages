// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../shared/markdown_demo_widget.dart';

// ignore_for_file: public_member_api_docs

const String _markdownData1 = '''

This is a [test link|https://ralleeme.atlassian.net/browse/RUI-65]

[*title*](https://www.example.com)

 *+underline+*

 before color {color:#00b8d9}color{color} after color

😀

''';

const String _markdownData = """

+underline+ inline
ggg {{code}}  inline after code
!image-20220503-014043.png|width=161,height=326!

before sub ~sub info~ after sub

before super ^super info^ after super

h1. Jira markdown start

# list number 1
# list number 2
# list number 3


# another list 1
# another list 2

* bullet 1
* bullet 2

_Italic_

*bold*

-*strike line bold*-

-strike line-

h1. H1 header
h2. H2 header
h3. H3 header
h4. H4 header
h5. H5 header
h6. H6 header

h1. Jira markdown end

# Markdown Example

Markdown allows you to easily include formatted text, images, and even formatted
Dart code in your app.

## Titles

Setext-style

```
This is an H1
=============

This is an H2
-------------
```

Atx-style

```
# This is an H1

## This is an H2

###### This is an H6
```

Select the valid headers:

- [x] `# hello`
- [ ] `#hello`

## Links

[Google's Homepage][Google]

```
[inline-style](https://www.google.com)

[reference-style][Google]
```

## Images

![Flutter logo](/dart-lang/site-shared/master/src/_assets/image/flutter/icon/64.png)

## Tables

|Syntax                                 |Result                               |
|---------------------------------------|-------------------------------------|
|`*italic 1*`                           |*italic 1*                           |
|`_italic 2_`                           | _italic 2_                          |
|`**bold 1**`                           |**bold 1**                           |
|`__bold 2__`                           |__bold 2__                           |
|`This is a ~~strikethrough~~`          |This is a ~~strikethrough~~          |
|`***italic bold 1***`                  |***italic bold 1***                  |
|`___italic bold 2___`                  |___italic bold 2___                  |
|`***~~italic bold strikethrough 1~~***`|***~~italic bold strikethrough 1~~***|
|`~~***italic bold strikethrough 2***~~`|~~***italic bold strikethrough 2***~~|

## Styling
Style text as _italic_, __bold__, ~~strikethrough~~, or `inline code`.

- Use bulleted lists
- To better clarify
- Your points

## Code blocks
Formatted Dart code looks really pretty too:

```
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Markdown(data: markdownData),
    ),
  ));
}
```

## Center Title

###### ※ ※ ※

_* How to implement it see main.dart#L129 in example._

## Custom Syntax

NaOH + Al_2O_3 = NaAlO_2 + H_2O

C_4H_10 = C_2H_6 + C_2H_4

## Markdown widget

This is an example of how to create your own Markdown widget:

    Markdown(data: 'Hello _world_!');

Enjoy!

[Google]: https://www.google.com/

## Line Breaks

This is an example of how to create line breaks (tab or two whitespaces):

line 1


line 2



line 3
""";

const String _notes = """
# Original Markdown Demo
---

## Overview

This is the original Flutter Markdown demo example that was created to
show how to use the flutter_markdown package. There were limitations in
the implementation of this demo example that didn't show the full potential
or extensibility of using the flutter_markdown package. This demo example
is being preserved for reference purposes.

## Comments

This demo example is being preserved for reference purposes.
""";

class OriginalMarkdownDemo extends StatelessWidget
    implements MarkdownDemoWidget {
  OriginalMarkdownDemo({Key? key}) : super(key: key);

  static const String _title = 'Jira Markdown Demo';

  @override
  String get title => OriginalMarkdownDemo._title;

  @override
  String get description => 'Make it work for Jira markdown';

  @override
  Future<String> get data => Future<String>.value(_markdownData);

  @override
  Future<String> get notes => Future<String>.value(_notes);

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Markdown(
          controller: controller,
          selectable: true,
          data: _markdownData1,
          imageDirectory: 'https://presenter.rallee.me',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_upward),
        onPressed: () => controller.animateTo(0,
            duration: const Duration(seconds: 1), curve: Curves.easeOut),
      ),
    );
  }
}
