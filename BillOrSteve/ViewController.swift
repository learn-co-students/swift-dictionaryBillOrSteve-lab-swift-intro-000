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
    var billAndSteveFacts: [String : [String]] = [ : ]
    var correctPerson: String = ""
    
    func createFacts() {
        billAndSteveFacts["Bill Gates"] = [
            "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
        "He scored 1590 (out of 1600) on his SATs.",
        "His foundation spends more on global health each year than the United Nation's World Health Organization.",
        "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
        "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        billAndSteveFacts["Steve Jobs"] = [
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."]
    }
    
    var score = 0
    
    func showFact() {
        let showRandomFact = getRandomFact()
        factLabel.text = "\(showRandomFact.fact)"
        correctPerson = showRandomFact.name
        
    }

    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var steveOutlet: UIButton!
    @IBOutlet weak var billOutlet: UIButton!

        
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    @IBAction func steveButton(_ sender: Any) {
        let buttonName = "Steve Jobs"
        if buttonName == correctPerson {
            score+=1
        }
        scoreCounter.text = "\(score) / 9"
        showFact()
        
    }
    
    @IBAction func billButton(_ sender: Any) {
            let buttonName = "Bill Gates"
            if buttonName == correctPerson {
                score+=1
            }
        scoreCounter.text = "\(score) / 9"
        showFact()
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
    
    func getRandomFact() -> (name: String, fact: String) {
        let randomName = randomPerson()
        var randomFact = ""
        var otherName = ""
        var nameUsed = ""
        
        //find out which name
        if randomName == "Steve Jobs" {
            otherName = "Bill Gates"
        } else {
            otherName = "Steve Jobs"
        }
        
        //if array is empty, switch names
        if billAndSteveFacts[randomName]!.isEmpty && billAndSteveFacts[otherName]!.isEmpty {
            factLabel.text = "GAME OVER!"
        } else if billAndSteveFacts[randomName]!.isEmpty {
            nameUsed = otherName
        } else if billAndSteveFacts[otherName]!.isEmpty {
            nameUsed = randomName
        }
        
        //let randomFactOptional = billAndSteveFacts[randomName]
        if let randomFactArray = billAndSteveFacts[nameUsed] {
            randomFact = randomFactArray[randomIndex(fromArray: randomFactArray)]
        }
        
        let removedIndex = billAndSteveFacts[nameUsed]!.index(of: randomFact)
        billAndSteveFacts[nameUsed]!.remove(at:removedIndex!)
        
        return (name: nameUsed, fact: randomFact)
    }
    
}
