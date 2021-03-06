
#import <Foundation/Foundation.h>
#import "DSAlertViewDelegate.h"

@class DSAlert;
@class Reachability;
@class DSAlertsQueue;

#define DSAlertsHandler_SHOW_NO_INTERNET_CONNECTION_POPUPS_ONCE 1

@interface DSAlertsHandler: NSObject<DSAlertViewDelegate>

@property (nonatomic, weak) Reachability *reachability;
@property (nonatomic, strong) NSArray *filterOutMessages;

+ (id)sharedInstance;

- (void)showAlert:(DSAlert *)theAlert modally:(BOOL)isModalAlert;

- (DSAlertsQueue *)detachAlertsQueue;

@end
