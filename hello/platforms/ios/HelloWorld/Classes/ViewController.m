//
//  ViewController.m
//  HelloWorld
//
//  Created by NKO on 15/3/18.
//
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollVIew;

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIImageView *iconVIew2;

@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pichRecognizer;
@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *rotationRecongnizer;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panRecognizer;

@property double lastScale;
@end

@implementation ViewController

NSUInteger _w;
NSUInteger _h;
int _curImageViewNum;
CGFloat _preOption;
NSMutableArray * _imageViews;

- (void)viewDidLoad {
    [super viewDidLoad];
    _w = [UIScreen mainScreen].applicationFrame.size.width;
    _h = [UIScreen mainScreen].applicationFrame.size.height;
    self.scrollVIew.frame = CGRectMake(0, 0, _w, _h);
    self.scrollVIew.contentSize = CGSizeMake(_w * 2, 0);
    self.scrollVIew.showsHorizontalScrollIndicator = NO;
    self.scrollVIew.pagingEnabled = YES;
    NSLog(@"width is:%lu",(unsigned long)_w);
    NSLog(@"hight is:%lu",(unsigned long)_h);
    _imageViews = [[NSMutableArray alloc] init];
    self.iconView.frame = CGRectMake(0, 0, _w, _h);
    self.iconVIew2.frame = CGRectMake(_w * 2, 0, _w, _h);
    [_imageViews addObject:self.iconView];
    [_imageViews addObject:self.iconVIew2];
    // Do any additional setup after loading the view from its nib.
    //旋转
//    [self.rotationRecongnizer addTarget:self action:@selector(gestureView:)];
    [self.pichRecognizer addTarget:self action:@selector(pickView:)];
//    [self.panRecognizer addTarget:self action:@selector(panView:)];
}

-(void)pickView:(UIPinchGestureRecognizer*)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        _lastScale = 1.0;
        return;
    }
    CGFloat scale = 1.0 - (_lastScale - [gesture scale]);
    
    CGAffineTransform currentTransform = self.iconView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    
    [self.iconView setTransform:newTransform];
    
    _lastScale = [gesture scale];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _curImageViewNum = scrollView.contentOffset.x / _w;
    
    if (scrollView.contentOffset.x == _curImageViewNum*_w) {
        _preOption = scrollView.contentOffset.x;
    } else if (scrollView.contentOffset.x < _preOption) {
        if (_curImageViewNum % 2) {
            UIImageView * imv = _imageViews[1];
            imv.frame = CGRectMake(_curImageViewNum*_w, 0, _w, _h);
//            imv.image = [UIImage imageNamed:_imageArray[_curImageViewNum]];
        } else {
            UIImageView * imv = _imageViews[0];
            imv.frame = CGRectMake(_curImageViewNum*_w, 0, _w, _h);
//            imv.image = [UIImage imageNamed:_imageArray[_curImageViewNum]];
        }
        
        return;
    }
    
    if (scrollView.contentOffset.x >= _curImageViewNum*_w) {
        if (scrollView.contentOffset.x < 2*_w-_w) {
            if (_curImageViewNum % 2) {
                UIImageView * imv = _imageViews[0];
                imv.frame = CGRectMake(_curImageViewNum*_w+_w, 0, _w, _h);
//                imv.image = [UIImage imageNamed:_imageArray[_curImageViewNum+1]];
            } else {
                UIImageView * imv = _imageViews[1];
                imv.frame = CGRectMake(_curImageViewNum*_w+_w, 0, _w, _h);
//                imv.image = [UIImage imageNamed:_imageArray[_curImageViewNum+1]];
            }
        }
    }
}

// 处理拖拉手势
- (void) panView:(UIPanGestureRecognizer *)panGestureRecognizer
{
//    UIView *view = panGestureRecognizer.view;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [panGestureRecognizer translationInView:self.iconView.superview];
        [self.iconView setCenter:(CGPoint){self.iconView.center.x + translation.x, self.iconView.center.y + translation.y}];
        [panGestureRecognizer setTranslation:CGPointZero inView:self.iconView.superview];
    }
}
-(void)gestureView:(UIRotationGestureRecognizer*)gesture {
    //旋转的弧度：gesture.rotation
    NSLog(@"旋转事件，旋转的弧度为:%1f",gesture.rotation);
    
    if(gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
        self.iconView.transform = CGAffineTransformRotate(self.iconView.transform,gesture.rotation);
    }
    [gesture setRotation:(0)];
}


@end
