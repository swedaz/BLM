//
//  SurveyViewController.swift
//  BlackLivesMatter
//
//  Created by Swetha Mohandas on 6/12/20.
//  Copyright © 2020 Sambar. All rights reserved.
//

import Foundation
import UIKit

class SurveyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var yes: Int = 0
    var surveyModel = [Question]()
    var currentQuestion: Question?
    
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setUpQuestions()
        configureUI(question: surveyModel.first!)
    }
    
    private func configureUI(question: Question) {
        label.text = question.text
        currentQuestion = question
        table.reloadData()
    }
    
    private func checkAnswer(answer: Answer, question: Question) -> Bool {
        if (question.answers.contains(where: { $0.text == answer.text}) && answer.yes) {
            return true
        }
        return false
    }
    
    private func setUpQuestions() {
        surveyModel.append(Question(text: "Are you 18+?", answers: [
            Answer(text: "Yes", yes: true),
            Answer(text: "No", yes: false)
        ]))
        
        surveyModel.append(Question(text: "Are you registered to vote?", answers: [
            Answer(text: "Yes", yes: true),
            Answer(text: "No", yes: false)
        ]))
        
        surveyModel.append(Question(text: "Have you voted before?", answers: [
            Answer(text: "Yes", yes: true),
            Answer(text: "No", yes: false)
        ]))
        
        surveyModel.append(Question(text: "Are you a student?", answers: [
            Answer(text: "Yes", yes: true),
            Answer(text: "No", yes: false)
        ]))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = currentQuestion else {
            return
        }
        
        let answer = question.answers[indexPath.row]
        
        if checkAnswer(answer: answer, question: question) {
            //correct (yes)
            
            if let index = surveyModel.firstIndex(where: { $0.text == question.text }) {
                if index < (surveyModel.count - 1) {
                    self.yes = yes + 1
                    print(yes)
                    //next question
                    let nextQuestion = surveyModel[index + 1]
                    currentQuestion = nil
                    configureUI(question: nextQuestion)
                } else {
                    //end of the survey
                    let vc = storyboard?.instantiateViewController(identifier: "homepage") as! HomepageViewController
                    vc.modalPresentationStyle = .fullScreen
                    present(vc, animated: true)
                }
            }
        } else {
            //wrong (no)
            if let index = surveyModel.firstIndex(where: { $0.text == question.text }) {
                if index < (surveyModel.count - 1) {
                    self.yes = yes - 1
                    print(yes)
                    //next question
                    let nextQuestion = surveyModel[index + 1]
                    currentQuestion = nil
                    configureUI(question: nextQuestion)
                } else {
                    //end of the game
                    let vc = storyboard?.instantiateViewController(identifier: "homepage") as! HomepageViewController
                    vc.modalPresentationStyle = .fullScreen
                    present(vc, animated: true)
                }
        }
    }
 }

struct Question {
    let text: String
    let answers: [Answer]
}

struct Answer {
    let text: String
    let yes: Bool
}

}
