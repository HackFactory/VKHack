//
//  TeamQuizDataViewController.swift
//  Sports.ru
//
//  Created by Yaroslav on 9/28/19.
//  Copyright © 2019 Mountain Viewer. All rights reserved.
//

import UIKit

class TeamQuizDataViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var quizDescriptionLabel: UILabel!
    
    @IBOutlet weak var startTestButton: UIButton!
    
    // Actions
    
    @IBAction func startTestButtonTouchUpInside(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? QuestionViewController else {
            return
        }
        
        if #available(iOS 13.0, *) {
            vc.isModalInPresentation = true
        } else {
            // Fallback on earlier versions
        }
        vc.teamName = teamQuiz?.teamName
    }
    
    // Vars
    var index: Int?
    var teamQuiz: QuizModel?
    
    // Helper methods

    func configure() {
        self.startTestButton.layer.cornerRadius = 8.0
    }
    
    func setViews() {
        teamNameLabel.text = teamQuiz?.teamName
        teamLogoImageView.image = teamQuiz?.teamLogo
        quizDescriptionLabel.text = teamQuiz?.quizDescription
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setViews()
    }

}
