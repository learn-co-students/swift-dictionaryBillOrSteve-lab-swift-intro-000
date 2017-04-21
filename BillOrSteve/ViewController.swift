//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var lblFact: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var btnSteve: UIButton!
    @IBOutlet weak var btnBill: UIButton!
    
    
    // Create your stored properties here
    
    var billAndSteveFacts: [String: [String]] = [:]
    var correctPerson: String = ""
    var score: Int = 0
    var done: Int = 0
    var max: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    func createFacts() {
        var billFacts: [String] = []
        var steveFacts: [String] = []
        
        steveFacts.append("He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.")
        steveFacts.append("Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.")
        steveFacts.append("He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.")
        steveFacts.append("He was a pescetarian, meaning he ate no meat except for fish.")
        
        billFacts.append("He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.")
        billFacts.append("He scored 1590 (out of 1600) on his SATs.")
        billFacts.append("His foundation spends more on global health each year than the United Nation's World Health Organization.")
        billFacts.append("The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.")
        billFacts.append("In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss.")
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
        
        for (_, facts) in billAndSteveFacts {
            max += facts.count
        }
    }
    
    func getRandomFact() -> (String, String) {
        let person = randomPerson()
        let index = randomIndex(fromArray: billAndSteveFacts[person]!)
        let fact = billAndSteveFacts[person]?[index]
        billAndSteveFacts[person]?.remove(at: index)
        
        return (person, fact!)
    }
    
    // actions 
    @IBAction func guessSteve(_ sender: Any) {
        if correctPerson == "Steve Jobs" {
            hit()
        }
        showFact()
    }
    @IBAction func guessBill(_ sender: Any) {
        if correctPerson == "Bill Gates" {
            hit()
        }
        showFact()
    }
    
    func showFact() {
        if done < max {
            let fact = getRandomFact()
            correctPerson = fact.0
            lblFact.text = fact.1
            done += 1
            lblScore.text = String(score) + " / " + String(done-1)
        } else if done == max {
            lblScore.text = String(score) + " / " + String(done)
        }
        
    }
    
    func hit() {
        if done <= max {
            score += 1
        }
    }

    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        if billAndSteveFacts["Steve Jobs"]?.count == 0 {
            return "Bill Gates"
        } else if billAndSteveFacts["Bill Gates"]?.count == 0 {
            return "Steve Jobs"
        }
        
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
}
