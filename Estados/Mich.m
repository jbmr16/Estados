//
//  Mich.m
//  Estados
//
//  Created by System Administrator on 5/30/16.
//  Copyright (c) 2016 maciel. All rights reserved.
//

#import "Mich.h"

@interface Mich ()
@property NSMutableArray *cityTitles;
@property NSMutableArray *cityPhotos;
@property NSMutableArray *cityDetails;


@property NSString *cityTitleSelected;
@property NSString *cityPhotoSelected;
@property NSString *cityDetailsSelected;

@end

@implementation Mich

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      [self initController];   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initController {

self.cityTitles   = [[NSMutableArray alloc] initWithObjects: @"Morelia", @"Zamora", @"Lazaro Cardenas", @"Patzcuaro",@"Apatzingan",nil];

self.cityDetails   = [[NSMutableArray alloc] initWithObjects: @"Morelia (de 1545 a 1828, Valladolid) es una ciudad mexicana, capital del estado de Michoacán de Ocampo y cabecera del municipio homónimo", @"El Municipio de Zamora así como la cabecera del área urbana que lleva su nombre: Zona Metropolitana de Zamora es una de las 56 zonas metropolitanas", @"Lázaro Cárdenas es la cabecera de uno de los 113 municipios que conforman al estado de Michoacán, ubicado al sur del estado, justo en la frontera", @"Pátzcuaro (en purépecha P'askwarho /Pʰáskʷaɽo/) es una ciudad del estado mexicano de Michoacán. En la antigüedad era parte del señorío",@"Apatzingán de la Constitución es una ciudad mexicana ubicada en el estado de Michoacán de Ocampo. Es cabecera del municipio de Apatzingán y se locali",nil];


self.cityPhotos   = [[NSMutableArray alloc] initWithObjects: @"mor.jpg", @"zam.jpg", @"laz.jpg", @"patz.jpg",@"apatz.jpg",nil];


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
    Michcell *cell = (Michcell *)[tableView dequeueReusableCellWithIdentifier:@"Michcell"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"Michcell" bundle:nil] forCellReuseIdentifier:@"Michcell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"Michcell"];
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
    
    
    [self performSegueWithIdentifier:@"MichDetails" sender:self];
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
