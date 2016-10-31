def can_build(plat):
	return plat == "iphone"

def configure(env):

		#env.disable_module()
	if env['platform'] == "iphone":
		env.Append(FRAMEWORKPATH=['modules/gomob/ios/lib'])
		env.Append(LINKFLAGS=['-ObjC', '-framework','AdSupport', '-framework','AudioToolbox', '-framework','AVFoundation', '-framework','CoreGraphics', '-framework','CoreMedia', '-framework','CoreTelephony', '-framework','EventKit', '-framework','EventKitUI', '-framework','MediaPlayer', '-framework','MessageUI', '-framework','StoreKit', '-framework','SystemConfiguration', '-framework','SafariServices', '-framework','CoreBluetooth', '-framework','CoreMotion', '-framework','AssetsLibrary', '-framework','CoreData', '-framework','CoreLocation', '-framework','CoreText', '-framework','ImageIO', '-framework','OpenGLES', '-framework', 'GLKit', '-framework','CoreVideo', '-framework', 'MobileCoreServices', '-framework', 'GoogleMobileAds'])
