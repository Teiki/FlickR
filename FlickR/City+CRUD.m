//
//  City+CRUD.m
//  FlickR
//
//  Created by Antoine Galtier on 16/05/2014.
//  Copyright (c) 2014 Antoine Galtier. All rights reserved.
//

#import "City+CRUD.h"
#import "AppDelegate.h"


@implementation City (CRUD)


+ (AppDelegate*) appDelegate
{
    return [[UIApplication sharedApplication] delegate];
}


+ (NSManagedObjectContext*) context
{
    return [[self appDelegate]managedObjectContext];
}


+ (instancetype) newCity
{
    City * city = [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:[self context]];
    [[self appDelegate] saveContext];
    return city;
}


- (void) destroy
{
    [[City context] deleteObject:self];
    [[City appDelegate] saveContext];
}

+ (NSArray*) allCities
{
    NSFetchRequest * request = [[NSFetchRequest alloc] initWithEntityName:@"City"];
    return [[self context] executeFetchRequest:request error:nil];
}

+ (void) saveChanges
{
    [[self appDelegate] saveContext];
}

@end
