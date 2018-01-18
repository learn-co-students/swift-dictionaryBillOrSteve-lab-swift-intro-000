//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!

    var billAndSteveFacts: [String: [String]] = [
        "Steve Jobs": [],
        "Bill Gates": [],
    ]

    var score: Int = 0
    var questionsAsked: Int = 0
    var maxQuestions: Int = 0

    var correctPerson: String = ""
    var correctIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableButtons()
        maxQuestions = createFacts()
        factLabel.text = ""
        showScore()
        showFact()
    }
    
    @IBAction func steveButtonPressed(_ sender: UIButton) -> Void {
        if correctPerson == "Steve Jobs" {
            score = score + 1
        }
        askedQuestion()
        

    }

    @IBAction func billButtonPressed(_ sender: UIButton) -> Void {
        if correctPerson == "Bill Gates" {
            score += 1
        }
        askedQuestion()
    }

    func createFacts() -> Int {
        let billFacts: [String] = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss.",
        ]
        let steveFacts: [String] = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish.",
        ]
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
        return billFacts.count + steveFacts.count
    }
    
    func getRandomFact() -> (Int, String) {
        var person: String
        var index: Int

        repeat {
            person = randomPerson()
            index = randomIndex(fromArray: billAndSteveFacts[person]!)
        } while billAndSteveFacts[person]!.isEmpty

        return (index, person)
    }

    func showFact() -> Void {
        let (index, person) = getRandomFact()
        correctPerson = person
        correctIndex = index
        factLabel.text = billAndSteveFacts[person]![index]
        enableButtons()
    }

    func showScore() -> Void {
        scoreLabel.text = "\(score)/\(maxQuestions)"
    }

    
    func askedQuestion() -> Void {
        disableButtons()
        questionsAsked += 1
        billAndSteveFacts[correctPerson]!.remove(at: correctIndex)
        showScore()
        factLabel.text = ""
        if (questionsAsked <= maxQuestions) {
            showFact()
        }
    }

    func disableButtons() -> Void {
        billButton.isHidden = true
        steveButton.isHidden = true
    }

    
    func enableButtons() -> Void {
        billButton.isHidden = false
        steveButton.isHidden = false
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
