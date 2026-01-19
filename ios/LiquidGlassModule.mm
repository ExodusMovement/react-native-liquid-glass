#import "LiquidGlassModule.h"

@implementation LiquidGlassModule {
  facebook::react::ModuleConstants<JS::NativeLiquidGlassModule::Constants::Builder> _constants;
  BOOL _constantsInitialized;
}

RCT_EXPORT_MODULE(NativeLiquidGlassModule)

- (void)initializeConstantsIfNeeded
{
  if (_constantsInitialized) {
    return;
  }
  _constantsInitialized = YES;

#if (defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 260000) || \
    (defined(__TV_OS_VERSION_MAX_ALLOWED) && __TV_OS_VERSION_MAX_ALLOWED >= 260000)
  if (@available(iOS 26.0, tvOS 26.0, *)) {
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    BOOL requiresDesignCompatibility = [infoPlist[@"UIDesignRequiresCompatibility"] boolValue];

    _constants = facebook::react::typedConstants<JS::NativeLiquidGlassModule::Constants::Builder>({
      .isLiquidGlassSupported = !requiresDesignCompatibility
    });

    return;
  }
#endif

  _constants = facebook::react::typedConstants<JS::NativeLiquidGlassModule::Constants::Builder>({
    .isLiquidGlassSupported = NO
  });
}

- (facebook::react::ModuleConstants<JS::NativeLiquidGlassModule::Constants::Builder>)constantsToExport
{
  return (facebook::react::ModuleConstants<JS::NativeLiquidGlassModule::Constants::Builder>)[self getConstants];
}

- (facebook::react::ModuleConstants<JS::NativeLiquidGlassModule::Constants::Builder>)getConstants
{
  [self initializeConstantsIfNeeded];
  return _constants;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params {
  return std::make_shared<facebook::react::NativeLiquidGlassModuleSpecJSI>(params);
}

@end
