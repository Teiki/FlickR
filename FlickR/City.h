//
//  City.h
//  FlickR
//
//  Created by Antoine Galtier on 16/05/2014.
//  Copyright (c) 2014 Antoine Galtier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface City : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;

@end
