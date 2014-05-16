#import "DSViewController.h"

@interface DSViewController ()<UIDynamicAnimatorDelegate>

@property (nonatomic, strong) UIDynamicAnimator * animator;
@property (nonatomic, strong) IBOutlet UIView   * redView;
@property (nonatomic, strong) IBOutlet UIView   * greenView;

- (IBAction)startAnimation:(id)sender;
- (IBAction)stopAnimation:(id)sender;

@end

@implementation DSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.animator.delegate = self;
}

- (void)dynamicAnimatorWillResume:(UIDynamicAnimator*)animator;
{
    NSLog(@"Resume");
}

- (void)dynamicAnimatorDidPause:(UIDynamicAnimator*)animator
{
    NSLog(@"Pouse");
}

- (IBAction)stopAnimation:(id)sender
{
    [self.animator removeAllBehaviors];
}


//Gravity
//- (void)startAnimation:(id)sender
//{
//    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[self.redView]];
//    [gravity setGravityDirection:CGVectorMake(.0f, 1.f)];
//    [self.animator addBehavior:gravity];
//}

//Collision
//- (void)startAnimation:(id)sender
//{
//    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[self.redView]];
//    [gravity setGravityDirection:CGVectorMake(.0f, 1.f)];
//    [self.animator addBehavior:gravity];
//    
//    UICollisionBehavior *collision =
//    [[UICollisionBehavior alloc] initWithItems:@[ self.redView ]];
//    [collision setTranslatesReferenceBoundsIntoBoundary:YES];
//    [self.animator addBehavior:collision];
//}

//Attachment
//- (void)startAnimation:(id)sender
//{
//    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[self.redView]];
//    [gravity setGravityDirection:CGVectorMake(.0f, 1.f)];
//    [self.animator addBehavior:gravity];
////
////    UICollisionBehavior *collision =
////    [[UICollisionBehavior alloc] initWithItems:@[ self.redView ]];
////    [collision setTranslatesReferenceBoundsIntoBoundary:YES];
////    [self.animator addBehavior:collision];
////    
//    CGPoint point = CGPointMake(160.0, 0.0);
//    UIAttachmentBehavior *attachment;
//    attachment = [[UIAttachmentBehavior alloc] initWithItem:self.redView
//                                           offsetFromCenter:UIOffsetMake(10, 50) attachedToAnchor:point];
////    attachment = [[UIAttachmentBehavior alloc] initWithItem:self.redView
////                                            attachedToAnchor:point];
//    attachment.length = 200.0f;
//    attachment.damping = 0.8f;
//    attachment.frequency = 1.0f;
//    
//    [self.animator addBehavior:attachment];
//}

//Snap
//- (void)startAnimation:(id)sender
//{
//    CGPoint point1 = CGPointMake(200.0, 300.0);
//    UISnapBehavior *snap;
//    snap = [[UISnapBehavior alloc] initWithItem:self.redView snapToPoint:point1];
//    [snap setDamping:0.4];//defoult 0.5  <-> [0:1]
//    [self.animator addBehavior:snap];
//}

//Push
//- (void)startAnimation:(id)sender
//{
//    UICollisionBehavior *collision =
//    [[UICollisionBehavior alloc] initWithItems:@[ self.redView, self.greenView]];
//    [collision setTranslatesReferenceBoundsIntoBoundary:YES];
//    [self.animator addBehavior:collision];
//
//    UIDynamicItemBehavior *dynamicItem = [[UIDynamicItemBehavior alloc]initWithItems:@[self.greenView]];
//    dynamicItem.elasticity = 0.9;
//    dynamicItem.allowsRotation = YES;
//    [collision addChildBehavior:dynamicItem];
//    
//    UIPushBehavior *push = [[UIPushBehavior alloc]initWithItems:@[self.redView] mode:UIPushBehaviorModeContinuous];
//    [push setPushDirection:CGVectorMake(1.0, 5.0)];
//    [self.animator addBehavior:push];
//}


@end
