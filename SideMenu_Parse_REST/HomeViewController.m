//
//  HomeViewController.m
//  SideMenu_Parse_REST
//
//  Created by Kvana Mac Pro 2 on 1/29/16.
//  Copyright © 2016 Narendra. All rights reserved.
//

#import "HomeViewController.h"
#import <AFNetworking.h>
@interface HomeViewController ()

@end

@implementation HomeViewController{
    UITextView *textView;

}

- (void)viewDidLoad {
    [super viewDidLoad];

    textView=[[UITextView alloc] initWithFrame:CGRectMake(50, 40, 200, 150)];
    textView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:textView];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(100, 250, 50, 50)];
    button.backgroundColor=[UIColor redColor];
    [button setTitle:@"Click" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(saveToParse) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)saveToParse{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"APPLICATION_KEY" forHTTPHeaderField:@"X-Parse-Application-Id"];
    [manager.requestSerializer setValue:@"REST_KEY" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    NSString *url=@"https://api.parse.com/1/classes/notes";
    [manager POST:url parameters:@{@"noteType":@"passwords",@"conetnt":textView.text} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)slideNavigationControllerShouldDisplayLeftMenu{
    return YES;
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
