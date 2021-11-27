//
//  Parsing.swift
//  CompositeAndChainOfResponsibility
//
//  Created by Андрей Щекатунов on 27.11.2021.
//

import Foundation

func data(from file: String) -> Data {
	let path1 = Bundle.main.path(forResource: file, ofType: "json")!
	let url = URL(fileURLWithPath: path1)
	let data = try! Data(contentsOf: url)
	return data
}
