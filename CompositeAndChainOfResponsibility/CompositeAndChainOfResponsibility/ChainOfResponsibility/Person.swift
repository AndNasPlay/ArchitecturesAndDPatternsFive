//
//  Person.swift
//  CompositeAndChainOfResponsibility
//
//  Created by Андрей Щекатунов on 27.11.2021.
//

import Foundation

struct PersonData: Codable {
	let data: [Person]
}

struct PersonResult: Codable {
	let result: [Person]
}

struct Person: Codable {

	let name: String
	let age: Int
	let isDeveloper: Bool

}
