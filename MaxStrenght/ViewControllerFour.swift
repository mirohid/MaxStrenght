//
//  ViewControllerFour.swift
//  MaxStrenght
//
//  Created by MacMini6 on 24/03/25.
//

import UIKit

class ViewControllerFour: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var attempts: [Bool?] = [nil]
    
    
    @IBOutlet weak var endTest: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationItem.hidesBackButton = true
        endTestTapGestures()
        
        // Register TableViewCell
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cellone")
       
    }

    @IBAction func backBtnTapped(_ sender: UIButton) {
        print("Back Button Tapped")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private func endTestTapGestures() {
        let endTestTapGesture = UITapGestureRecognizer(target: self, action: #selector(endTestTapped))
        endTest.isUserInteractionEnabled = true 
        endTest.addGestureRecognizer(endTestTapGesture)
    }
    
    @objc func endTestTapped() {
        print("btn tapped")
        let vc = storyboard?.instantiateViewController(withIdentifier: "EndTestViewController") as! EndTestViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

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
        cell.delegate = self
        cell.indexPath = indexPath

        return cell
    }
}

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
