//
//  ViewController1.m
//  HelloCordova
//
//  Created by NKO on 15/4/8.
//
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (IBAction)close:(id)sender {
     [self dismissViewControllerAnimated:false completion:nil];
}

- (IBAction)unwinToHome:(UIStoryboardSegue*)segue {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
