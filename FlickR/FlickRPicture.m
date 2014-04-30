//
//  FlickRPicture.m
//  FlickR
//
//  Created by Antoine Galtier on 30/04/2014.
//  Copyright (c) 2014 Antoine Galtier. All rights reserved.
//

#import "FlickRPicture.h"
#define kFlickerFetcherAPIKey @"ad3d45957aa054d207f988fb7d8c8fb9"

@implementation FlickRPicture

- (NSURL *) url
{
    NSString * urlString = [NSString stringWithFormat:@"http://farm%i.staticflickr.com/%@/%@_%@.jpg",self.farm.intValue,self.server,self.pictureID,self.secret];
    return [NSURL URLWithString:urlString];
}

+ (NSArray*) picturesAroundLocation:(FlickRLocation) location
{
    NSString * urlString = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&lat=%f&lon=%f&radius=%i&format=json&nojsoncallback=1",kFlickerFetcherAPIKey,location.latitude,location.longitude,location.radius];
    NSURL * url = [NSURL URLWithString:urlString];
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    NSDictionary * jsonAnswer = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSMutableArray * pictures = [NSMutableArray arrayWithCapacity:[jsonAnswer[@"photos"][@"photo"] count]];
    
    for (NSDictionary * currentPicture in jsonAnswer[@"photos"][@"photo"]) {
        FlickRPicture * picture = [[FlickRPicture alloc] init];
        picture.pictureID = currentPicture[@"id"];
        picture.server = currentPicture[@"server"];
        picture.title = currentPicture[@"title"];
        picture.secret = currentPicture[@"secret"];
        picture.farm = currentPicture[@"farm"];
        
        [pictures addObject:picture];
    }
    
    return [NSArray arrayWithArray:pictures];
}

@end
