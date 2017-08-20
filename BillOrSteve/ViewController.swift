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
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var steveB: UIButton!
    
    @IBOutlet weak var billB: UIButton!
    
    
    var correctPerson: String = ""
    var scored:Int = 0
    var r:Int = 0
    // Create your stored properties here
    var billAndSteveFacts:[String:[String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    func createFacts(){
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.","Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.","He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.","He was a pescetarian, meaning he ate no meat except for fish."]
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.","He scored 1590 (out of 1600) on his SATs.","His foundation spends more on global health each year than the United Nation's World Health Organization.","The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.","In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        billAndSteveFacts = ["Bill Gates": billFacts, "Steve Jobs": steveFacts]
    }
    
    func getRandomFacts()->(String,String){
        let person = randomPerson()
        let fact = billAndSteveFacts[person]
        r = randomIndex(fromArray: fact!)
        return (person,fact![r])
        
    }
    
    func showFact(){
        let f = getRandomFacts()
        factLabel.text = f.1
        correctPerson = f.0
    }
    
    @IBAction func steveP(_ sender: Any) {
        if (correctPerson == "Steve Jobs"){
            scored = scored + 1
            score.text = String(scored)
        }
        showFact()
    }
    
    @IBAction func billP(_ sender: Any) {
        if (correctPerson == "Bill Gates"){
            scored = scored + 1
            score.text = String(scored)
        }
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
    
}
