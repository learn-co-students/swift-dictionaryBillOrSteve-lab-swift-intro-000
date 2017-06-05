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
    var billAndSteveFacts : [String: [String]] = [:]
    
    //outlet
    @IBOutlet weak var scoreOutlet: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    @IBOutlet weak var steveJobs: UIButton!
    @IBOutlet weak var billGates: UIButton!
    @IBOutlet weak var guessAns: UILabel!
   
    var score = 0
    var answer: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFact()
        nextQues()
    }
    
    //create fact
    func createFact(){
        
        let billGatesFacts =
        [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "He scored 1590 (out of 1600) on his SATs.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss"
        ]
        
        let steveJobsFacts =
        [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."
        ]
        
        billAndSteveFacts["Bill Gates"] = billGatesFacts
        billAndSteveFacts["Steve Jobs"] = steveJobsFacts
        
    }
    
    //function to get one data from array
    func getData(tupple: [String]?) -> String{
        
        if let data = tupple {
            
            return data[randomIndex(fromArray: data)]
    
        }else {
            return "No Fact"
        }
    }
    
    //getting the next question
    func nextQues() {
        let person = randomPerson()
        answer = person
        let tup = billAndSteveFacts[person]
        let data = getData(tupple: tup)
        guessAns.text = ""
        factLabel.text = data
        steveJobs.isHidden = false
        billGates.isHidden = false
        
    }
    
    
    @IBAction func steveAns(_ sender: Any) {
        
        if answer == "Steve Jobs" {
            score += 1
            scoreOutlet.text = String(score)
            if !billGates.isHidden {
                guessAns.text = "Correct Answer"
            }else {
                guessAns.text = "Wrong Answer"
            }
            nextQues()
        }else {
            steveJobs.isHidden = true
            score -= 1
            guessAns.text = "Wrong Answer"
        }
        
    }
    
    @IBAction func billAns(_ sender: Any) {
        
        if answer == "Bill Gates" {
            score += 1
            scoreOutlet.text = String(score)
            if !steveJobs.isHidden {
                guessAns.text = "Correct Answer"
            }else {
                guessAns.text = "Wrong Answer"
            }
            nextQues()
        }else {
            billGates.isHidden = true
            score -= 1
            guessAns.text = "Wrong Answer"
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
