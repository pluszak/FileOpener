#import <Cordova/CDV.h>

@interface CDVFileOpener : CDVPlugin <UIDocumentInteractionControllerDelegate>{}

@property(nonatomic, strong) UIDocumentInteractionController *controller;

- (void) openFile: (CDVInvokedUrlCommand*)command;

@end
