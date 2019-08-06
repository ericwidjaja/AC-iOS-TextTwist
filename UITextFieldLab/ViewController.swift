//
//  ViewController.swift
//  UITextFieldLab
//
//  Created by Eric Widjaja on 8/5/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var letterBank: UILabel!
    
    @IBOutlet weak var guessCorrectOrNot: UILabel!
    
    
    @IBOutlet weak var threeLettersWord: UITextView!
    
    @IBOutlet weak var fourLettersWord: UITextView!
    
    @IBOutlet weak var fiveLettersWord: UITextView!
    
    @IBOutlet weak var sixLettersWord: UITextView!
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    
    var currentTextTwist = WordData.pickRandomTextTwistInfo()
    var arrThree = [String]()
    var arrFour = [String]()
    var arrFive = [String]()
    var arrSix = [String]()
    
    
    
    @IBAction func userInput(_ sender: UITextField) {
        if let unwrapText = sender.text {
            if currentTextTwist.words.contains(unwrapText) {
                guessCorrectOrNot.text = "Correct"
                switch countLettersInWord(word: unwrapText) {
                case 3:
                    if !arrThree.contains(unwrapText) {
                        arrThree.append(unwrapText)
                        threeLettersWord.text.append("\(unwrapText)\n")
                    }
                case 4:
                    if !arrFour.contains(unwrapText) {
                        arrFour.append(unwrapText)
                        fourLettersWord.text.append("\(unwrapText)\n")
                    }
                case 5:
                    if !arrFive.contains(unwrapText){
                        arrFive.append(unwrapText)
                        fiveLettersWord.text.append("\(unwrapText)\n")
                    }
                case 6:
                    if !arrSix.contains(unwrapText) {
                        arrSix.append(unwrapText)
                        sixLettersWord.text.append("\(unwrapText)\n")
                    }
                    
                default:
                    print(unwrapText)
                }
            } else {
                guessCorrectOrNot.text = "Incorrect!"
            }
        }
        textField.text = ""
    }
    
    
    func countLettersInWord(word: String)->Int {
        return word.count
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textField.delegate = self
        self.letterBank.text = currentTextTwist.letters
        
        threeLettersWord.isEditable = false
        fourLettersWord.isEditable = false
        fiveLettersWord.isEditable = false
        sixLettersWord.isEditable = false
        
        self.threeLettersWord.text = ""
        self.fourLettersWord.text = ""
        self.fiveLettersWord.text = ""
        self.sixLettersWord.text = ""
    }
        
    func textField(_ textField:UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedLetter = currentTextTwist.letters
        let allowedLetterSet = CharacterSet(charactersIn: allowedLetter)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return allowedLetterSet.isSuperset(of: typedCharacterSet)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

}

