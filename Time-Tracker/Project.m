//
//  Project.m
//  Time-Tracker
//
//  Created by Eric Newman on 4/18/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Project.h"
#import "Entry.h"
#import "ProjectController.h"

static NSString * const titleKey = @"title";
static NSString * const entriesKey = @"entries";

@interface Project ()

@property (nonatomic, strong)Entry *currentEntry;

@end

@implementation Project

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _title = dictionary[titleKey];
        
        NSMutableArray *entries = [NSMutableArray new];
        for (NSDictionary *entry in dictionary[entriesKey]) {
            [entries addObject:[[Entry alloc] initWithDictionary:entry]];
        }
        
        _entries = entries;
        
    }
    return self;
}

- (NSDictionary *)projectDictionary {
    
    NSMutableDictionary *projectDictionary = [NSMutableDictionary new];
    if (self.title) {
        [projectDictionary setObject:self.title forKey:titleKey];
    }
    
    NSMutableArray *entries = [NSMutableArray new];
    for (Entry *entry in self.entries) {
        [entries addObject:[entry entryDictionary]];
    }
    [projectDictionary setObject:entries forKey:entriesKey];
    
    return projectDictionary;
}

-(void)addEntry:(Entry *)entry {
    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEnries = [[NSMutableArray alloc] initWithArray:self.entries];
    [mutableEnries addObject:entry];
    
    self.entries = mutableEnries;

}

-(void)removeEntry:(Entry *)entry {
    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    [mutableEntries removeObject:entry];
    
    self.entries = mutableEntries;
    
}




@end

