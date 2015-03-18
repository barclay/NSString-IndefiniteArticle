//
//  NSString+IndefiniteArticle.h
//
//  Created by Barclay Loftus on 3/2/15.
//

#import <Foundation/Foundation.h>

/**
 * Category to extend NSString to determine indefinite article usage (a|an)
 * for a given word. 
 * 
 * Work was loosely cribbed off of both https://github.com/rossmeissl/indefinite_article and
 * https://github.com/rigoneri/indefinite-article.js, which was ultimately based 
 * on http://search.cpan.org/dist/Lingua-EN-Inflect/lib/Lingua/EN/Inflect.pm#PROVIDING_INDEFINITE_ARTICLES
 */
@interface NSString (IndefiniteArticle)

/**
 * Class method that returns the appropriate article for the given string.
 *
 * ie:
 *    [NSString indefiniteArticleForString:@"elipis"] => @"an"
 */
+ (NSString*)indefiniteArticleForString:(NSString*)str;

/**
 * Instance method, that for a given string, returns the appropriate indedinite
 * article.
 *
 * ie:
 * NSString *str = @"elipis";
 * [str indefiniteArticle] => @"an"
 */
- (NSString*)indefiniteArticle;

@end
