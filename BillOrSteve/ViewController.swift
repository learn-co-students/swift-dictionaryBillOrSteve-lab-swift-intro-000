//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create your stored properties here
    var facts: [String: [String]] = [:]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
    }
    
    
    
    
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    func createFacts() {
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization."]
        let steveFacts = ["He was a pescetarian, meaning he ate no meat except for fish.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font."]
        facts["Bill Gates"] = billFacts
        facts["Steve Jobs"] = steveFacts
        
    }
    func getRandomFact() -> (String, String) {
        randomPerson()
    }
}
