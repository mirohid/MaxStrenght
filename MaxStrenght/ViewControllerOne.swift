//
//  ViewControllerOne.swift
//  MaxStrenght
//
//  Created by MacMini6 on 24/03/25.
//

import UIKit

class ViewControllerOne: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
 
    @IBAction func LetsGoBtnClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let nextVC = storyboard.instantiateViewController(withIdentifier: "ViewControllerTwo") as? ViewControllerTwo {
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        
    }
}
