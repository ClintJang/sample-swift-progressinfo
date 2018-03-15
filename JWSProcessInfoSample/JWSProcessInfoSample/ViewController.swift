//
//  ViewController.swift
//  JWSProcessInfoSample
//
//  Created by Clint on 2018. 3. 15..
//  Copyright © 2018년 clint. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
}

