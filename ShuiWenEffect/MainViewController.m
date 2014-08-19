//
//  MainViewController.m
//  ShuiWenEffect
//
//  Created by Grace Leo on 13-12-19.
//  Copyright (c) 2013年 Grace Leo. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
{
    NSMutableArray * _objects;
}
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.rippleImageName = @"back.jpg";
    [super viewDidLoad];
	self.navigationController.navigationBarHidden = YES;
    [self randomValues];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ID"];
}
#pragma mark - random datasource's values
- (void)randomValues
{
    _objects = [[NSMutableArray alloc]init];
    for (NSUInteger i = 0; i < 50; ++i) {
        [_objects addObject:[NSNumber numberWithInteger:i]];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * strID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strID forIndexPath:indexPath];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    NSNumber *number = _objects[indexPath.row];
    cell.textLabel.text = [number stringValue];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
