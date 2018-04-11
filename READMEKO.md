# Apple's ProcessInfo Class
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/clintjang/sample-swift-progressinfo/blob/master/LICENSE) [![Swift 4](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://swift.org) 
- [ProcessInfo](https://developer.apple.com/documentation/foundation/processinfo) : 프로세스 정보 에이전트는 인수, 환경 변수, 호스트 이름 및 프로세스 이름과 같은 정보를 리턴 할 수 있습니다. processInfo 클래스 메소드는 현재 프로세스 (즉, 객체가 메시지를 보낸 프로세스)에 대한 공유 에이전트를 반환합니다.
- 활용 요소가 많습니다. 활용한다면?
- iOS 2.0+

# Information
swift의 processInfo에 대해 알아보겠습니다. 테스트 해본 셈플과 설명입니다.


# Samples 
> 개발 중 빌드를 많이 합니다. 그때마다 내가 원하는 속성의 분기 처리를 코드 레벨에서 변경하는 것도 좋은 방법이지만 아래 셈플 01과 같은 방법이 있습니다. 

> 오브젝티드 씨에서는 전처리문(컴파일 이전에 미리 처리될 수 있는..)이 있어서 Test URL 분기라던가, 테스트 시에만 보이게 하고 싶은 설정들의 분기가 잘 이용만 하면 편리했는 데, Swift는 그런 부분이 조금 아쉬웠습니다... 
> (active compilation flag.. 등등 기타 유용한 다른 방법도 많이 있습니다.)
>> 셈플 01은 배포(아카이브) 시에는 적용이 안되니 주의하세요~. 테스트에 무척 유용합니다.
>> 셈플 02는 어떤 키와 값들이 있는 지 로그를 찍고 결과 정보를 확인해 보았습니다.

소스
- ViewController.swift
```swift
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
```

## 셈플 01 : Run 빌드시 Arguments를 이용하는 방법
> "Arguments Passed On Launch" 사용해 봅시다.
>> 1. 개발 빌드 전, 원하는 옵션을 체크하고 빌드를 하면 손쉽게 옵션을 적용해서 빌드할 수 있습니다. 
>> 2. 아래는 그 방법이 설명되어있습니다. 

Arguments 설정은 어떻게?
<table style="width:100%">
  <tr>
	<th>설정 순서 1번째 (1/2)</th> 
	<th>설정 순서 2번째 (2/2)<br>여기서 Arguments를 추가하고 체크하세요.</th> 
  </tr>
  <tr>
  	<td><img width="295" height="138" src="/Image/ArgumentsSetting01.png"></img></td>
    <td><img width="582" height="239" src="/Image/ArgumentsSetting02.png"></img></td>
  </tr>
</table>

### 결과 : 셈플 소스의 결과입니다. 
> 셈플소스를 다운받아 실행해서 체크를 바꿔보며 확인해 보세요~

- 모든 체크를 하지 않은 경우
> 변경된 것이 없습니다.
<table style="width:100%">
  <tr>
	<th>Arguments 설정</th> 
	<th>실행 화면</th> 
  </tr>
  <tr>
  	<td><img width="350" height="120" src="/Image/ArgumentsCaseSetting01.png"></img></td>
    <td><img width="250" height="500" src="/Image/ArgumentsCase01.png"></img></td>
  </tr>
</table>

- 첫번째 옵션 체크한 경우
> 글자만 테스트로 변경되었네요~ 
<table style="width:100%">
  <tr>
	<th>Arguments 설정</th> 
	<th>실행 화면</th> 
  </tr>
  <tr>
  	<td><img width="350" height="120" src="/Image/ArgumentsCaseSetting02.png"></img></td>
    <td><img width="250" height="500" src="/Image/ArgumentsCase02.png"></img></td>
  </tr>
</table>

- 두번째 옵션 체크한 경우
> 배경만 바뀌었네요.
<table style="width:100%">
  <tr>
	<th>Arguments 설정</th> 
	<th>실행 화면</th> 
  </tr>
  <tr>
  	<td><img width="350" height="120" src="/Image/ArgumentsCaseSetting03.png"></img></td>
    <td><img width="250" height="500" src="/Image/ArgumentsCase03.png"></img></td>
  </tr>
</table>

- 모두 체크한 경우
> 배경과 글자가 모두 바뀌었습니다. 

<table style="width:100%">
  <tr>
	<th>Arguments 설정</th> 
	<th>실행 화면</th> 
  </tr>
  <tr>
  	<td><img width="350" height="120" src="/Image/ArgumentsCaseSetting04.png"></img></td>
    <td><img width="250" height="500" src="/Image/ArgumentsCase04.png"></img></td>
  </tr>
</table>

## 셈플 02 : ProcessInfo에서 이용할 수 있는 키와 값을 보고 싶었어요~
> 어떤 정보들을 확인 할 수 있는 지 로그를 찍어보았습니다. 
- 로그 실행 함수는 아래와 같습니다.
```swift
    func printProcessInfoEnvironmentKeyAndValue() {
        // View key and value log
        for (key, value) in ProcessInfo.processInfo.environment {
            print(">>>> \(key): \(value)")
        }
    }
```

- 결과 출력 : iPhone 8 Plus 시뮬레이터에서 실행했습니다.
```
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

```
