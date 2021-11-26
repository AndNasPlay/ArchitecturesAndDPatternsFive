//
//  MainUItableTableViewController.swift
//  CompositeAndChainOfResponsibility
//
//  Created by Андрей Щекатунов on 26.11.2021.
//

import UIKit

class MainUItableTableViewController: UITableViewController, UINavigationControllerDelegate {

	let reuseIdentifier = "reuseIdentifier"

	private var arrOfTask: [String] = ["Задача"]

	private(set) lazy var addButton = UIBarButtonItem(barButtonSystemItem: .add,
									target: self,
									action: #selector(handleAddButtonTouchUpInseide))

	@objc func handleAddButtonTouchUpInseide() {
		arrOfTask.append("Задача")
		self.tableView.reloadData()
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationController?.navigationBar.isHidden = false
		self.navigationItem.rightBarButtonItem = addButton
		self.tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		return arrOfTask.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

		cell.textLabel?.text = arrOfTask[indexPath.row]
		cell.detailTextLabel?.text = "№ \(indexPath.row + 1)"

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class SubtitleTableViewCell: UITableViewCell {

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
