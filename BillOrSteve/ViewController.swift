//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomFactsBillGates = [
                                "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                                "He scored 1590 (out of 1600) on his SATs.",
                                "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                                "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                                "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
                                ]
    var randomFactsSteveJobs = [
                                "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font",
                                "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                                "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                                "He was a pescetarian, meaning he ate no meat except for fish."
                                ]
    var randomFacts = [String: [String]]()
    var randomFactPerson = String()
    var randomFactIndex = Int()
    var score = Int()
    var counter = Int()
    
    //Outlets and Actions
    
    @IBAction func steveButton(_ sender: UIButton) {
        if counter < 7 {
            updateBoard(sender: sender)
        }else{
            endGameRestartGame()
        }
    }
    
    @IBAction func billButton(_ sender: UIButton) {
        if counter < 7 {
            updateBoard(sender: sender)
        }else{
            endGameRestartGame()
        }
    }
    
    @IBAction func nextFact(_ sender: UIButton) {
        factLabel.text = getRandomFact().fact
        nextFactOutLet.isHidden = true
        billButtonOutLet.isEnabled = true
        steveButtonOutLet.isEnabled = true
        factLabel.backgroundColor = nil
        counter += 1
    }
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var billButtonOutLet: UIButton!
    @IBOutlet weak var steveButtonOutLet: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextFactOutLet: UIButton!
    
    //Methods (functions)
    func updateBoard(sender: UIButton){
        switch sender.tag{
        case 1:
            if randomFactPerson == "Steve Jobs"{
                score += 1
                scoreLabel.text = "\(String(score)) pts"
                factLabel.text?.append("\n CORRECT! IT IS \(randomFactPerson)")
                factLabel.backgroundColor = UIColor.green
            }else{
                factLabel.text?.append("\n WRONG! IT IS \(randomFactPerson)")
                factLabel.backgroundColor = UIColor.red
            }
        case 2:
            if randomFactPerson == "Bill Gates"{
                score += 1
                scoreLabel.text = "\(String(score)) pts"
                factLabel.text?.append("\n CORRECT! IT IS \(randomFactPerson)")
                factLabel.backgroundColor = UIColor.green
            }else{
                factLabel.text?.append("\n WRONG! IT IS \(randomFactPerson)")
                factLabel.backgroundColor = UIColor.red

            }
        default:
            return
        }
        billButtonOutLet.isEnabled = false
        steveButtonOutLet.isEnabled = false
        nextFactOutLet.isHidden = false
    }
    
    func createFacts(){
        randomFacts["Bill Gates"] = randomFactsBillGates
        randomFacts["Steve Jobs"] = randomFactsSteveJobs
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        factLabel.text = getRandomFact().fact
        score = 0
        scoreLabel.text = "0"
        nextFactOutLet.isHidden = true
        counter = 1
    }
    
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        randomFactIndex = Int(arc4random_uniform(UInt32(array.count)))
        return randomFactIndex
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    func getRandomFact() -> (person: String, fact: String) {
        let person = randomPerson()
        let fact = randomFacts[person]![randomIndex(fromArray: randomFacts[person]!)]
        randomFactPerson = person
        randomFacts[person]?.remove(at: randomFactIndex)
        return (person, fact)
    }
    
    func endGameRestartGame(){
        factLabel.text = "You've scored a total of \(score) points!"
        steveButtonOutLet.isEnabled = false
        billButtonOutLet.isEnabled = false
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
