//
//  SingleImageViewController.m
//  HelloCordova
//
//  Created by NKO on 15/4/9.
//
//

#import "SingleImageViewController.h"
#import "CollectionViewController.h"
#import "SingleImage.h"
@interface SingleImageViewController ()


@end

@implementation SingleImageViewController


- (void)viewDidLoad {
//    [SingleImage sharedInstance].changeCurrentIndex = @selector(didReceiveMemoryWarning:);
    SingleImage *singleImage =[SingleImage sharedInstance];
    singleImage.changeImageblock = ^(NSString *imagName){
        self.imageView.image = [UIImage imageNamed:imagName];
        NSLog(@"block call success");
    };
    [super viewDidLoad];
    self.mianScrollView.contentSize = CGSizeMake(self.mianScrollView.frame.size.width * 3, self.mianScrollView.frame.size.height * 4);
    [self.mianScrollView setContentOffset:CGPointMake(self.mianScrollView.frame.size.width, 0)];
    NSLog(@"width:%f----heigit:%f",self.mianScrollView.contentSize.width,self.mianScrollView.contentSize.height);
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:false completion:nil];
}

- (IBAction)thumber:(id)sender {
    CollectionViewController *thumberController = [[CollectionViewController alloc]init];
    [self presentViewController:thumberController animated:true completion:nil];
}

- (IBAction)unwinToHome:(UIStoryboardSegue*)segue {
}
- (IBAction)handleSingleTap:(id)sender {
    if (self.toolBarView.hidden) {
        [self showToolbar:self.toolBarView];
    }else {
        [self hideToolbar:self.toolBarView];
    }
}

- (void)hideToolbar: (UIView*) toolBarView
{

        [UIView animateWithDuration:0.25 delay:0.0
                            options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                         animations:^(void)
         {
             toolBarView.alpha = 0.0f;
         }
                         completion:^(BOOL finished)
         {
             toolBarView.hidden = YES;
         }
         ];
}

- (void)showToolbar: (UIView*) toolBarView
{
        
        [UIView animateWithDuration:0.25 delay:0.0
                            options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                         animations:^(void)
         {
             toolBarView.hidden = NO;
             toolBarView.alpha = 1.0f;
         }
                         completion:NULL
         ];
}
- (BOOL) prefersStatusBarHidden {
    return true;
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scroll");
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"dscroll ecelerating");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -请求数据
- (void)_requestData{
    
    _data = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 12; i++) {
        NSString *imgName = [NSString stringWithFormat:@"%d.jpg",i];
        UIImage *img = [UIImage imageNamed:imgName];
        [_data addObject:img];
        [img release];
    }
    
}

@end
