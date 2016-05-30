//
//  City.m
//  Estados
//
//  Created by System Administrator on 5/30/16.
//  Copyright (c) 2016 maciel. All rights reserved.
//

#import "City.h"

@interface City ()
@property NSMutableArray *cityTitles0;
@property NSMutableArray *cityTitles1;
@property NSMutableArray *cityTitles2;
@property NSMutableArray *cityTitles3;
@property NSMutableArray *cityTitles4;


@property NSMutableArray *cityPhotos;
@property NSString *cityTitleSelected;
@property NSString *cityPhotoSelected;@end

@implementation City

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      [self initController];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    
    
    
    self.cityTitles0   = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"Zapopan", @"Tlaquepaque", @"Ocotlan",@"La Barca",nil];
    self.cityTitles1   = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"Zapopan", @"Tlaquepaque", @"Ocotlan",@"La Barca",nil];
        self.cityTitles2   = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"Zapopan", @"Tlaquepaque", @"Ocotlan",@"La Barca",nil];
        self.cityTitles3   = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"Zapopan", @"Tlaquepaque", @"Ocotlan",@"La Barca",nil];
        self.cityTitles4   = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"Zapopan", @"Tlaquepaque", @"Ocotlan",@"La Barca",nil];
    
    
    
    
    self.cityPhotos   = [[NSMutableArray alloc] initWithObjects: @"gdl.png", @"zpn.png", @"tlq.png", @"oct.png",@"lbc.jpg",nil];
    
    
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cityTitles.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellcity *cell = (cellcity *)[tableView dequeueReusableCellWithIdentifier:@"cellcity"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellcity" bundle:nil] forCellReuseIdentifier:@"cellcity"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellcity"];
    }
    //Fill cell with info from arrays
    cell.lblcity.text = self.cityTitles[indexPath.row];
    
    cell.imgCity.image =[UIImage imageNamed:self.cityPhotos[indexPath.row]];
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cityTitleSelected = self.cityTitles[indexPath.row];
    
    self.cityPhotoSelected = self.cityPhotos[indexPath.row];
    
    
    [self performSegueWithIdentifier:@"CityDetails" sender:self];
}









/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
