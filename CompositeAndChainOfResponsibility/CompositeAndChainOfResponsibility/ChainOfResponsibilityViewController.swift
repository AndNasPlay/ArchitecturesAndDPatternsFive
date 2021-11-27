//
//  ChainOfResponsibilityViewController.swift
//  CompositeAndChainOfResponsibility
//
//  Created by Андрей Щекатунов on 27.11.2021.
//

import UIKit

class ChainOfResponsibilityViewController: UIViewController {

	private let stackViewLeadingTrailing: CGFloat = 60.0

	private let stackViewHeightAnchor: CGFloat = 360.0

	private let stackViewSpacing: CGFloat = 20.0

	private(set) lazy var firstParserUIView: UILabel = {
		var view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .brown
		view.textAlignment = .center
		view.text = "Первый"
		return view
	}()

	private(set) lazy var secondParserUIView: UILabel = {
		var view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .brown
		view.textAlignment = .center
		view.text = "Второй"
		return view
	}()

	private(set) lazy var thirdParserUIView: UILabel = {
		var view = UILabel()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .brown
		view.textAlignment = .center
		view.text = "Третий"
		return view
	}()

	private(set) lazy var parsingButton: UIButton = {
		var button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Parsing", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.setTitleColor(.white, for: .highlighted)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
		button.backgroundColor = .green
		button.layer.cornerRadius = stackViewSpacing
		return button
	}()

	private(set) lazy var viewStackView: UIStackView = {
		var stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.spacing = stackViewSpacing
		stackView.distribution = .fillEqually
		return stackView
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = .white
		self.navigationController?.navigationBar.isHidden = false
		createSubviews()
		constraintsInit()
    }

	func createSubviews() {
		self.view.addSubview(viewStackView)
		viewStackView.addArrangedSubview(firstParserUIView)
		viewStackView.addArrangedSubview(secondParserUIView)
		viewStackView.addArrangedSubview(thirdParserUIView)
		viewStackView.addArrangedSubview(parsingButton)
		parsingButton.addTarget(self,
								  action: #selector(handleParsingButtonTouchUpInseide),
								  for: .touchUpInside)
	}

	func constraintsInit() {
		NSLayoutConstraint.activate([

			viewStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
												   constant: stackViewLeadingTrailing),
			viewStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
													constant: -stackViewLeadingTrailing),
			viewStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
			viewStackView.heightAnchor.constraint(equalToConstant: stackViewHeightAnchor)
		])
	}

	@objc func handleParsingButtonTouchUpInseide() {
		print(1)
	}
}
