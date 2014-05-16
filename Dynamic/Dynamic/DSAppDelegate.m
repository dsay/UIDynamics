#import "DSAppDelegate.h"

#import "DSViewController.h"
#import "DSSecondViewController.h"
#import "DSSimpleCollectionViewController.h"

@implementation DSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    1
//    self.viewController = [[DSViewController alloc] initWithNibName:@"DSViewController"
//                                                             bundle:nil];
    
//    2
//    self.viewController = [[DSSecondViewController alloc] initWithNibName:@"DSSecondViewController"
//                                                                   bundle:nil];
   
//    3
    self.viewController = [[DSSimpleCollectionViewController alloc] initWithNibName:@"DSSimpleCollectionViewController"
                                                                             bundle:nil];
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
