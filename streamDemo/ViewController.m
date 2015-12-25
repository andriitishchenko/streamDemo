//
//  ViewController.m
//  streamDemo
//
//  Created by Andrii Tishchenko on 25.12.15.
//  Copyright © 2015 Andrii Tishchenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UITextField *textfieldURL;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.webView ope
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)button_gourl_click:(id)sender {
    [self go];
}

-(void)go
{
    [self.textfieldURL resignFirstResponder];
    NSURL*url = [[NSURL alloc] initWithString:self.textfieldURL.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
    [self.webView loadRequest:request];

}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    [textField resignFirstResponder];
    [self go];
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [webView loadHTMLString:[error debugDescription] baseURL:nil];
}

@end
