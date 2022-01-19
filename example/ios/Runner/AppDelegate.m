#import <Flutter/Flutter.h>

#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"


@interface AppDelegate ()

@property (nonatomic, strong) FlutterEngine *engine;

@end

@implementation AppDelegate

- (BOOL)                application:(UIApplication *)application
      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.engine = [[FlutterEngine alloc] initWithName:@"share_engine" project:nil];
    [self.engine runWithEntrypoint:nil];
    
    [GeneratedPluginRegistrant registerWithRegistry:self.engine];
    
    FlutterViewController *flutterVC = [[FlutterViewController alloc] initWithEngine:self.engine nibName:nil bundle:nil];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:flutterVC];
    navVC.navigationBar.hidden = YES;
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navVC;
    [self.window makeKeyAndVisible];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self loadImageInUIImageView];
    });
    return YES;
}

- (void)loadImageInUIImageView {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test"]];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGRect imageFrame = CGRectMake((screenSize.width - 280) / 2, 330, 280, 187);
    imageView.frame = imageFrame;
    
    [self.window addSubview:imageView];
    
    

    UILabel *label = [UILabel new];
    label.text = @"UIImageView";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:16];
    [label sizeToFit];
    CGFloat labelWidth = CGRectGetWidth(label.frame);
    CGFloat labelHeight = CGRectGetHeight(label.frame);
    CGRect labelFrame = CGRectMake((screenSize.width - labelWidth) / 2, 520, labelWidth, labelHeight);
    label.frame = labelFrame;
    
    [self.window addSubview:label];
}

@end
