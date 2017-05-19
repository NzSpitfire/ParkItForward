//
//  CalendarViewController.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "CalendarViewController.h"
#import "FSCalendar.h"
#import "MBProgressHUD.h"
#import "TodayCell.h"
#import "ParkingEventModel.h"
#import "DataProvider.h"

static NSString * const cellIdentifier = @"cell";
static NSString * const kGetBookings1 = @"http://demo0788157.mockable.io/booking1";
static NSString * const kGetBookings2 = @"http://demo0788157.mockable.io/booking2";
static NSString * const kGetBookings3 = @"http://demo0788157.mockable.io/booking3";
static NSString * const kGetBookings4 = @"http://demo0788157.mockable.io/booking4";

static int counter = 0;

@interface CalendarViewController () <FSCalendarDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet FSCalendar *calendarView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray * freeSlots;
@property (nonatomic, strong) NSArray * dataSourceArray;

@property (nonatomic, weak) id <TodayViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *fullyBookedContainer;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) BOOL isFirstLoad;

@end

@implementation CalendarViewController

-(instancetype)initWithDelegate:(id<TodayViewControllerDelegate>)delegate{
    self = [super init];
    if (self){
        self.delegate = delegate;
        self.fullyBookedContainer.hidden = YES;
        self.isFirstLoad = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2;
    self.imageView.clipsToBounds = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self fetchBookings];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)calendar:(FSCalendar *)calendar
   didSelectDate:(NSDate *)date
 atMonthPosition:(FSCalendarMonthPosition)monthPosition{
    
  
    [self fetchBookings];
}

#pragma  mark DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numberRows = 0;
    if (self.freeSlots){
        self.fullyBookedContainer.hidden = YES;
        numberRows = [self.freeSlots count];
    }
    if (numberRows==0){
        if (self.isFirstLoad){
            self.fullyBookedContainer.hidden = YES;
        }else {
            self.fullyBookedContainer.hidden = NO;
        }
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
        [cell.lblParkNumber setText:[NSString stringWithFormat:@"Slot : %@", currentModel.carSpot]];
        [cell.lblToDate setText:@"All Day"];
    }
    return cell;
}

-(void) fetchBookings{
    self.isFirstLoad = NO;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    __weak typeof(self) weakSelf = self;
    DataProvider * provider = [DataProvider sharedInstance];
    NSString * url = nil;
    if (counter%4==0){
        url = kGetBookings1;
    }else if (counter%4==1){
        url = kGetBookings2;
    }
    else if (counter%4==2){
        url = kGetBookings3;
    }else if (counter%4==3){
        url = kGetBookings4;
    }
    [provider getBookings:url
             successBlock:^(NSArray * objects){
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
      counter++;
    
}
-(void) hideSpinner{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}
-(void)updateViews{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];

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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ParkingEventModel * model = self.freeSlots[indexPath.row];
    if ([self.delegate respondsToSelector:@selector(presentConfirmationScreen:)]){
        [self.delegate presentConfirmationScreen:model];
    }
}
@end
