//
//  FlickRPicture.h
//  FlickR
//
//  Created by Antoine Galtier on 30/04/2014.
//  Copyright (c) 2014 Antoine Galtier. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct
{
    double latitude;
    double longitude;
    int radius;
} FlickRLocation;

@interface FlickRPicture : NSObject

@property (strong, nonatomic) NSString * pictureID;
@property (strong, nonatomic) NSString * server;
@property (strong, nonatomic) NSString * secret;
@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * farm;

- (NSURL*)url;

+ (NSArray*) picturesAroundLocation:(FlickRLocation) location;

@end
