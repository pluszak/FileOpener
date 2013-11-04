#import "CDVFileOpener.h"
#import <QuartzCore/QuartzCore.h>

@implementation CDVFileOpener

@synthesize controller = docController;

- (void) openFile:(CDVInvokedUrlCommand*)command;
{
    NSString *urlString = [NSString stringWithFormat:@"%@", [command.arguments objectAtIndex:0]];
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    CDVPluginResult* pluginResult = nil;
    
    if (url) {
        docController = [UIDocumentInteractionController interactionControllerWithURL:url];
        [docController setDelegate:self];
        
        CDVViewController* cont = (CDVViewController*)[ super viewController ];
        
        CGRect rect = CGRectMake(cont.view.bounds.size.width / 2 - 1, cont.view.bounds.size.height / 2 - 1, 2, 2);
        BOOL wasOpened = [docController presentOpenInMenuFromRect:rect inView:cont.view animated:YES];
        
        if(wasOpened) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: @""];
        }
        else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No valid app to open the file."];
        }
        
    }
    else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"File URI error"];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	
}

@end
