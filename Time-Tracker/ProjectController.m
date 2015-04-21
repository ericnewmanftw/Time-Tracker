//
//  ProjectController.m
//  Time-Tracker
//
//  Created by Eric Newman on 4/18/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ProjectController.h"
#import "Project.h"

static NSString * const projectListKey = @"projectList";

@interface ProjectController ()

@end

@implementation ProjectController

+ (ProjectController *)sharedInstance {
    static ProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ProjectController alloc] init];
        
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}

- (void)loadFromDefaults {
    
    NSArray *projectDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:projectListKey];
    
    NSMutableArray *projects = [NSMutableArray new];
    for (NSDictionary *project in projectDictionaries) {
        [projects addObject:[[Project alloc] initWithDictionary:project]];
    }
    
    self.projects = projects;
    
}


-(void)addProject:(Project *)project {
    
    if (!project) {
        return;
    }
    
    NSMutableArray *mutableProject = [[NSMutableArray alloc] initWithArray:self.projects];
    [mutableProject addObject:project];
    
    self.projects = mutableProject;
}

-(void)removeProject:(Project *)project {
    
    if (!project) {
        return;
    }
    
    NSMutableArray *mutableProject = self.projects.mutableCopy;
    [mutableProject removeObject:project];
    
    self.projects = mutableProject;
    
    
}

@end
