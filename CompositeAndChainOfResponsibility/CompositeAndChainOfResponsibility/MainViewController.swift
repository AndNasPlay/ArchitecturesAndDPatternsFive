//
//  MainViewController.swift
//  CompositeAndChainOfResponsibility
//
//  Created by Андрей Щекатунов on 26.11.2021.
//

import UIKit

class MainViewController: UIViewController {

	private let buttonsStackViewLeadingTrailing: CGFloat = 60.0

	private let buttonsStackViewHeightAnchor: CGFloat = 200.0

	private let buttonsCornerRadiusAndSpacing: CGFloat = 40.0

	private(set) lazy var compositeButton: UIButton = {
		var button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Composite", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.setTitleColor(.white, for: .highlighted)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .light)
		button.backgroundColor = .lightGray
		button.layer.cornerRadius = buttonsCornerRadiusAndSpacing
		return button
	}()

	private(set) lazy var chainButton: UIButton = {
		var button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Chain of responsibility", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.setTitleColor(.white, for: .highlighted)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .light)
		button.backgroundColor = .lightGray
		button.layer.cornerRadius = buttonsCornerRadiusAndSpacing
		return button
	}()

	private(set) lazy var buttonsStackView: UIStackView = {
		var stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.spacing = buttonsCornerRadiusAndSpacing
		stackView.distribution = .fillEqually
		return stackView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		createSubviews()
		constraintsInit()
		self.navigationController?.navigationBar.isHidden = true
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		navigationController?.navigationBar.isHidden = true
	}

	func createSubviews() {
		self.view.addSubview(buttonsStackView)
		buttonsStackView.addArrangedSubview(compositeButton)
		buttonsStackView.addArrangedSubview(chainButton)
		compositeButton.addTarget(self,
								  action: #selector(handleCompositeButtonTouchUpInseide),
								  for: .touchUpInside)
		chainButton.addTarget(self,
							  action: #selector(handleChainButtonTouchUpInseide),
							  for: .touchUpInside)
	}

	func constraintsInit() {
		NSLayoutConstraint.activate([

			buttonsStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
													  constant: buttonsStackViewLeadingTrailing),
			buttonsStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
													   constant: -buttonsStackViewLeadingTrailing),
			buttonsStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
			buttonsStackView.heightAnchor.constraint(equalToConstant: buttonsStackViewHeightAnchor)
		])
	}

	@objc func handleCompositeButtonTouchUpInseide() {
		self.navigationController?.pushViewController(
			MainUItableTableViewController(), animated: true)
	}

	@objc func handleChainButtonTouchUpInseide() {
		self.navigationController?.pushViewController(
			ChainOfResponsibilityViewController(), animated: true)
	}
}
