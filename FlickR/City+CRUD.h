//
//  City+CRUD.h
//  FlickR
//
//  Created by Antoine Galtier on 16/05/2014.
//  Copyright (c) 2014 Antoine Galtier. All rights reserved.
//

#import "City.h"

@interface City (CRUD)

+ (instancetype) newCity;

+ (void) saveChanges;
- (void) destroy;

+ (NSArray*) allCities;

@end
