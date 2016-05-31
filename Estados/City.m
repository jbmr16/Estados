//
//  City.m
//  Estados
//
//  Created by System Administrator on 5/30/16.
//  Copyright (c) 2016 maciel. All rights reserved.
//

#import "City.h"

@interface City ()
@property NSMutableArray *cityTitles;
@property NSMutableArray *cityPhotos;
@property NSMutableArray *cityDetails;


@property NSString *cityTitleSelected;
@property NSString *cityPhotoSelected;
@property NSString *cityDetailsSelected;
@end

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
    
    
    
    self.cityTitles   = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"Zapopan", @"Tlaquepaque", @"Ocotlan",@"Puerto Vallarta",nil];

    self.cityDetails   = [[NSMutableArray alloc] initWithObjects: @"Guadalajara es una ciudad y municipio mexicano, capital y urbe más poblada del estado de Jalisco.", @"Zapopan is a city and municipality located in the Mexican state of Jalisco. Part of the Guadalajara Metropolitan Area", @"San Pedro Tlaquepaque es una ciudad y municipio del Estado de Jalisco, con una población de 608,114 habitantes", @"Ocotlán es una ciudad del estado de Jalisco en México. Es considerada como la capital de los muebles del país",@"Enamórate de Puerto Vallarta, Jalisco, un destino donde encontrarás hermosas playas, sitios históricos, diversión y bellezas naturales",nil];
    
    
    self.cityPhotos   = [[NSMutableArray alloc] initWithObjects: @"gdl.jpg", @"zpn.jpg", @"tlq.jpg", @"oct.jpg",@"ptov.jpg",nil];
    
    
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
    self.cityDetailsSelected = self.cityDetails[indexPath.row];
    self.cityPhotoSelected = self.cityPhotos[indexPath.row];
    
    
    [self performSegueWithIdentifier:@"CityDetails" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
       if ([segue.destinationViewController isKindOfClass:[CityDetails class]]) {
           CityDetails *destination     = [segue destinationViewController];
           destination.CityName        = self.cityTitleSelected;
           destination.CityPhoto        = self.cityPhotoSelected;
           destination.CityDetails = self.cityDetailsSelected;
      }
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
