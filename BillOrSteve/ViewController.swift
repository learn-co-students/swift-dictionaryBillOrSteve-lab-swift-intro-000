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
    
    var billAndSteveFacts: [ String : [String]] = [:]
    var cP : String = ""
    var cF : String = ""
    var counter = 0
    var factsLeft = 9

    
    @IBOutlet weak var factLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var steveOutlet: UIButton!
    
    @IBOutlet weak var billOutlet: UIButton!
    
    
    @IBAction func guessBill(_ sender: Any) {
        
        if (cP == "Bill Gates" && factsLeft >= 0) {
            
            counter += 1
            scoreLabel.text =  "\(counter) / 9"
            print("\(counter) and facts left \(factsLeft)")
            print("\(billAndSteveFacts["Bill Gates"])")
            print("\(billAndSteveFacts["Steve Jobs"])")
            showFact()
            
            } else if factsLeft >= 0 {
            showFact()
            print("\(counter) and facts left \(factsLeft)")
            print("\(billAndSteveFacts["Bill Gates"])")
            print("\(billAndSteveFacts["Steve Jobs"])")
            
            } else {
            }
        
        }
    
    @IBAction func guessSteve(_ sender: Any) {
        
        if (cP == "Steve Jobs" && factsLeft >= 0) {
            
            counter += 1
            scoreLabel.text =  "\(counter) / 9"
           print("\(counter) and facts left \(factsLeft)")
           print("\(billAndSteveFacts["Steve Jobs"])")
           print("\(billAndSteveFacts["Bill Gates"])")
            showFact()
            
            } else if factsLeft >= 0 {
            showFact()
            print("\(counter) and facts left \(factsLeft)")
            print("\(billAndSteveFacts["Bill Gates"])")
            print("\(billAndSteveFacts["Bill Gates"])")
            } else {
            }
       }
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
        
    }

    
    
 // Game Logic
    
   
    
    func showFact() {
        
        let result: (correctPerson: String , chosenFact: String) = getRandomFact()
        print("\(result)")
        //print("\(result.chosenFact)")
        
        factLabel.text = result.chosenFact
        cP = result.correctPerson
        cF = result.chosenFact
        factsLeft -= 1
        
        
        }
    
    func createFacts() {
        
        let billFacts = [ "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                          "He scored 1590 (out of 1600) on his SATs.",
                          "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                          "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                          "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                          "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                          "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                          "He was a pescetarian, meaning he ate no meat except for fish."]
        
   
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
        
    }
    
    func getRandomFact() -> (String, String) {
        
        var solTuple: (name: String, fact: String)
        
        solTuple.name = randomPerson()
        
       
        if var Stevo = billAndSteveFacts["Steve Jobs"] {
        if var Bilgo = billAndSteveFacts["Bill Gates"] {
            
            if solTuple.name == "Steve Jobs" {
            
                
                if !Stevo.isEmpty {
                let ind = randomIndex(fromArray: Stevo)
                solTuple.fact = Stevo[ind]
                Stevo.remove(at: ind)
                billAndSteveFacts["Steve Jobs"] = Stevo
                return (solTuple.name , solTuple.fact)
                
                } else if (Stevo.isEmpty && !Bilgo.isEmpty) {
                
                    solTuple.name = "Bill Gates"
                    let ind = randomIndex(fromArray: Bilgo)
                    solTuple.fact = Bilgo[ind]
                    Bilgo.remove(at: ind)
                    billAndSteveFacts["Bill Gates"] = Bilgo
                    factsLeft += 1
                    return (solTuple.name , solTuple.fact)
                } else {
                
                return ("","")
                
                }
                
            } else if solTuple.name == "Bill Gates" {
            
                if !Bilgo.isEmpty {
                    let ind = randomIndex(fromArray: Bilgo)
                    solTuple.fact = Bilgo[ind]
                    Bilgo.remove(at: ind)
                    billAndSteveFacts["Bill Gates"] = Bilgo
                    return (solTuple.name , solTuple.fact)
                    
                } else if (Bilgo.isEmpty && !Stevo.isEmpty) {
                    
                    solTuple.name = "Steve Jobs"
                    let ind = randomIndex(fromArray: Stevo)
                    solTuple.fact = Stevo[ind]
                    Stevo.remove(at: ind)
                    billAndSteveFacts["Steve Jobs"] = Stevo
                    factsLeft += 1
                    return (solTuple.name , solTuple.fact)
                } else {
                    
                    return ("","")
                    
                }
                
               
            }
            }
             return ("","")
        }
     return ("","")
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
