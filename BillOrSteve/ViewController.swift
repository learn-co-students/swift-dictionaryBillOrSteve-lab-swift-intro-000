//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var randomFact: UILabel!
    @IBOutlet weak var steveJobsPortrait: UIButton!
    @IBOutlet weak var billGatesPortrait: UIButton!
    @IBOutlet weak var correctCounter: UILabel!
    @IBOutlet weak var wrongCounter: UILabel!
    
    var billAndSteveFacts: [String : [String]] = [:]
    
    override func viewDidLoad() {
        createFacts()
        super.viewDidLoad()
    }
    
    // Helper Functions
    func createFacts() {
        let steveFacts = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shoed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he at no meat except for fish."
        ]
        
        let billFacts = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
        ]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }
    
    @IBAction func answerGuessed(_ sender: UIButton) {
        switch sender {
        case billGatesPortrait:
            print("Bill Represent!")
        case steveJobsPortrait:
            print("Steve Represent!")
        default:
            print("Try Again")
        }
        getRandomFact()
    }
    
    func getRandomFact() -> (String, String) {
        randomFact.text =
        
        
        print("getRandomFact() Activated")
        return ("Yo", "Yo")
    }
    
    // uses randomPerson to grab a person, pulls out the key(name of person)
    // key points to the array within dict to pull a random quote by randomIndex
    // returns them both
    
    func showFact() {
//        var correctPerson: String = ""
//        var guessedCorrect = 0
//        var guessedWrong = 0
    }
    
    // TODO:
    // upon click of either portrait:
    // = shows the fact
    // = updates the counter if it was wrong
    // When the random person is received here, correctPerson becomes that and pull the fact with that key
    // When the correct person is tapped and it matches comparison to correctPerson or not, update the score
    // getRandomFact goes into this func
    
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
