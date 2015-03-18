# NSString+IndefiniteArticle

A simple category to extend NSString to determine indefinite article usage (a|an) for a given word. 

This work was loosely cribbed off of both @rossmeissl's [ruby implementation](https://github.com/rossmeissl/indefinite_article) and @rigoneri's [javascript one](https://github.com/rigoneri/indefinite-article.js) _(which, ultimately was based 
on [Lingua::EN::Inflect](http://search.cpan.org/dist/Lingua-EN-Inflect/lib/Lingua/EN/Inflect.pm#PROVIDING_INDEFINITE_ARTICLES))_.

--

### Installation

We recommend installing with [CocoaPods](http://cocoapods.org).

```
pod 'NSString+IndefiniteArticle'
```

Alternatively, you can just copy the category from the Source directory into your project. And there's a suite of examples in the Tests directory too, if you're into that sort of thing. 

### Usage

The categoy provides both instance and static methods to determine if a given word should have an `a`, or `an` article. 

For example:                                                

```objective-c
// static methods:
[NSString indefiniteArticleForString:@"elipis"] //  -> @"an"
[NSString indefiniteArticleForString:@"taco"]   //  -> @"a"  

// or you can call it on a given string:                       
[@"historic event" indefiniteArticle]           // -> @"a"
[@"USB cable" indefiniteArticle]                // -> @"a"
```

--

### Author

Barclay Loftus (@barclay) http://github.com/barclay

### License

This work is available under the MIT license. See the LICENSE file for more info.
