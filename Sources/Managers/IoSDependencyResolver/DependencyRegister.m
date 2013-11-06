
#import "DependencyRegister.h"
#import "DependencyResolver+Register.h"

@implementation DependencyRegister
+ (void)registerDependencies {
  NSString *registerMapDefinitionPath
  = [[NSBundle mainBundle]
     pathForResource:@"DependencyMapDefinition"
     ofType:@"plist"];
  NSDictionary *registerMapDefinition 
  = [NSDictionary dictionaryWithContentsOfFile:registerMapDefinitionPath];
  
  NSArray *protocolsStrings = [registerMapDefinition allKeys];
  for (NSString *protocolName in protocolsStrings) {
    Protocol *protocol = NSProtocolFromString(protocolName);
    Class class 
    = NSClassFromString([registerMapDefinition objectForKey:protocolName]);
    [DependencyResolver addClass:class
                     forProtocol:protocol];
  }
}
@end