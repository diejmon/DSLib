

#pragma mark - include
#import "DSWebServiceArrayParam.h"
#import "DSWebServiceStringParam.h"

#pragma mark - private
@interface DSWebServiceArrayParam()
@property (nonatomic, strong) NSMutableArray *params;
@end

@implementation DSWebServiceArrayParam
@synthesize params = _params;
@synthesize userInfo = _userInfo;
@synthesize embeddedIndex = _embeddedIndex;

- (id)init
{
  self = [super init];
  if (self) {
    _params = [NSMutableArray array];
    _embeddedIndex = DSWebServiceParamEmbeddedIndexNotSet;
  }
  return self;
}

- (id<DSWebServiceParam>)stringParamWithValue:(NSString *)theValue
                                    paramName:(NSString *)theName
{
  id<DSWebServiceParam> stringParam = [[DSWebServiceStringParam alloc] init];
  
  [stringParam addStringValue:theValue forParamName:theName];
  
  return stringParam;
}

- (id<DSWebServiceParam>)addStringValue:(NSString *)theValue
                           forParamName:(NSString *)theParamName
{
  if (theValue == nil) theValue = @"";    
  
  id<DSWebServiceParam> param = [self stringParamWithValue:theValue
                                                 paramName:theParamName];
  [self addParam:param forParamName:theParamName];

  return param;
}

- (NSArray *)paramNames
{
  NSAssert(FALSE, @"Use enumerate methods");
  return nil;
}

- (NSArray *)stringParamNames
{
  NSAssert(FALSE, @"Use enumerate methods");
  return nil;
}

- (NSString *)stringValueForParamName:(NSString *)theParam
{
  NSAssert(FALSE, @"Use enumerate methods instead");
  return nil;
}

- (void)enumerateParamsAndParamNamesWithBlock:(void (^)(id<DSWebServiceParam> theParam, NSString *theParamName))theBlock
{
  for (id<DSWebServiceParam> param in [self params]) {
    theBlock(param, nil);
  }
}

- (void)
enumerateStringValuesAndParamNamesWithBlock:(void(^)(NSString *theParam, NSString *theValue))theBlock
{
  [self enumerateParamsAndParamNamesWithBlock:^(id<DSWebServiceParam> param, NSString *paramName) {
    if ([param isKindOfClass:[DSWebServiceStringParam class]] == YES) {
      NSString *value = [param stringValueForParamName:paramName];
      if (value) {
        theBlock(paramName, value);
      }
    }
  }];
}

- (void)addParam:(id<DSWebServiceParam>)theParam
    forParamName:(NSString *)theParamName
{
  //It is array and theParamName is discarded
  [[self params] addObject:theParam];
}

- (id<DSWebServiceParam>)paramForParamName:(NSString *)theParamName
{
  NSAssert(FALSE, @"Use enumerate methods instead");
  return nil;
}

- (DSWebServiceParamType)paramType
{
  return DSWebServiceParamTypeArray;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@", [self params]];
}

//===========================================================
//  Keyed Archiving
//
//===========================================================
- (void)encodeWithCoder:(NSCoder *)encoder
{
  [encoder encodeObject:self.params forKey:@"params"];
  [encoder encodeInteger:self.embeddedIndex forKey:@"embeddedIndex"];
  [encoder encodeObject:self.userInfo forKey:@"userInfo"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
  self = [super init];
  if (self) {
    self.params = [decoder decodeObjectForKey:@"params"];
    self.embeddedIndex = [decoder decodeIntegerForKey:@"embeddedIndex"];
    self.userInfo = [decoder decodeObjectForKey:@"userInfo"];
  }
  return self;
}
@end
