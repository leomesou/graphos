//
//  QuizViewController.swift
//  Graphos
//
//  Created by Leandro Sousa on 08/02/20.
//  Copyright © 2020 Leandro Sousa. All rights reserved.
//

import UIKit

public class QuizViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel! {
		didSet {
			titleLabel.textColor = .white
		}
	}
	@IBOutlet weak var topView: UIView! {
		didSet {
			topView.backgroundColor = Colors.challengerange
		}
	}
	@IBOutlet weak var backButton: UIButton! {
		didSet {
			backButton.tintColor = .white
		}
	}
	@IBOutlet weak var settingsButton: UIButton! {
		didSet {
			settingsButton.tintColor = .white
		}
	}
	@IBOutlet weak var bottomView: UIView! {
		didSet {
			bottomView.backgroundColor = Colors.challengerange
		}
	}
	@IBOutlet weak var questionLabel: UILabel!
	@IBOutlet weak var optionButtonA: UIButton! {
		didSet {
			optionButtonA.titleLabel?.lineBreakMode = .byWordWrapping
			optionButtonA.titleLabel?.numberOfLines = 0
		}
	}
	@IBOutlet weak var optionButtonB: UIButton! {
		didSet {
			optionButtonA.titleLabel?.lineBreakMode = .byWordWrapping
			optionButtonA.titleLabel?.numberOfLines = 0
		}
	}
	@IBOutlet weak var optionButtonC: UIButton! {
		didSet {
			optionButtonA.titleLabel?.lineBreakMode = .byWordWrapping
			optionButtonA.titleLabel?.numberOfLines = 0
		}
	}
	@IBOutlet weak var optionButtonD: UIButton! {
		didSet {
			optionButtonA.titleLabel?.lineBreakMode = .byWordWrapping
			optionButtonA.titleLabel?.numberOfLines = 0
		}
	}

	var quizData: [[String: Any]] = []
	var currentQuestionIndex = 0

	public override func viewDidLoad() {
		super.viewDidLoad()
		setStrings()
		loadQuizData()
		displayQuestion()
	}

	@IBAction func backAction(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}

	@IBAction func settingsAction(_ sender: Any) {
		navigationController?.pushViewController(ViewManager.settingsViewController(), animated: true)
	}

	@IBAction func optionSelected(_ sender: UIButton) {
		guard quizData.count > currentQuestionIndex else {
			return
		}

		let correctAnswer = quizData[currentQuestionIndex]["correct_answer"] as? String
		let selectedAnswer = sender.title(for: .normal)

		if selectedAnswer == correctAnswer {
			print("Resposta correta!")
		} else {
			print("Resposta incorreta!")
		}

		currentQuestionIndex += 1
		displayQuestion()
	}

	private func setStrings() {
		titleLabel.text = Texts.Quiz.title
	}

	private func loadQuizData() {
		if let path = Bundle.main.path(forResource: "Quiz", ofType: "plist"),
		   let xml = FileManager.default.contents(atPath: path),
		   let data = try? PropertyListSerialization.propertyList(from: xml, options: [], format: nil) as? [[String: Any]] {
			quizData = data
		}
	}

	private func displayQuestion() {
		guard quizData.count > currentQuestionIndex else {
			return
		}

		let question = quizData[currentQuestionIndex]
		questionLabel.text = question["question"] as? String

		let options = question["options"] as? [String: String] ?? [:]
		optionButtonA.setTitle(options["a"], for: .normal)
		optionButtonB.setTitle(options["b"], for: .normal)
		optionButtonC.setTitle(options["c"], for: .normal)
		optionButtonD.setTitle(options["d"], for: .normal)

		view.animateViews(views: [optionButtonA, optionButtonB, optionButtonC, optionButtonD])
	}
}
