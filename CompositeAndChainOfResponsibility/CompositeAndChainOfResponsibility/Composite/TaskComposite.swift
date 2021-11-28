//
//  TaskComposite.swift
//  CompositeAndChainOfResponsibility
//
//  Created by Андрей Щекатунов on 27.11.2021.
//

import Foundation

protocol TaskCompose {
	var name: String { get set }
	func addTask(task: TaskCompose)
	func taskCount() -> Int
	func showTasks() -> [TaskCompose]
}

class Task: TaskCompose {

	var name: String

	private var tasksArray = [TaskCompose]()

	init(name: String) {
		self.name = name
	}

	func addTask(task: TaskCompose) {
		tasksArray.append(task)
	}

	func taskCount() -> Int {
		tasksArray.count
	}

	func showTasks() -> [TaskCompose] {
		return tasksArray
	}

}
