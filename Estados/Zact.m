//
//  Zact.m
//  Estados
//
//  Created by System Administrator on 5/30/16.
//  Copyright (c) 2016 maciel. All rights reserved.
//

#import "Zact.h"

@interface Zact ()
@property NSMutableArray *cityTitles;
@property NSMutableArray *cityPhotos;
@property NSMutableArray *cityDetails;


@property NSString *cityTitleSelected;
@property NSString *cityPhotoSelected;
@property NSString *cityDetailsSelected;@end

@implementation Zact

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
    
    self.cityTitles   = [[NSMutableArray alloc] initWithObjects: @"Zacatecas", @"Jerez", @"Fresnillo", @"Villanueva",@"Rio Grande",nil];
    
    self.cityDetails   = [[NSMutableArray alloc] initWithObjects: @"En México, la ciudad de Zacatecas es la capital del estado de Zacatecas, fundada el 8 de septiembre de 1546 a partir del descubrimiento de las ricas minas de plata por Juan de Tolosa", @"Jerez de García Salinas es la cabecera municipal del municipio de Jerez en el estado mexicano de Zacatecas. Se encuentra ubicado en el centro del estado, a 56 km al sudoeste de la ciudad de Zacatecas", @"Fresnillo de González Echeverría, o simplemente Ciudad de Fresnillo, es la cabecera municipal del municipio de Fresnillo,", @"Villanueva es una población del estado de Zacatecas, México. Se encuentra y es la cabecera municipal del Municipio de Villanueva",@"Río Grande es la cuarta ciudad más grande del Estado de Zacatecas, México; y la tercera aglomeración más importante tanto económica como políticamente.",nil];
    
    
    self.cityPhotos   = [[NSMutableArray alloc] initWithObjects: @"zac.jpg", @"jer.jpg", @"fres.jpg", @"vill.jpg",@"rio.jpg",nil];
    
    
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
    Zactcell *cell = (Zactcell *)[tableView dequeueReusableCellWithIdentifier:@"Zactcell"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"Zactcell" bundle:nil] forCellReuseIdentifier:@"Zactcell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"Zactcell"];
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
    
    
    [self performSegueWithIdentifier:@"ZactDetails" sender:self];
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
