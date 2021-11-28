//
//  Parsing.swift
//  CompositeAndChainOfResponsibility
//
//  Created by Андрей Щекатунов on 27.11.2021.
//

import Foundation

protocol ParsingHandler {
	var next: ParsingHandler? { get set }
	func handler(from file: String) -> [Person]?
}

class PersonDataCast: ParsingHandler {

	var next: ParsingHandler?

	func handler(from file: String) -> [Person]? {
		let path1 = Bundle.main.path(forResource: file, ofType: "json")!
		let url = URL(fileURLWithPath: path1)
		// swiftlint:disable force_try
		let data = try! Data(contentsOf: url)

		do {
			let person = try JSONDecoder().decode(PersonData.self, from: data)
			// swiftlint:enable force_try
			return person.data
		} catch let error {
			print(error.localizedDescription)
			return (next?.handler(from: file))
		}

	}
}

class PersonResultCast: ParsingHandler {

	var next: ParsingHandler?

	func handler(from file: String) -> [Person]? {
		let path1 = Bundle.main.path(forResource: file, ofType: "json")!
		let url = URL(fileURLWithPath: path1)
		// swiftlint:disable force_try
		let data = try! Data(contentsOf: url)

		do {
			let person = try JSONDecoder().decode(PersonResult.self, from: data)
			// swiftlint:enable force_try
			return person.result
		} catch let error {
			print(error.localizedDescription)
			return (next?.handler(from: file))
		}
	}
}

class PersonCast: ParsingHandler {

	var next: ParsingHandler?

	func handler(from file: String) -> [Person]? {
		let path1 = Bundle.main.path(forResource: file, ofType: "json")!
		let url = URL(fileURLWithPath: path1)
		// swiftlint:disable force_try
		let data = try! Data(contentsOf: url)

		do {
			let person = try JSONDecoder().decode([Person].self, from: data)
			// swiftlint:enable force_try
			return person
		} catch let error {
			print(error.localizedDescription)
			return (next?.handler(from: file))
		}
	}
}

class DownloadManager {

	var personDataCast = PersonDataCast()
	var personResultCast = PersonResultCast()
	var personCast = PersonCast()

	func getPerson(from file: String) -> [Person]? {

		personDataCast.next = personResultCast
		personResultCast.next = personCast

		return personDataCast.handler(from: file)
	}

}
