#import "iCarouselExampleViewController.h"


@implementation iCarouselExampleViewController


- (IBAction)stop
{
    self.carousel.scrollOffset = self.carousel.scrollOffset;
}

- (void)dealloc
{
    self.carousel.delegate = nil;
    self.carousel.dataSource = nil;
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //configure carousel
    self.carousel.type = iCarouselTypeCoverFlow;
    
    //scroll to fixed offset
    [self.carousel scrollToItemAtIndex:5 animated:NO];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    NSArray *buttonImage=[[NSArray alloc] initWithObjects:
                          [UIImage imageNamed:@"lisieres.jpg"],
                          [UIImage imageNamed:@"insulaire.jpg"],
                          [UIImage imageNamed:@"etranger.jpg"],
                          [UIImage imageNamed:@"dublin.jpg"],
                          [UIImage imageNamed:@"daybreak.jpg"],nil];
    return [buttonImage count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    NSArray *buttonImage=[[NSArray alloc] initWithObjects:
                          [UIImage imageNamed:@"lisieres.jpg"],
                          [UIImage imageNamed:@"insulaire.jpg"],
                          [UIImage imageNamed:@"etranger.jpg"],
                          [UIImage imageNamed:@"dublin.jpg"],
                          [UIImage imageNamed:@"daybreak.jpg"],nil];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 230, 400);
    
    [button setImage:(UIImage*)[buttonImage objectAtIndex:index] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:[NSString stringWithFormat:@"%li", (long)index] forState:UIControlStateNormal];

    return button;
    view = [[UIImageView alloc] initWithFrame:CGRectMake(30, 80, 230.0f, 400.0f)];
    
    view = [[UIView alloc] init];
    view.contentMode = UIViewContentModeScaleAspectFit;
    CGRect rec = view.frame;
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
    {
        rec.size.width = 250;
        rec.size.height = 250;
    }
    view.frame = rec;
    UIImageView *iv;
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
    {
        iv=[[UIImageView alloc]initWithFrame:CGRectMake(30, 80, 230, 400)];
    }
    NSString *temp=[buttonImage objectAtIndex:index];
    iv.image=[UIImage imageNamed:temp];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    
    
    [view addSubview:iv];
    return view;
}

#pragma mark -
#pragma mark Button tap event

- (void)buttonTapped:(UIButton *)sender
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 180)];
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lisieres.jpg"]];
    image.frame = CGRectMake(0, 0, 180, 180);
   
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 180)];
    UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"insulaire.jpg"]];
    image1.frame = CGRectMake(0, 0, 180, 180);
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 180)];
    UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"etranger.jpg"]];
    image2.frame = CGRectMake(0, 0, 180, 180);
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 180)];
    UIImageView *image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dublin.jpg"]];
    image3.frame = CGRectMake(0, 0, 180, 180);
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 180)];
    UIImageView *image4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"daybreak.jpg"]];
    image4.frame = CGRectMake(0, 0, 180, 180);
    
    NSInteger index = [self.carousel indexOfItemViewOrSubview:sender];
    
     UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton addTarget:self action:@selector(aMethod) forControlEvents:UIControlEventTouchDown];
    closeButton.backgroundColor = [UIColor clearColor];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"close_button.png"] forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(0, 80, 30, 30);
    
    switch(index) {
        case 0:
            view.opaque = true;
            view.backgroundColor = [UIColor clearColor];
            view.backgroundColor = [UIColor grayColor];
            [self.view addSubview:image];
            [self.view addSubview:closeButton];
            break;
       case 1:
            view1.opaque = true;
            view1.backgroundColor = [UIColor clearColor];
            view1.backgroundColor = [UIColor grayColor];
            [self.view addSubview:image1];
            [self.view addSubview:closeButton];
          break;
        case 2:
            view2.opaque = true;
            view2.backgroundColor = [UIColor clearColor];
            view2.backgroundColor = [UIColor grayColor];
            [self.view addSubview:image2];
            [self.view addSubview:closeButton];
            break;
        case 3:
            view3.opaque = true;
            view3.backgroundColor = [UIColor clearColor];
            view3.backgroundColor = [UIColor grayColor];
            [self.view addSubview:image3];
            [self.view addSubview:closeButton];
            break;
        case 4:
            view4.opaque = true;
            view4.backgroundColor = [UIColor clearColor];
            view4.backgroundColor = [UIColor grayColor];
            [self.view addSubview:image4];
            [self.view addSubview:closeButton];
            break;
    }

}



- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            return YES;
        }
        default:
        {
            return value;
        }
    }
}


- (void)carouselWillBeginDragging:(iCarousel *)carousel
{
	NSLog(@"Carousel will begin dragging");
}

- (void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate
{
	NSLog(@"Carousel did end dragging and %@ decelerate", decelerate? @"will": @"won't");
}

- (void)carouselWillBeginDecelerating:(iCarousel *)carousel
{
	NSLog(@"Carousel will begin decelerating");
}

- (void)carouselDidEndDecelerating:(iCarousel *)carousel
{
	NSLog(@"Carousel did end decelerating");
}

- (void)carouselWillBeginScrollingAnimation:(iCarousel *)carousel
{
	NSLog(@"Carousel will begin scrolling");
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
	NSLog(@"Carousel did end scrolling");
}


- (IBAction)share:(id)sender {
    UIActionSheet *sharingSheet = [[UIActionSheet alloc] initWithTitle:@"Share"
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                destructiveButtonTitle:nil
                                                     otherButtonTitles:@"Tweet",
                                   @"Share on Facebook", nil];
    [sharingSheet showInView:self.view];
}

- (IBAction)reload:(id)sender {
    [self.carousel reloadData];
    self.carousel.scrollToItemBoundary = NO;
    [self.carousel scrollByOffset:4.5 duration:0.0];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            NSLog(@"Tweet Button Pressed.");
            SLComposeViewController *tweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [tweet setInitialText:@"text"];
            [tweet setCompletionHandler:^(SLComposeViewControllerResult result)
             {
                 if (result == SLComposeViewControllerResultCancelled)
                 {
                     NSLog(@"The user cancelled.");
                 }
                 else if (result == SLComposeViewControllerResultDone)
                 {
                     NSLog(@"The user sent the tweet");
                 }
             }];
            [self presentViewController:tweet animated:YES completion:nil];
        }
            
        case 1:
        {
            SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            
            [controller setInitialText:@"post"];
            [controller addImage:[UIImage imageNamed:@"share.jpg"]];
            
            [self presentViewController:controller animated:YES completion:Nil];
        }
    }
}

@end
