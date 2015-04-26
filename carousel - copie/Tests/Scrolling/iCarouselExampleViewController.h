#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import <Social/Social.h>


@interface iCarouselExampleViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) IBOutlet iCarousel *carousel;

- (IBAction)share:(id)sender;
- (IBAction)reload:(id)sender;

@end
