//
//  EducateViewController.swift
//  Final-Proj
//
//  Created by Jess Ryan on 2/17/22.
//

import UIKit

class EducateViewController: UIViewController {

    let dataLoader = quizDataLoader()
    var quizData = [quizTopic]()
    private var tapCount = 0
    let sectionNum = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButtonOne: UIButton!
    @IBOutlet weak var answerButtonTwo: UIButton!
    
    @IBAction func answerButtonOne(_ sender: Any) {
        
        if checkAnswer(answer: answerButtonOne.titleLabel!.text ?? "") == true{
            correctAlert()
        } else{
            falseAlert()
        }
        
    }
    @IBAction func answerButtonTwo(_ sender: Any) {
        
        if checkAnswer(answer: answerButtonTwo.titleLabel!.text ?? "") == true{
           correctAlert()
        } else{
            falseAlert()
        }
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
        tapCount += 1

        questionLabel.text = quizData[sectionNum].questions[1].questionText
        answerButtonOne.setTitle(quizData[sectionNum].questions[tapCount].answers[0], for: .normal)
        answerButtonTwo.setTitle(quizData[sectionNum].questions[tapCount].answers[1], for: .normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = dataLoader.loadData(fileName: "data"){
            quizData=data
            questionLabel.text = quizData[sectionNum].questions[0].questionText
            answerButtonOne.setTitle(quizData[sectionNum].questions[0].answers[0], for: .normal)
            answerButtonTwo.setTitle(quizData[sectionNum].questions[0].answers[1], for: .normal)
        }
    
    }
    
    func checkAnswer(answer: String) -> Bool{
        if answer == quizData[sectionNum].questions[tapCount].answers[quizData[sectionNum].questions[tapCount].correctAnswer]{
            return true
        }
        return false
    }
    
    func correctAlert(){
        let alert = UIAlertController(title: "correct", message: "NICE!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func falseAlert(){
        let alert = UIAlertController(title: "WRONG", message: "you picked the wrong answer", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
      
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
