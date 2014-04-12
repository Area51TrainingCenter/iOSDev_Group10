//
//  FlyckrCollectionViewController.m
//  MiJSONApp
//
//  Created by Diego Cruz on 9/04/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "FlyckrCollectionViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface FlyckrCollectionViewController ()

@end

@implementation FlyckrCollectionViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    misFotos = [NSMutableArray array];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSURLRequest *miRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.flickr.com/services/feeds/photos_public.gne?tags=avengers&format=json&jsoncallback=?"]];
    
    AFHTTPRequestOperation *operacion = [[AFHTTPRequestOperation alloc] initWithRequest:miRequest];
    
    
    [operacion setResponseSerializer:[AFJSONResponseSerializer serializer]];
    operacion.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/x-javascript"];
    
    [operacion setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //[responseObject isKindOfClass:[NSArray class]]
        
       NSArray *items  = responseObject[@"items"];
        
        for (NSDictionary *soyItem in items) {
            
            PhotoObject *nuevaFoto = [[PhotoObject alloc] init];
            nuevaFoto.titulo = soyItem[@"title"];
            nuevaFoto.urlString = soyItem[@"media"][@"m"];
            
            [misFotos addObject:nuevaFoto];
        }
        
        
        [self.collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error! : %@",error.description);
        
    }];
    
    [[NSOperationQueue mainQueue] addOperation:operacion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(int)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(int)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return misFotos.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    
    PhotoObject *soyObjeto = misFotos[indexPath.row];
    [cell.photoView setImageWithURL:[NSURL URLWithString:soyObjeto.urlString]];
    
    
    return cell;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
