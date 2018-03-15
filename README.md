# Sample ProcessInfo
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/clintjang/JWSBoltsSwiftSample/blob/master/LICENSE) [![Swift 4](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://swift.org) 
- [ProcessInfo](https://developer.apple.com/documentation/foundation/processinfo) : The process information agent can return information such as arguments, environment variables, host name, and process name. The processInfo class method returns the shared agent for the current process—that is, the process whose object sent the message. For example, the following line returns the NSProcessInfo object, which then provides the name of the current process
- (ProcessInfo는 인수, 환경 변수, 호스트 이름 및 프로세스 이름과 같은 정보를 리턴 할 수 있습니다. 활용 요소가 많습니다. 활용한다면?)
- iOS 2.0+

# Information
Let's take a look at the processInfo of swift. This is a sample source and description.


# Samples 
> Using the method of sending Arguments when running the app, try to test how to build the conditions in the build test, and check how to output the keys.

## Samples Case 01
> Use "Arguments Passed On Launch"

sources
- ViewController.swift
<pre>
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TEST Case 1
        if ProcessInfo.processInfo.arguments.contains("TEST_SELF_VIEW_BACKGROUND_COLOR") {
            self.view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
        
        // TEST Case 2
        if ProcessInfo.processInfo.arguments.contains("TEST_SELF_LABEL_TEXT") {
            testLabel.text = "TEST"
        }
        
        // View key and value log
        for (key, value) in ProcessInfo.processInfo.environment {
            print(">>>> \(key): \(value)")
        }
    }
</pre>

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
> Log


... Testing
