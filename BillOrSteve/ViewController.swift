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
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var buttonSteve: UIButton!
    @IBOutlet weak var buttonBill: UIButton!
    
    var facts: [String : [String]] = [:]
    var score = 0
    var currentAnswer: String?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFacts()
        
        loadQuestion()
//        let selectedQuestion  = getRandomFact()
        
    }
    
    func loadQuestion()
    {
        let selectedQuestion = getRandomFact()
        
        labelQuestion.text = selectedQuestion.question
        currentAnswer = selectedQuestion.isAbout
        
        labelScore.text = "\(score)"
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
        
        facts["Bill Gates"] = billFacts
        facts["Steve Jobs"] = steveFacts
    }
    
    
    func getRandomFact() -> (isAbout: String, question: String) {
        let choosenPerson = randomPerson()
        let choosenIndex = randomIndex(fromArray: facts[choosenPerson]!)
        var choosenFact = ""

        choosenFact = facts[choosenPerson]![choosenIndex]
    
        return (choosenPerson, choosenFact)
    }
    

    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        var selectedPerson: String = ""
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            selectedPerson = "Steve Jobs"
        } else {
            selectedPerson = "Bill Gates"
        }
        
        return selectedPerson
    }
    
    @IBAction func answerTapped(_ sender: UIButton) {
        switch sender {
        case buttonBill:
            if currentAnswer! == "Bill Gates" { score += 1 }
            
        case buttonSteve:
            if currentAnswer! == "Steve Jobs" { score += 1 }
        
        default:
            score = 0
        }
        
        loadQuestion()
    }
}
