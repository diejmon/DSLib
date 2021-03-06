
#import <Foundation/Foundation.h>

@class DSMessage;
@class DSAlertButton;


@interface DSAlert: NSObject

@property (nonatomic, strong, readonly) DSAlertButton *cancelButton;
@property (nonatomic, strong, readonly) NSArray *otherButtons;
@property (nonatomic, strong, readonly) DSMessage *message;

- (id)initWithMessage:(DSMessage *)theMessage
         cancelButton:(DSAlertButton *)theCancelButton
         otherButtons:(DSAlertButton *)theButtons, ... NS_REQUIRES_NIL_TERMINATION;

- (NSString *)localizedTitle;
- (NSString *)localizedBody;

- (BOOL)isAlertMessageEqualWith:(id)theObj;

@end
