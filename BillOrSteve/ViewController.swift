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
	
	@IBOutlet weak var factLabel: UILabel!
	@IBOutlet weak var scoreCounter: UILabel!
	@IBOutlet weak var steveButton: UIButton!
	@IBOutlet weak var billButton: UIButton!
	
	var scoreCount: Int = 0
	
	
    var knownFacts = [String : [String]]()
	
	var correctPerson: String = ""
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		makeFacts()
		showFact()
    }
    
	@IBAction func steveAction(_ sender: Any) {
		if correctPerson == "Steve Jobs" {
			scoreCount += 1
			scoreCounter.text = String(scoreCount)
		}
		showFact()
	}
	
	@IBAction func billAction(_ sender: Any) {
		if correctPerson == "Bill Gates" {
			scoreCount += 1
			scoreCounter.text = String(scoreCount)
		}
		showFact()
	}
	
	func makeFacts() {
		
		let steveFacts: [String] = ["He took a calligraphy course, which he sayswas instrumental in the future company products' attention to typography and font.",
		                            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
		                            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
		                            "He was a pescetarian, meaning he ate no meat except for fish."]
		
		let billFacts: [String] = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
		                           "He scored 1590 (out of 1600) on his SATs.",
		                           "His foundation spends more on global health each year than the United Nation's World Health Organization.",
		                           "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
		                           "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
		
		knownFacts["Steve Jobs"] = steveFacts
		knownFacts["Bill Gates"] = billFacts
	}

	func showFact() {
		let (person, fact) = getRandomFact()
		correctPerson = person
		factLabel.text = fact
	}
	
	
	
	
	
	
	func getRandomFact() -> (String, String) {
		var random: (person: String, fact: String)
		
		
		random.person = randomPerson()
		
		if let facts = knownFacts[random.person] {
			random.fact = getFact(forPerson: random.person, from: facts)
			
			return random
		}
		
		
		
		if random.person == "Steve Jobs" {
			random.person = "Bill Gates"
		} else {
			random.person = "Steve Jobs"
		}
		
		if let facts = knownFacts[random.person] {
			
			random.fact = getFact(forPerson: random.person, from: facts)
			
			return random
		}
		
		
		billButton.isEnabled = false
		steveButton.isEnabled = false
		return ("","GAME OVER")
	}
	
	
	
	
	
	func getFact(forPerson: String, from array: [String]) -> String {
		var tempArray = array
		let index = randomIndex(fromArray: array)
		
		print(tempArray.count)
		
		let fact = tempArray[index]
		
		tempArray.remove(at: index)
		
		if tempArray.isEmpty {
			knownFacts[forPerson] = nil
		} else {
			knownFacts[forPerson] = tempArray
		}
		
		return fact
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
