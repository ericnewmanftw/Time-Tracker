//
//  TTListTableViewDatasource.m
//  Time-Tracker
//
//  Created by Eric Newman on 4/18/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTListTableViewDatasource.h"
#import "ProjectController.h"



@implementation TTListTableViewDatasource



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[ProjectController sharedInstance].projects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ListCell"];
    }
    
    Project *project = [ProjectController sharedInstance].projects[indexPath.row];
    
    cell.textLabel.text = project.title;
    cell.detailTextLabel.text = project.projectTime;
    
    return cell;
}
@end
