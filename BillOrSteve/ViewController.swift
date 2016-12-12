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
    
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    
    @IBOutlet weak var billGatesOL: UIButton!
    @IBOutlet weak var steveJobsOL: UIButton!
    
    var billandSteve: [String : [String] ] = [:]
    var personAndFact:(person:String,fact:String) = ("","")
    var score:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFacts()
    }
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func showFacts(){
        
        personAndFact = getRandomFact()
        factLabel.text =  personAndFact.fact
    }
    

    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        }
        else {
            return "Bill Gates"
        }
    }
    
    
    func removeDictValue( _ editArray:[String], _ selectedOptions:(person:String,fact:String)){
        //Dicts & arrays are copied as constant so make a var that can be edited
        var mutable_editArray = editArray
        
        //get an index to reference for removeal
        for(index, value) in mutable_editArray.enumerated(){
        
            if(value == selectedOptions.fact){
                mutable_editArray.remove(at: index)
                
                //org dict reference for editArray is still in play SO replace it with the edited version
                billandSteve[selectedOptions.person] = mutable_editArray
            }
        }
    }

    
    func getRandomFact() -> (String,String){
        //use a tuple to return two values
        //get a random name
        personAndFact.person = randomPerson()
        
        if let checkForFacts = billandSteve[personAndFact.person]{
            if(checkForFacts.isEmpty){

                personAndFact.fact = "all facts for \(personAndFact.person) have been assigned"
                return personAndFact
            }
        else
            {
                //call randomIndex on getFacts to pick a single fact
                personAndFact.fact = checkForFacts[randomIndex(fromArray: checkForFacts)]
                
            }
        }
        return personAndFact
    }
    
        //https://developer.apple.com/reference/uikit/uilabel
    
    
    @IBAction func billGatesAction(_ sender: UIButton) {
      
        if let checkVal = billandSteve["Bill Gates"]{
            for(_,value) in checkVal.enumerated(){
                
                if value == personAndFact.fact{
                    removeDictValue(checkVal, personAndFact)
                    score += 1
                    showFacts()
                    break
                }
                else{
                    factLabel.text = "try again"
                }
            }
                    scoreCounter.text = "\(score)"
        }
    }
    
    
    @IBAction func steveJobsAction(_ sender: UIButton) {
        
        if let checkVal = billandSteve["Steve Jobs"]{
    
            for(_,value) in checkVal.enumerated(){
                print("\(value) == \(personAndFact.fact) :\(value == personAndFact.fact)")
                if value == personAndFact.fact{
                    removeDictValue(checkVal, personAndFact)
                    score += 1
                    showFacts()
                    break
                }

                else{
                    factLabel.text = "try again"
                }
            }
            scoreCounter.text = "\(score)"
        }
    }
    
    func createFacts(){
        
        
        let steveFacts =
            ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
             "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
             "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
             "He was a pescetarian, meaning he ate no meat except for fish."]
        
        
        let billFacts =
            ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
             "He scored 1590 (out of 1600) on his SATs.",
             "His foundation spends more on global health each year than the United Nation's World Health Organization.",
             "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
             "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]

        
        billandSteve["Bill Gates"] = billFacts
        billandSteve["Steve Jobs"] = steveFacts
        
    }

}
