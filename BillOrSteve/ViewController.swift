//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //UI
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var steveBtn: UIButton!
    @IBOutlet weak var billBtn: UIButton!
    
    //UI Fuctions
    @IBAction func steveBtnAction(_ sender: Any) {
        if correctPerson == "Steve Jobs" {
            scoreTracker += 1
            showFact()
        } else {
            scoreTracker -= 1
            showFact()
        }
    
    }
    
    @IBAction func billBtnAction(_ sender: Any) {
        if correctPerson == "Bill Gates" {
            scoreTracker += 1
            showFact()
        } else {
            scoreTracker -= 1
            showFact()
        }
        
    }
    
    
    // Create your stored properties here
    var peopleFacts: [String: [String]] = [:]
    var correctPerson: String = ""
    var fact: String = ""
    var scoreTracker: Int = 0
    
    // Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
        score.text = String(scoreTracker)
    }
    
    func showFact() {
        (correctPerson, fact) = getRandomFact()
        print(fact)
        
        factLabel.text = fact
        score.text = String(scoreTracker)
    }
    
    func createFacts() {
        let steveFacts = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."
        ]
        
        let billFacts = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        
        peopleFacts.updateValue(billFacts, forKey: "Bill Gates")
        peopleFacts.updateValue(steveFacts, forKey: "Steve Jobs")
    }
    
    func getRandomFact() -> (String, String) {
        let person = randomPerson()
        let factIndex = randomIndex(fromArray: peopleFacts[person]!)
        
        return (person, peopleFacts[person]![factIndex])
        
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
