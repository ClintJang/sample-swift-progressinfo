# Apple's ProcessInfo Class
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/clintjang/JWSBoltsSwiftSample/blob/master/LICENSE) [![Swift 4](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://swift.org) 
- [ProcessInfo](https://developer.apple.com/documentation/foundation/processinfo) : The process information agent can return information such as arguments, environment variables, host name, and process name. The processInfo class method returns the shared agent for the current process—that is, the process whose object sent the message. For example, the following line returns the NSProcessInfo object, which then provides the name of the current process
- (ProcessInfo는 인수, 환경 변수, 호스트 이름 및 프로세스 이름과 같은 정보를 리턴 할 수 있습니다. 활용 요소가 많습니다. 활용한다면?)
- iOS 2.0+

# Information
Let's take a look at the processInfo of swift. This is a sample source and description.


# Samples 
> Using the method of sending Arguments when running the app, try to test how to build the conditions in the build test, and check how to output the keys.
>> It can be set in run, so it does not apply to archive. So it is useful for testing.

sources
- ViewController.swift
<pre>
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Samples Case 01
        useArgumentsPassedOnLaunch()
        
        // Samples Case 02
        printProcessInfoEnvironmentKeyAndValue()
        
    }
    
    func useArgumentsPassedOnLaunch() {
        // TEST Setting 1
        if ProcessInfo.processInfo.arguments.contains("TEST_SELF_VIEW_BACKGROUND_COLOR") {
            self.view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
        
        // TEST Setting 2
        if ProcessInfo.processInfo.arguments.contains("TEST_SELF_LABEL_TEXT") {
            testLabel.text = "TEST"
        }
    }
    
    func printProcessInfoEnvironmentKeyAndValue() {
        // View key and value log
        for (key, value) in ProcessInfo.processInfo.environment {
            print(">>>> \(key): \(value)")
        }
    }
</pre>

## Samples Case 01
> Use "Arguments Passed On Launch"
>> 1. It seems to be a convenient way to actually use it. By modifying the checks of the Arguments of the schema without modifying the code, you can see the changes and options given in the development.
>> 2. It is better to use it with the "active compilation flag".

Arguments Setting
<table style="width:100%">
  <tr>
	<th>Setting (1/2)</th> 
	<th>Setting (2/2)</th> 
  </tr>
  <tr>
  	<td><img width="295" height="138" src="/Image/ArgumentsSetting01.png"></img></td>
    <td><img width="582" height="239" src="/Image/ArgumentsSetting02.png"></img></td>
  </tr>
</table>

### Result
- If nothing is set
<table style="width:100%">
  <tr>
	<th>Arguments Setting</th> 
	<th>Viewing</th> 
  </tr>
  <tr>
  	<td><img width="350" height="120" src="/Image/ArgumentsCaseSetting01.png"></img></td>
    <td><img width="250" height="500" src="/Image/ArgumentsCase01.png"></img></td>
  </tr>
</table>

- First set test
<table style="width:100%">
  <tr>
	<th>Arguments Setting</th> 
	<th>Viewing</th> 
  </tr>
  <tr>
  	<td><img width="350" height="120" src="/Image/ArgumentsCaseSetting02.png"></img></td>
    <td><img width="250" height="500" src="/Image/ArgumentsCase02.png"></img></td>
  </tr>
</table>

- second set test
<table style="width:100%">
  <tr>
	<th>Arguments Setting</th> 
	<th>Viewing</th> 
  </tr>
  <tr>
  	<td><img width="350" height="120" src="/Image/ArgumentsCaseSetting03.png"></img></td>
    <td><img width="250" height="500" src="/Image/ArgumentsCase03.png"></img></td>
  </tr>
</table>

- last set test
<table style="width:100%">
  <tr>
	<th>Arguments Setting</th> 
	<th>Viewing</th> 
  </tr>
  <tr>
  	<td><img width="350" height="120" src="/Image/ArgumentsCaseSetting04.png"></img></td>
    <td><img width="250" height="500" src="/Image/ArgumentsCase04.png"></img></td>
  </tr>
</table>

## Samples Case 02
> Let's see what information is output by key and value.
- run function
<pre>
    func printProcessInfoEnvironmentKeyAndValue() {
        // View key and value log
        for (key, value) in ProcessInfo.processInfo.environment {
            print(">>>> \(key): \(value)")
        }
    }
</pre>

- print result (in simulator:iPhone 8 Plus)
<pre>
>>>> __XPC_DYLD_FRAMEWORK_PATH: /Users/clintjang/Library/Developer/Xcode/DerivedData/JWSProcessInfoSample-evdzffmjhsdbdkdsqjhqkkphmnjc/Build/Products/Debug-iphonesimulator
>>>> DYLD_ROOT_PATH: /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot
>>>> SIMULATOR_AUDIO_DEVICES_PLIST_PATH: /Users/clintjang/Library/Developer/CoreSimulator/Devices/6A2A94FC-74F0-47AC-847A-5F583E63430D/data/var/run/com.apple.coresimulator.audio.plist
>>>> SIMULATOR_MAINSCREEN_WIDTH: 1242
>>>> IPHONE_SHARED_RESOURCES_DIRECTORY: /Users/clintjang/Library/Developer/CoreSimulator/Devices/6A2A94FC-74F0-47AC-847A-5F583E63430D/data
>>>> SIMULATOR_AUDIO_SETTINGS_PATH: /Users/clintjang/Library/Developer/CoreSimulator/Devices/6A2A94FC-74F0-47AC-847A-5F583E63430D/data/var/run/simulatoraudio/audiosettings.plist
>>>> DYLD_LIBRARY_PATH: /Users/clintjang/Library/Developer/Xcode/DerivedData/JWSProcessInfoSample-evdzffmjhsdbdkdsqjhqkkphmnjc/Build/Products/Debug-iphonesimulator:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib/system/introspection
>>>> SIMULATOR_MAINSCREEN_SCALE: 3.000000
>>>> DYLD_FALLBACK_FRAMEWORK_PATH: /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/Frameworks
>>>> SIMULATOR_MEMORY_WARNINGS: /Users/clintjang/Library/Developer/CoreSimulator/Devices/6A2A94FC-74F0-47AC-847A-5F583E63430D/data/var/run/memory_warning_simulation
>>>> CLASSIC: 0
>>>> SIMULATOR_MAINSCREEN_HEIGHT: 2208
>>>> SIMULATOR_HID_SYSTEM_MANAGER: /Library/Developer/PrivateFrameworks/CoreSimulator.framework/Resources/Platforms/iphoneos/Library/Frameworks/SimulatorHID.framework
>>>> IPHONE_SIMULATOR_ROOT: /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot
>>>> XPC_SIMULATOR_LAUNCHD_NAME: com.apple.CoreSimulator.SimDevice.6A2A94FC-74F0-47AC-847A-5F583E63430D
>>>> XPC_FLAGS: 0x0
>>>> SIMULATOR_DEVICE_NAME: iPhone 8 Plus
>>>> XPC_SERVICE_NAME: UIKitApplication:kr.co.clintjang.JWSProcessInfoSample[0xd43f][19064]
>>>> SIMULATOR_LEGACY_ASSET_SUFFIX: iphone
>>>> SIMULATOR_RUNTIME_VERSION: 11.2
>>>> SIMULATOR_LOG_ROOT: /Users/clintjang/Library/Logs/CoreSimulator/6A2A94FC-74F0-47AC-847A-5F583E63430D
>>>> PATH: /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/bin:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/bin:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/sbin:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/sbin:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/local/bin
>>>> TESTMANAGERD_SIM_SOCK: /private/tmp/com.apple.launchd.0kywxbpXsL/com.apple.testmanagerd.unix-domain.socket
>>>> SIMULATOR_SHARED_RESOURCES_DIRECTORY: /Users/clintjang/Library/Developer/CoreSimulator/Devices/6A2A94FC-74F0-47AC-847A-5F583E63430D/data
>>>> SIMULATOR_VERSION_INFO: CoreSimulator 494.33 - Device: iPhone 8 Plus - Runtime: iOS 11.2 (15C107) - DeviceType: iPhone 8 Plus
>>>> SIMULATOR_RUNTIME_BUILD_VERSION: 15C107
>>>> SIMULATOR_CAPABILITIES: /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/DeviceTypes/iPhone 8 Plus.simdevicetype/Contents/Resources/capabilities.plist
>>>> NSUnbufferedIO: YES
>>>> SIMULATOR_MAINSCREEN_PITCH: 461.000000
>>>> HOME: /Users/clintjang/Library/Developer/CoreSimulator/Devices/6A2A94FC-74F0-47AC-847A-5F583E63430D/data/Containers/Data/Application/132D6DCC-2A9F-4EC4-AD68-354B521C2207
>>>> OS_ACTIVITY_DT_MODE: YES
>>>> SIMULATOR_MODEL_IDENTIFIER: iPhone10,5
>>>> IOS_SIMULATOR_SYSLOG_SOCKET: /private/tmp/com.apple.CoreSimulator.SimDevice.6A2A94FC-74F0-47AC-847A-5F583E63430D/syslogsock
>>>> IPHONE_TVOUT_EXTENDED_PROPERTIES: /Users/clintjang/Library/Developer/CoreSimulator/Devices/6A2A94FC-74F0-47AC-847A-5F583E63430D/data/Library/Application Support/Simulator/extended_display.plist
>>>> TMPDIR: /Users/clintjang/Library/Developer/CoreSimulator/Devices/6A2A94FC-74F0-47AC-847A-5F583E63430D/data/Containers/Data/Application/132D6DCC-2A9F-4EC4-AD68-354B521C2207/tmp
>>>> CUPS_SERVER: /private/tmp/com.apple.launchd.Mi4ALE40dE/Listeners
>>>> __XPC_DYLD_LIBRARY_PATH: /Users/clintjang/Library/Developer/Xcode/DerivedData/JWSProcessInfoSample-evdzffmjhsdbdkdsqjhqkkphmnjc/Build/Products/Debug-iphonesimulator
>>>> SIMULATOR_HOST_HOME: /Users/clintjang
>>>> SIMULATOR_BOOT_TIME: 1521107015
>>>> SIMULATOR_PRODUCT_CLASS: D21
>>>> SIMULATOR_EXTENDED_DISPLAY_PROPERTIES: /Users/clintjang/Library/Developer/CoreSimulator/Devices/6A2A94FC-74F0-47AC-847A-5F583E63430D/data/Library/Application Support/Simulator/extended_display.plist
>>>> DYLD_FALLBACK_LIBRARY_PATH: /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib
>>>> SIMULATOR_UDID: 6A2A94FC-74F0-47AC-847A-5F583E63430D
>>>> DYLD_FRAMEWORK_PATH: /Users/clintjang/Library/Developer/Xcode/DerivedData/JWSProcessInfoSample-evdzffmjhsdbdkdsqjhqkkphmnjc/Build/Products/Debug-iphonesimulator
>>>> __XCODE_BUILT_PRODUCTS_DIR_PATHS: /Users/clintjang/Library/Developer/Xcode/DerivedData/JWSProcessInfoSample-evdzffmjhsdbdkdsqjhqkkphmnjc/Build/Products/Debug-iphonesimulator
>>>> SIMULATOR_ROOT: /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot
>>>> CFFIXED_USER_HOME: /Users/clintjang/Library/Developer/CoreSimulator/Devices/6A2A94FC-74F0-47AC-847A-5F583E63430D/data/Containers/Data/Application/132D6DCC-2A9F-4EC4-AD68-354B521C2207

</pre>
