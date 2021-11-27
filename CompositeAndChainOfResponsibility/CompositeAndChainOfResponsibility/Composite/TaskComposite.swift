//
//  TaskComposite.swift
//  CompositeAndChainOfResponsibility
//
//  Created by Андрей Щекатунов on 27.11.2021.
//

import Foundation

protocol Compose {
	var name: String { get set }
	func addTask(task: Compose)
	func taskCount() -> Int
	func showTasks() -> [Compose]
}

class Task: Compose {

	var name: String

	private var tasksArray = [Compose]()

	init(name: String) {
		self.name = name
	}

	func addTask(task: Compose) {
		tasksArray.append(task)
	}

	func taskCount() -> Int {
		tasksArray.count
	}

	func showTasks() -> [Compose] {
		return tasksArray
	}

}
