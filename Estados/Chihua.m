//
//  Chihua.m
//  Estados
//
//  Created by System Administrator on 5/30/16.
//  Copyright (c) 2016 maciel. All rights reserved.
//

#import "Chihua.h"

@interface Chihua ()
@property NSMutableArray *cityTitles;
@property NSMutableArray *cityPhotos;
@property NSMutableArray *cityDetails;


@property NSString *cityTitleSelected;
@property NSString *cityPhotoSelected;
@property NSString *cityDetailsSelected;

@end

@implementation Chihua

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
    
    self.cityTitles   = [[NSMutableArray alloc] initWithObjects: @"Ciudad Juarez", @"Chihuahua", @"Delicias", @"Cuauhtemoc",@"Parral",nil];
    
    self.cityDetails   = [[NSMutableArray alloc] initWithObjects: @"Ciudad Juárez es una ciudad de México situada en el norte del país, en el estado de Chihuahua, a orillas del río Bravo. Al otro lado del río, en territorio estadounidense, se encuentra la ciudad de El Paso.", @"Chihuahua es una ciudad de México. Es capital del estado de Chihuahua. Es la segunda ciudad más grande y poblada del estado. Es la décima cuarta zona metropolitana del país", @"Cuauhtémoc, también conocida como Ciudad Cuauhtémoc es una población del estado mexicano de Chihuahua, es el tercer municipio más poblado del estado, está ubicada en la zona central del mismo", @"Delicias es una ciudad del estado mexicano de Chihuahua, localizada en el centro sur del estado, es un importante centro agrícola; con 118 071 habitantes según el Censo de 2010, es la cuarta ciudad ",@"Hidalgo del Parral es una ciudad de México, ubicada en el sur del estado de Chihuahua, cabecera del municipio del mismo nombre; fue uno de los principales y más ricos centros mineros del Virreinato ",nil];
    
    
    self.cityPhotos   = [[NSMutableArray alloc] initWithObjects: @"juar.jpg", @"chihua.jpg", @"deli.jpg", @"cuau.jpg",@"parr.jpg",nil];
    
    
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
    Chihuacell *cell = (Chihuacell *)[tableView dequeueReusableCellWithIdentifier:@"Chihuacell"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"Chihuacell" bundle:nil] forCellReuseIdentifier:@"Chihuacell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"Chihuacell"];
    }
    //Fill cell with info from arrays
    cell.lblcity.text = self.cityTitles[indexPath.row];
    
    cell.imgcity.image =[UIImage imageNamed:self.cityPhotos[indexPath.row]];
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cityTitleSelected = self.cityTitles[indexPath.row];
    self.cityDetailsSelected = self.cityDetails[indexPath.row];
    self.cityPhotoSelected = self.cityPhotos[indexPath.row];
    
    
    [self performSegueWithIdentifier:@"ChihuaDetails" sender:self];
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
