//
//  NSString+IndefiniteArticleTests.m
//
//  Created by Barclay Loftus on 3/2/15.
//

#import "NSString+IndefiniteArticle.h"
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface NSString_IndefiniteArticleTests : XCTestCase

@end

@implementation NSString_IndefiniteArticleTests

- (void)testEmptyAndNil
{
    XCTAssertEqualObjects([@"" indefiniteArticle], @"");
    
    NSString *nil_str;
    XCTAssertNil([nil_str indefiniteArticle]);
}


- (void)testNumericValues
{
    XCTAssertEqualObjects([@"8" indefiniteArticle], @"an");
    XCTAssertEqualObjects([@"9" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@"800" indefiniteArticle], @"an");
}

- (void)testSingleLetters
{
    XCTAssertEqualObjects([@"a" indefiniteArticle], @"an");
    XCTAssertEqualObjects([@"g" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@"h" indefiniteArticle], @"an");
    XCTAssertEqualObjects([@"m" indefiniteArticle], @"an");
    XCTAssertEqualObjects([@"x" indefiniteArticle], @"an");
    XCTAssertEqualObjects([@"z" indefiniteArticle], @"a");
}

- (void)testSpecialSoftHCases
{
    XCTAssertEqualObjects([@"hourly" indefiniteArticle], @"an");
    XCTAssertEqualObjects([@"honest" indefiniteArticle], @"an");
    XCTAssertEqualObjects([@"historic event" indefiniteArticle], @"a");
}

- (void)testHardConstants
{
    XCTAssertEqualObjects([@"boy" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@"taco" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@"zebra" indefiniteArticle], @"a");
}

- (void)testWordsThatBeginWithVowels
{
    XCTAssertEqualObjects([@"elipsis" indefiniteArticle], @"an");
    XCTAssertEqualObjects([@"once in a lifetime" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@"one" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@"oncologist" indefiniteArticle], @"an");
    XCTAssertEqualObjects([@"unicorn" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@"unintended consequence" indefiniteArticle], @"an");
    XCTAssertEqualObjects([@"unified front" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@"UN ambassedor" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@"UK representitive" indefiniteArticle], @"a");
}

- (void)testSpecialCapitalizedCases
{
    XCTAssertEqualObjects([@"MN"  indefiniteArticle], @"an");
    XCTAssertEqualObjects([@"FAA" indefiniteArticle], @"an");
    XCTAssertEqualObjects([@"JOB" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@"URL" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@"USB" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@"XIP" indefiniteArticle], @"an");
}

- (void)testOddCases
{
    XCTAssertEqualObjects([@"\"quoted\"" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@" leading space" indefiniteArticle], @"a");
    XCTAssertEqualObjects([@"®" indefiniteArticle], @"a");
}

@end
