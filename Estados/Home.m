//
//  ViewController.m
//  Estados
//
//  Created by System Administrator on 5/30/16.
//  Copyright (c) 2016 maciel. All rights reserved.
//

#import "Home.h"

@interface Home ()
@property NSMutableArray *stateTitles;
@property NSMutableArray *statePhotos;
@property NSString *stTitleSelected;
@property NSString *stPhotoSelected;

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initController];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initController {
    self.stateTitles   = [[NSMutableArray alloc] initWithObjects: @"Jalisco", @"Michoacan", @"Zacatecas", @"Sinaloa",@"Chihuahua",nil];
    self.statePhotos   = [[NSMutableArray alloc] initWithObjects: @"jal.png", @"mich.png", @"zac.png", @"sin.png",@"chi.jpg",nil];



}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stateTitles.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellHome *cell = (cellHome *)[tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellHome" bundle:nil] forCellReuseIdentifier:@"cellHome"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    }
    //Fill cell with info from arrays
    cell.lblState.text = self.stateTitles[indexPath.row];

    cell.imgState.image =[UIImage imageNamed:self.statePhotos[indexPath.row]];
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.stTitleSelected = self.stateTitles[indexPath.row];

    self.stPhotoSelected = self.statePhotos[indexPath.row];
    
    
    [self performSegueWithIdentifier:@"CitySelect" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[City class]]) {
        City *destination     = [segue destinationViewController];
        destination.stateTitle        = self.stTitleSelected;
        
    }
 }

@end
