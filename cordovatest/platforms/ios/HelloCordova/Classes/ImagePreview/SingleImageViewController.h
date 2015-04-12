//
//  SingleImageViewController.h
//  HelloCordova
//
//  Created by NKO on 15/4/9.
//
//

#import <UIKit/UIKit.h>

@interface SingleImageViewController : UIViewController<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapRecognizer;
@property (weak, nonatomic) IBOutlet UIScrollView *mianScrollView;
@property (weak, nonatomic) IBOutlet UIView *toolBarView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) NSMutableArray *data;
@end
