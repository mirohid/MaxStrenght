//
//  ViewControllerFour.swift
//  MaxStrenght
//
//  Created by MacMini6 on 24/03/25.
//

import UIKit

class ViewControllerFour: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
       
    }

    @IBAction func backBtnTapped(_ sender: UIButton) {
        print("Back Button Tapped")
        self.navigationController?.popViewController(animated: true)
    }
}
