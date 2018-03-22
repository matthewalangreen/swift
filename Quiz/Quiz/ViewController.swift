//
//  ViewController.swift
//  Quiz
//
//  Created by Matt Green on 3/19/18.
//  Copyright © 2018 Matt Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = [
        "From what is cognac made?",
        "What is 7+7?",
        "What is the capital of Vermont?"
    ]
    let answers: [String] = [
        "Grapes",
        "14",
        "Montpelier"
    ]
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // set the label's initial alpha
        questionLabel.alpha = 0
    }
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    func animateLabelTransitions() {
//        let animationClosure = { () -> Void in
//            self.questionLabel.alpha = 1
//        }
//
//        // Animate the alpha
//        UIView.animate(withDuration: 0.5, animations: animationClosure)
        UIView.animate(withDuration: 0.5, animations: {
            self.questionLabel.alpha = 1
        })
    }

}

