//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  MIT License
//  Copyright (c) 2014 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import <XCTest/XCTest.h>
#import "JSQMessagesAvatarImage.h"


@interface JSQMessagesAvatarImageTests : XCTestCase

@end


@implementation JSQMessagesAvatarImageTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testInitInvalid
{
    XCTAssertThrows([[JSQMessagesAvatarImage alloc] init], @"Invalid init should throw");
    XCTAssertThrows([JSQMessagesAvatarImage avatarImageWithPlaceholder:nil], @"Invalid init should throw");
    XCTAssertThrows([[JSQMessagesAvatarImage alloc] initWithAvatarImage:nil highlightedImage:nil placeholderImage:nil], @"Invalid init should throw");
}

- (void)testInitValid
{
    UIImage *mockImage = [UIImage imageNamed:@"demo_avatar_jobs"];
    JSQMessagesAvatarImage *avatar = [JSQMessagesAvatarImage avatarImageWithPlaceholder:mockImage];
    XCTAssertNotNil(avatar, @"Valid init should succeed");
}

- (void)testCopy
{
    UIImage *mockImage = [UIImage imageNamed:@"demo_avatar_jobs"];
    JSQMessagesAvatarImage *avatar = [[JSQMessagesAvatarImage alloc] initWithAvatarImage:mockImage
                                                                        highlightedImage:mockImage
                                                                        placeholderImage:mockImage];
    
    JSQMessagesAvatarImage *copy = [avatar copy];
    XCTAssertNotNil(copy, @"Copy should succeed");
    
    XCTAssertFalse(avatar == copy, @"Copy should return new, distinct instance");
    
    XCTAssertNotEqualObjects(avatar.avatarImage, copy.avatarImage, @"Images should not be equal");
    XCTAssertNotEqual(avatar.avatarImage, copy.avatarImage, @"Images should not be equal");
    
    XCTAssertNotEqualObjects(avatar.avatarHighlightedImage, copy.avatarHighlightedImage, @"Images should not be equal");
    XCTAssertNotEqual(avatar.avatarHighlightedImage, copy.avatarHighlightedImage, @"Images should not be equal");
    
    XCTAssertNotEqualObjects(avatar.avatarPlaceholderImage, copy.avatarPlaceholderImage, @"Images should not be equal");
    XCTAssertNotEqual(avatar.avatarPlaceholderImage, copy.avatarPlaceholderImage, @"Images should not be equal");
}

- (void)testCurrentDisplayImage
{
    UIImage *mockImage = [UIImage imageNamed:@"demo_avatar_jobs"];
    UIImage *mockPlaceholderImage = [UIImage imageNamed:@"demo_avatar_cook"];
    
    JSQMessagesAvatarImage *avatar = [JSQMessagesAvatarImage avatarImageWithPlaceholder:mockPlaceholderImage];
    
    XCTAssertNil(avatar.avatarImage);
    XCTAssertEqualObjects(mockPlaceholderImage, avatar.currentDisplayImage, @"Should display placeholder image if avatar image is nil");
    
    avatar.avatarImage = mockImage;
    XCTAssertEqualObjects(mockImage, avatar.currentDisplayImage, @"Should display avatar image if available");
}

@end
