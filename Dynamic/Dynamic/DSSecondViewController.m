#import "DSSecondViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DSSecondViewController ()<UICollisionBehaviorDelegate>

@property (nonatomic, strong) UIDynamicAnimator   * animator;
@property (nonatomic, strong) IBOutlet UIView     * alertView;
@property (nonatomic, strong) NSMutableArray      * positions;
@property (nonatomic, assign) CGRect                startRect;

- (IBAction)startAnimation:(id)sender;
- (IBAction)hideAnimation:(id)sender;
- (IBAction)stopAnimation:(id)sender;

@end

@implementation DSSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    
    CGRect rect = self.alertView.frame;
    rect.origin.y = - CGRectGetHeight(rect);
    self.alertView.frame = rect;
    
    self.alertView.layer.cornerRadius = 5;
//    self.alertView.layer.masksToBounds = YES;
    
    self.positions = [NSMutableArray new];
    for (UIView *view in self.alertView.subviews){
        [self.positions addObject:[NSValue valueWithCGRect:view.frame]];
    }

    self.startRect = self.alertView.frame;
}

- (IBAction)stopAnimation:(id)sender
{
    [self.animator removeAllBehaviors];

    NSUInteger i = 0;
     for (UIView *view in self.alertView.subviews){
         view.frame =  [(NSValue *)self.positions[i] CGRectValue];
         i++;
     }
    
    self.alertView.layer.affineTransform = CGAffineTransformMakeRotation(2*M_PI);
    self.alertView.frame = self.startRect;

}

- (IBAction)startAnimation:(id)sender
{
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[self.alertView]];
    [gravity setGravityDirection:CGVectorMake(.0f, 1.f)];
    
    UIDynamicItemBehavior *item = [[UIDynamicItemBehavior alloc]initWithItems:@[self.alertView]];
    item.elasticity = 0.5;
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:@[self.alertView]];
    collision.collisionDelegate = self;
    
    CGFloat boundaryY = CGRectGetHeight(self.view.frame) / 2 + CGRectGetHeight(self.alertView.frame) / 2;
    [collision addBoundaryWithIdentifier:@"center"
                               fromPoint:CGPointMake(0, boundaryY)
                                 toPoint:CGPointMake(320, boundaryY)];

    [self.animator addBehavior:item];
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

- (IBAction)hideAnimation:(id)sender
{
    [self.animator removeAllBehaviors];
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[self.alertView]];
    [gravity setGravityDirection:CGVectorMake(.0f, 1.f)];
    [self.animator addBehavior:gravity];
    
    CGPoint point = self.alertView.frame.origin;
    point.y += CGRectGetHeight(self.alertView.frame) / 2;
    
    UIAttachmentBehavior *attachment;
    attachment = [[UIAttachmentBehavior alloc] initWithItem:self.alertView
                                           offsetFromCenter:UIOffsetMake(- CGRectGetWidth(self.alertView.frame) / 2,0)
                                           attachedToAnchor:point];
    
    [attachment setLength:0.0f];
    [attachment setFrequency:1000];
    [attachment setDamping:0.3];
    
    for (UIView *view in self.alertView.subviews) {
        if (![view isKindOfClass:[UIImageView class]]) {
            [gravity addItem:view];
        }
    }
    double delayInSeconds = 2.1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.animator removeBehavior:attachment];
    });
    [self.animator addBehavior:attachment];
}

@end
