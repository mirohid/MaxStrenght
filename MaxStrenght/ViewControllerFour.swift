//
//  ViewControllerFour.swift
//  MaxStrenght
//
//  Created by MacMini6 on 24/03/25.
//

import UIKit

class ViewControllerFour: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
   // var attempts: [String] = ["Attempt 1"]
    var attempts: [Bool?] = [nil]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationItem.hidesBackButton = true
        
        // Register TableViewCell
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cellone")
       
    }

    @IBAction func backBtnTapped(_ sender: UIButton) {
        print("Back Button Tapped")
        self.navigationController?.popViewController(animated: true)
    }
}

//extension ViewControllerFour: UITableViewDataSource, UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return attempts.count  // Number of rows in table view
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        80
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellone", for: indexPath) as? TableViewCell else {
//            return UITableViewCell()
//        }
//        
//        cell.labelAttempt.text = attempts[indexPath.row]
//        cell.txtKg.placeholder = "00"
//        
//        // Reset images for new cells
//        cell.thumpsUp.image = UIImage(named: "thumpsUp")
//        cell.thumpsDown.image = UIImage(named: "thumpsDown")
//        
//        // Ensure only one selection per row
//        cell.thumbsUpSelected = false
//        cell.thumbsDownSelected = false
//        
//        // Pass reference of `ViewControllerFour` to the cell
//        cell.delegate = self
//        cell.indexPath = indexPath  // Keep track of row index
//        
//        return cell
//    }
//}
//
//
//// MARK: - Cell Delegate to Handle Selections
//extension ViewControllerFour: TableViewCellDelegate {
//    
//    func didSelectThumbsUp(at indexPath: IndexPath) {
//        guard indexPath.row == attempts.count - 1, attempts.count < 5 else { return }
//
//        // Add a new row only if it's the last row and max 5 rows
//        attempts.append("Attempt \(attempts.count + 1)")
//        tableView.reloadData()
//    }
//
//    func didSelectThumbsDown(at indexPath: IndexPath) {
//        guard indexPath.row == attempts.count - 1, attempts.count < 5 else { return }
//
//        // Add a new row only if it's the last row and max 5 rows
//        attempts.append("Attempt \(attempts.count + 1)")
//        tableView.reloadData()
//    }
//}

extension ViewControllerFour: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attempts.count
        
    
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellone", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }

        cell.labelAttempt.text = "Attempt \(indexPath.row + 1)"
        cell.txtKg.placeholder = "00"
        
        // Set default images
        if let isThumbsUp = attempts[indexPath.row] {
            cell.setThumbsUpSelected(isThumbsUp)
        } else {
            cell.resetSelection()
        }

        // Pass reference of `ViewControllerFour` to the cell
        cell.delegate = self
        cell.indexPath = indexPath

        return cell
    }
}

// MARK: - Cell Delegate to Handle Selections
extension ViewControllerFour: TableViewCellDelegate {

    
    
    func didSelectThumbs(at indexPath: IndexPath, isThumbsUp: Bool) {
        // Update selection state for that row
        attempts[indexPath.row] = isThumbsUp

        // Add a new row only if the last row is interacted with and we haven't reached 5 rows
        if indexPath.row == attempts.count - 1, attempts.count < 5 {
            attempts.append(nil) // Add new empty row
        }
        
        tableView.reloadData()
    }
}
