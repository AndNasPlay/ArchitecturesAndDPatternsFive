//
//  MainUItableTableViewController.swift
//  CompositeAndChainOfResponsibility
//
//  Created by Андрей Щекатунов on 26.11.2021.
//

import UIKit

class MainUItableTableViewController: UITableViewController, UINavigationControllerDelegate {

	let reuseIdentifier = "reuseIdentifier"

	private var arrOfTask: Compose = Task(name: "Main")

	private(set) lazy var addButton = UIBarButtonItem(barButtonSystemItem: .add,
									target: self,
									action: #selector(handleAddButtonTouchUpInseide))

	@objc func handleAddButtonTouchUpInseide() {
		arrOfTask.addTask(task: Task(name: "Задача"))
		self.tableView.reloadData()
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationController?.navigationBar.isHidden = false
		self.navigationItem.rightBarButtonItem = addButton
		self.tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		self.tableView.reloadData()
	}

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		return arrOfTask.taskCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
		let allTasks = arrOfTask.showTasks()

		cell.textLabel?.text = "\(allTasks[indexPath.row].name) № \(indexPath.row + 1)"
		cell.detailTextLabel?.text = "Колличество подзадач \(allTasks[indexPath.row].taskCount())"

        return cell
    }

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let newTableVc = MainUItableTableViewController()
		let allTasks = arrOfTask.showTasks()
		newTableVc.arrOfTask = allTasks[indexPath.row]
		self.navigationController?.pushViewController(newTableVc, animated: true)
	}
}

class SubtitleTableViewCell: UITableViewCell {

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
