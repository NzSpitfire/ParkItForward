//
//  TodayViewController.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "TodayViewController.h"
#import "TodayCell.h"

static NSString *cellIdentifier = @"TodayCell";

@interface TodayViewController () <UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    // Do any additional setup after loading the view from its nib.
}
-(void)setupTableView{
    //UINib * nibFile = [UINib nibWithNibName:@"TodayCell" bundle:nil];
    //[self.tableView registerNib:nibFile forCellReuseIdentifier:cellIdentifier];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableView DataSourse Delegate MEthods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numberRows = 30;
    return numberRows;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodayCell *cell = (TodayCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TodayCell" owner:self options:nil];
    cell = [nib objectAtIndex:0];
    [cell.lblParkNumber setText:@"Park #"];
    [cell.lblToDate setText:@"All Day"];
    
    return cell;
}
@end
