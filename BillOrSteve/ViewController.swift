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
    var billAndSteveFacts: [String : [String]] = [:]
    var theFact: (String, String) = ("","")
    var result = 0
    
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var billButoom: UIButton!
    @IBOutlet weak var steveButtom: UIButton!
    
    @IBAction func steveAction(_ sender: Any) {
        if theFact.0 == "Steve Jobs" {
            result += 1
            resultLabel.text = "\(String(result))/9"
            var tempArray = billAndSteveFacts["Steve Jobs"]!
            tempArray = tempArray.filter{$0 != theFact.1}
            billAndSteveFacts["Steve Jobs"] = tempArray
        
        }
        showFact()
    }
    
    @IBAction func billAction(_ sender: Any) {
        if theFact.0 == "Bill Gates" {
            result += 1
            resultLabel.text = "\(String(result))/9"
            var tempArray = billAndSteveFacts["Bill Gates"]!
            tempArray = tempArray.filter{$0 != theFact.1}
            billAndSteveFacts["Bill Gates"] = tempArray
        }
        showFact()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
        resultLabel.text = String(result)
        
        
    }
    
    func showFact() {
        if result == 9 {
            billButoom.isEnabled = false
            steveButtom.isEnabled = false
            factLabel.text = "Congratulation you have Won!!"
        } else {

        theFact = getRandomFact()
        factLabel.text = theFact.1
        }
            }
    
    func createFacts() {
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                         "He scored 1590 (out of 1600) on his SATs.",
                         "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                         "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                         "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                          "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                          "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                          "He was a pescetarian, meaning he ate no meat except for fish."]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }
    
    
    func getRandomFact() -> (String, String) {
        let person = randomPerson()
        let factsArray = billAndSteveFacts[person]!
        if factsArray != [] {
            let index = randomIndex(fromArray: factsArray)
            let fact = factsArray[index]
        
        return (person, fact)
        
        } else if person == "Steve Jobs" {
            
           let factsArray = billAndSteveFacts["Bill Gates"]!
                
                let index = randomIndex(fromArray: factsArray)
                let fact = factsArray[index]
                
                return ("Bill Gates", fact)
                
        } else {
                let factsArray = billAndSteveFacts["Steve Jobs"]!
                    
                    let index = randomIndex(fromArray: factsArray)
                    let fact = factsArray[index]
                    
                    return ("Steve Jobs", fact)
            
        }
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
    
}
