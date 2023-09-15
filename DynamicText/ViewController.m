//
//  ViewController.m
//  DynamicText
//
//  Created by Ion Sebastian Rodriguez Lara on 14/09/23.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController
- (IBAction)checkForRed:(UITextField *)sender {
    NSString *lowercased = [sender.text lowercaseString];
    NSArray *strings = [lowercased componentsSeparatedByString:@"red"];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:sender.text];
    NSMutableArray *ranges = [NSMutableArray new];
    NSRange searchRange = NSMakeRange(0, [lowercased length]);
    while (searchRange.location != NSNotFound) {
        searchRange = [lowercased rangeOfString:@"red" options:0 range:searchRange];
        if (searchRange.location != NSNotFound) {
            [ranges addObject:[NSValue valueWithRange:searchRange]];
            searchRange = NSMakeRange(NSMaxRange(searchRange), [lowercased length] - NSMaxRange(searchRange));
        }
    }
    for(NSValue *rangeValue in ranges)
    {
        NSRange range = [rangeValue rangeValue];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    }
    sender.attributedText = attributedString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
