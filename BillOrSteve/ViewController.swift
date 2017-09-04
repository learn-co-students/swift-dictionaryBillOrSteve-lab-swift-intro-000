//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var qLabel: UILabel!
    
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var sButton: UIButton!
    
    @IBOutlet weak var bButton: UIButton!
    
    // Create your stored properties here
    
    @IBOutlet weak var scoreLabel: UILabel!
    // Create your stored property here
    var billAndSteveFacts: [String : [String]] = [:]
    var CurrAnswer:String = ""
    var count:Int = 1
    var score:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "\(count )/9"
        createFacts()
        genQuestion()
    }
    
    
    
    @IBAction func steveClick(_ sender: Any) {
      
        if "Steve Jobs" == (CurrAnswer){
            score += 1
        }
          if(count < 9 ){
        genQuestion()
        count += 1
         countLabel.text = "\(count)/9"
          }else{
            checkScore()
        }
    }
    
    
    @IBAction func billClick(_ sender: Any) {
        
        
        
        if "Bill Gates" == (CurrAnswer){
            score += 1
        }
            if(count < 9 ){
        genQuestion()
        count += 1
         countLabel.text = "\(count)/9"
        } else{
            checkScore()
        }
        
    }
    
    
    
    // Helper Functions
    
    
    
    func checkScore(){
          scoreLabel.isHidden = false
          scoreLabel.text = "You scored a \(score)"
        
    }
    
    func genQuestion(){
        let fa:(name:String, fact:String) = getRandomFact()
        qLabel.text = fa.fact
        CurrAnswer = fa.name
        
        
    }
    
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
    
    func getRandomFact()-> (String, String) {
        var fact:(name:String, fact:String)
        fact.name =  randomPerson()
        let rIndex:Int = randomIndex(fromArray: billAndSteveFacts[fact.name]!)
        if (billAndSteveFacts[fact.name]?.count) == 0{
                if fact.name == "Steve Jobs"{
                    fact.name  = "Bill Gates"
                }else{
                    fact.name = "Steve Jobs"
            }
        }
   
        
        fact.fact = (billAndSteveFacts[fact.name]?[rIndex])!
        
         billAndSteveFacts[fact.name]?.remove(at: rIndex)
        return fact
    }
    
    
    func createFacts() {
        
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        
        
        
        
        let steveFacts = [
        "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
        "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
        "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
        "He was a pescetarian, meaning he ate no meat except for fish."  ]
        
        
        
        
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }
    
    
}
