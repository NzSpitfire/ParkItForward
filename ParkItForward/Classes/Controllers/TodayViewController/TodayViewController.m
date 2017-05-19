//
//  TodayViewController.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "TodayViewController.h"
#import "TodayCell.h"
#import "ParkingEventModel.h"
#import "DataProvider.h"
#import "MBProgressHUD.h"
#import "ConfirmationViewController.h"
#import "ColorHelper.h"

static NSString *cellIdentifier = @"TodayCell";

@interface TodayViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *leftAvailableSlotsLabel;
@property (nonatomic, strong) NSArray * dataSourceArray;
@property (nonatomic, strong) NSArray * freeSlots;
@property (weak, nonatomic) IBOutlet UIButton *calendarButton;
@property (weak, nonatomic) IBOutlet UIView *topContainer;


@property (nonatomic, weak) id <TodayViewControllerDelegate> delegate;
@end

@implementation TodayViewController

-(instancetype)initWithDelegate:(id<TodayViewControllerDelegate >)delegate{
    self = [super init];
    if (self){
        self.delegate = delegate;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    self.calendarButton.layer.cornerRadius = 5.0f;
    self.calendarButton.backgroundColor = [ColorHelper getTopGradientColor];
    
    self.topContainer.layer.cornerRadius = 5.0f;
    self.topContainer.backgroundColor = [ColorHelper getTopGradientColor];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self fetchBookings];
}
-(void)setupTableView{
    //UINib * nibFile = [UINib nibWithNibName:@"TodayCell" bundle:nil];
    //[self.tableView registerNib:nibFile forCellReuseIdentifier:cellIdentifier];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)updateAvailableSpots{
    if (self.dataSourceArray){
        NSString * text = nil;
        if (self.freeSlots){
            text = [NSString stringWithFormat:@"%ld", [self.freeSlots count]];
        }
        self.leftAvailableSlotsLabel.text = text;
        
    }
}
#pragma mark - UITableView DataSourse Delegate MEthods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numberRows = 0;
    if (self.freeSlots){
        numberRows = [self.freeSlots count];
    }
    return numberRows;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodayCell *cell = (TodayCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TodayCell" owner:self options:nil];
    cell = [nib objectAtIndex:0];
    
    if (self.freeSlots){
        ParkingEventModel * currentModel = self.freeSlots[indexPath.row];
        [cell.lblParkNumber setText:[NSString stringWithFormat:@"%@", currentModel.carSpot]];
        [cell.lblToDate setText:@"All Day"];
    }
    return cell;
}

-(void) fetchBookings{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    __weak typeof(self) weakSelf = self;
    DataProvider * provider = [DataProvider sharedInstance];
    [provider getBookings:^(NSArray * objects){
        [weakSelf hideSpinner];
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.dataSourceArray = [NSArray arrayWithArray:objects];
        strongSelf.freeSlots = [NSArray arrayWithArray: [weakSelf getFreeSlots]];
        [weakSelf updateViews];
    }failure:^(NSError * error){
        [weakSelf hideSpinner];
         __strong typeof(self) strongSelf = weakSelf;
        strongSelf.dataSourceArray  = nil;
        [weakSelf updateViews];
        
    }];
    
}
-(void) hideSpinner{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}
-(void)updateViews{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self updateAvailableSpots];
        });
}
-(NSArray*)getFreeSlots{
    NSArray * resValue = nil;
    NSInteger count = [self.dataSourceArray count];
    NSMutableArray * array = [NSMutableArray array];
    for (NSInteger index =0; index<count; index++){
        ParkingEventModel * currentEvent = self.dataSourceArray[index];
        if (currentEvent.isFree){
            [array addObject:currentEvent];
        }
    }
    if ([array count]>0){
        resValue = [NSArray arrayWithArray:array];
    }
    return resValue;
}
#pragma mark - TableView Delegate Method
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ParkingEventModel * model = self.freeSlots[indexPath.row];
    if ([self.delegate respondsToSelector:@selector(presentConfirmationScreen:)]){
        [self.delegate presentConfirmationScreen:model];
    }
}
- (IBAction)calendarBiuttonPressed:(id)sender {
    if ([self.delegate respondsToSelector:@selector(presentCalendar)]){
        [self.delegate presentCalendar];
    }
}
@end
