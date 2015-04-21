//
//  ProjectController.h
//  Time-Tracker
//
//  Created by Eric Newman on 4/18/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"

@interface ProjectController : NSObject

@property (nonatomic, strong) NSArray *projects;

+(ProjectController *)sharedInstance;

@end
