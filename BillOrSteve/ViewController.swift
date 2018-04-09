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
    var factsDictionary: [String: [String]] = [:]
    
    var correctPerson: String = ""
    
    var score: Int = 0
    

    
    
    @IBOutlet weak var factLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    @IBAction func steveAction(_ sender: Any) {
        if correctPerson == "Steve Jobs" {
            score += 1
            scoreLabel.text = "\(score)"
        }
        showFact()
    }
    @IBAction func billAction(_ sender: Any) {
        if correctPerson == "Bill Gates" {
            score += 1
            scoreLabel.text = "\(score)"
        }
        showFact()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFacts()
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
    
    func createFacts() {
        let billFacts = ["Microsoft", "still alive", "Melinda Gates", "blue", "glasses"]
        let steveFacts = ["Apple", "weirdo", "deceased", "R I P", "no idea"]
        
        factsDictionary["Bill Gates"] = billFacts
        factsDictionary["Steve Jobs"] = steveFacts
        
    }
    
    func getRandomFact() -> (String, String) {
        let person = randomPerson()
        var fact: String = ""
        if person == "Steve Jobs"{
            if let steve = factsDictionary["Steve Jobs"]{
                let steveIndex = randomIndex(fromArray: steve)
                fact = steve[steveIndex]
                return(person, fact)
            }
        } else if person == "Bill Gates" {
            if let bill = factsDictionary["Bill Gates"] {
                let billIndex = randomIndex(fromArray: bill)
                fact = bill[billIndex]
                
            }
           
        }
        
         return (person, fact)
    }
    
    func showFact() {
        let factz = getRandomFact()
        
        factLabel.text = factz.1
        
        correctPerson = factz.0
        
    
        
    }
    
}
