//
//  NSString+IndefiniteArticle.m
//
//  Created by Barclay Loftus on 3/2/15.
//

#import "NSString+IndefiniteArticle.h"

@implementation NSString (IndefiniteArticle)


+ (NSString*)indefiniteArticleForString:(NSString*)str
{
    NSString *an = @"an";
    NSString *a = @"a";
    
    // typeical "a" matching patterns
    //   words starting with a hard constant: domino eats a boy, a taco, a zebra
    //   words starting with a hard o: domino eats a one, a once in a lifetime offer
    //        (but an oncologist)
    //   words starting with a hard vowel: domino eats a euro, a ukulele,
    //        a uranium screw (but an urban outfitter), a useful idea, a utility belt,
    //        a unicorn, (but an uninvited guest)
    //
    NSString *a_patterns = @"^(([bcdgjkpqtuvwyz]|onc?e|onetime)$|e[uw]|uk|ur[aeiou]|use|ut([^t])|uni(l[^l])|uni[^nmd])"; //|[a-ko-z]
    
    // specific "an" patterns
    //   words starting with a soft h: domino eats an hour, an honest man.
    //   words starting with a soft vowel: domino eats an apple, an elephant, an orange
    //   or any single letters with a soft vowel sound: domino eats an a, an a, an r, an x
    //   or anything that leads with 8: domino eats an 8, an 800 lb gorilla
    //
    NSString *an_patterns = @"^(([aefhilmnorsx]$)|(hono|honest|hour|heir|[aeiou]|8))";
    
    // Capital words or abbreviations which should likely be preceeded by an "a":
    //    Domino eata a UUID, a URL, a JOB
    //
    NSString *upper_case_a_patterns = @"^([BCDJKPQTUVWYZ][A-Z]+)";
    
    // Capital words which should likely be preceeded by an "a":
    //    Domino eats an API, an LP, an HOV
    //
    NSString *upper_case_an_patterns = @"^([AEFHILMNORSX][A-Z]+)";;
    
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\w+" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regex matchesInString:str options:0 range:NSMakeRange(0, str.length)];

    // weird case: no match (input was empty), this could happen if it's either
    // an empty string, or something non-word charactor like.
    //
    if ([matches count] == 0) {
        
        // if it's truly empty, then return empty.
        //
        if ([str length] == 0)
            return @"";
        
        // otherwise, let's defualt to an "a", i.e. "a ©".
        //
        return a;
    }
    
    // Get the first word in the string
    //
    NSString *word = [str substringWithRange:[[matches objectAtIndex:0] range]];
    
    // case sensitive matching...
    //
    regex = [NSRegularExpression regularExpressionWithPattern:upper_case_an_patterns options:0 error:&error];
    matches = [regex matchesInString:word options:0 range:NSMakeRange(0, word.length)];
    if ([matches count] > 0) {
        return an;
    }
    
    regex = [NSRegularExpression regularExpressionWithPattern:upper_case_a_patterns options:0 error:&error];
    matches = [regex matchesInString:word options:0 range:NSMakeRange(0, word.length)];
    if ([matches count] > 0) {
        return a;
    }

    // insensitive...
    //
    regex = [NSRegularExpression regularExpressionWithPattern:a_patterns options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *a_matches = [regex matchesInString:word options:0 range:NSMakeRange(0, word.length)];

    regex = [NSRegularExpression regularExpressionWithPattern:an_patterns options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *an_matches = [regex matchesInString:word options:0 range:NSMakeRange(0, word.length)];

    // balancing the specificity of a_matches, as they could be stonger then the
    // general vowel matching of the an
    //
    if ([an_matches count] > 0) {
        if ([a_matches count] > 0) {
            return a;
        }
        return an;
    }
    
    // anything else gets an a.
    //
    return a;
}


- (NSString *)indefiniteArticle
{
    return [NSString indefiniteArticleForString:self];
}

@end
