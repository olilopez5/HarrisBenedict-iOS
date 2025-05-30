//
//  GoalOptionsViewController.swift
//  HarrisBenedict-iOS
//
//  Created by Mañanas on 30/5/25.
//

import UIKit

struct GoalOption {
    let title: String
    let adjustment: Int // en calorías
    let description: String
}

class GoalOptionsViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var tdee: Double = 0
    var goal: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.dataSource = self
    }

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultViewCell
        if (goal == 0) {
            switch (indexPath.row) {
            case 1:
                cell.render(title: "Ligero", result: String(Int(tdee * 1.10)))
                break
            case 2:
                cell.render(title: "Moderado", result: String(Int(tdee * 1.15)))
                break
            case 3:
                cell.render(title: "Agresivo", result:  String(Int(tdee * 1.20)))
                break
            case 4:
                cell.render(title: "Muy agresivo", result:  String(Int(tdee * 1.25)))
                break
            default:
                cell.render(title: "Nivel", result: "kcal/día")
                cell.contentView.backgroundColor = .hBsecundary
                break
            }
        } else {
            switch (indexPath.row) {
            case 1:
                cell.render(title: "Ligero", result:  String(Int(tdee * 0.90)))
                break
            case 2:
                cell.render(title: "Moderado", result:  String(Int(tdee * 0.85)))
                break
            case 3:
                cell.render(title: "Agresivo", result: String(Int(tdee * 0.80)))
                break
            case 4:
                cell.render(title: "Muy agresivo", result:  String(Int(tdee * 0.75)))
                break
            default:
                cell.render(title: "Nivel", result: "kcal/día")
                cell.contentView.backgroundColor = .hBsecundary
                break
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (goal == 0) {
            return "Ganar masa muscular"
        } else {
            return "Perdida de peso"
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if (goal == 0) {
            return "Estas son tus calorías para estar en superhábit calórico"
        } else {
            return "Estas son tus calorías para estar en déficit calórico"
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
