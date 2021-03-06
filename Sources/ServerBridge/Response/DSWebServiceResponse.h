
#import <Foundation/Foundation.h>
#import "DSMacros.h"
#import "DSDynamicPropertyObject.h"

@class DSMessage;

@interface DSWebServiceResponse : DSDynamicPropertyObject

@property (nonatomic, strong, readonly) NSData *data;
- (instancetype)initWithData:(NSData *)theData DS_DESIGNATED_INIT;
+ (instancetype)responseWithData:(NSData *)theData;

@property (nonatomic, strong, readonly) NSString *path;
- (instancetype)initWithPath:(NSString *)path DS_DESIGNATED_INIT;
+ (instancetype)responseWithPath:(NSString *)path DS_DESIGNATED_INIT;

- (instancetype)initWithResponse:(DSWebServiceResponse *)response DS_DESIGNATED_INIT;
+ (instancetype)responseWithResponse:(DSWebServiceResponse *)response;

- (BOOL)parse;

- (NSDictionary *)responseDictionary;

@end

@interface DSWebServiceResponse (Abstract)
- (BOOL)isServerResponse;

- (BOOL)isSuccessfulResponse;

- (NSString *)errorCode;
- (DSMessage *)APIErrorMessage;
@end
