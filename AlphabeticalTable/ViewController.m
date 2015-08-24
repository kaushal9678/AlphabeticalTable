//
//  ViewController.m
//  AlphabeticalTable
//
//  Created by mac on 8/24/15.
//  Copyright (c) 2015 vstacks. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview_;

@property (nonatomic,strong)NSMutableArray *arrayOfObjects;
@property (nonatomic,strong)NSMutableArray *arrayOfSections,*arraySorted;

@end

@implementation ViewController

@synthesize arrayOfObjects,arrayOfSections,arraySorted,tableview_;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arrayOfObjects = [NSMutableArray arrayWithObjects:@"Bear", @"Black Swan", @"Buffalo", @"Camel", @"Cockatoo", @"Dog", @"Donkey", @"Emu", @"Giraffe", @"Greater Rhea", @"Hippopotamus", @"Horse", @"Koala", @"Lion", @"Llama", @"Manatus", @"Meerkat", @"Panda", @"Peacock", @"Pig", @"Platypus", @"Polar Bear", @"Rhinoceros", @"Seagull", @"Tasmania Devil", @"Whale", @"Whale Shark", @"Wombat",nil];

    arrayOfSections = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];

    tableview_.dataSource=self;
    tableview_.delegate=self;
    
   // arrayOfSections=[[NSMutableArray alloc]init];
    arraySorted=[[NSMutableArray alloc]init];
    NSMutableArray *arrayListing=[[NSMutableArray alloc]init];
    
     [arraySorted removeAllObjects];
    
    for (int i=0; i< arrayOfSections.count; i++) {
        @autoreleasepool {
            
        NSString *sectionTitle=[arrayOfSections objectAtIndex:i];
        NSMutableArray *arrayListing=[[NSMutableArray alloc]init];
       
        NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
        [dict setObject:sectionTitle forKey:@"headerTitle"];
        
        for (int j=0; j<arrayOfObjects.count; j++) {
            NSMutableArray *arrayList=[[NSMutableArray alloc]init];
            NSString *stringObject=[arrayOfObjects objectAtIndex:j];
             NSString *stringObjectFirstLetter=[stringObject substringToIndex:1];
            
            if ([stringObjectFirstLetter isEqualToString:sectionTitle]) {
                
                [arrayList addObject:stringObject];
                
                }
            [arrayListing addObjectsFromArray:arrayList];

            }
        [dict setObject:arrayListing forKey:@"headerValue"];
        [arraySorted addObject:dict];
    }
    }
    
     

    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return arraySorted.count;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //return arrayOfSections;
     return [arraySorted valueForKey:@"headerTitle"];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString*)title atIndex:(NSInteger)index
{
    //return index;
    return [arraySorted valueForKey:@"headerTitle"];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //return [arrayOfSections objectAtIndex:section];
    return [[arraySorted objectAtIndex:section] objectForKey:@"headerTitle"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
     return [[[arraySorted objectAtIndex:section] objectForKey:@"headerValue"] count] ;
    //return arrayOfObjects.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text =[[[arraySorted objectAtIndex:indexPath.section] objectForKey:@"headerValue"]
                          objectAtIndex:indexPath.row]; //[arrayOfObjects objectAtIndex:indexPath.row];
    return cell;
}
@end
