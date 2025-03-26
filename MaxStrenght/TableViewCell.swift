//
//  TableViewCell.swift
//  MaxStrenght
//
//  Created by MacMini6 on 24/03/25.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func didSelectThumbs(at indexPath: IndexPath, isThumbsUp: Bool)
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelAttempt: UILabel!
    @IBOutlet weak var txtKg: UITextField!
    @IBOutlet weak var thumpsDown: UIImageView!
    @IBOutlet weak var thumpsUp: UIImageView!
    @IBOutlet weak var cancelBtn: UIButton!
    
    weak var delegate: TableViewCellDelegate?
    var indexPath: IndexPath?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Enable interaction for thumbs up/down
        let thumbsUpTap = UITapGestureRecognizer(target: self, action: #selector(thumbsUpTapped))
        thumpsUp.isUserInteractionEnabled = true
        thumpsUp.addGestureRecognizer(thumbsUpTap)
        
        let thumbsDownTap = UITapGestureRecognizer(target: self, action: #selector(thumbsDownTapped))
        thumpsDown.isUserInteractionEnabled = true
        thumpsDown.addGestureRecognizer(thumbsDownTap)
        
        resetSelection()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
   
    }
 
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        print("Cancel Button Tapped")
    }
    
    @objc func thumbsUpTapped() {
           guard let indexPath = indexPath else { return }
           setThumbsUpSelected(true)
           delegate?.didSelectThumbs(at: indexPath, isThumbsUp: true)
       }

       @objc func thumbsDownTapped() {
           guard let indexPath = indexPath else { return }
           setThumbsUpSelected(false)
           delegate?.didSelectThumbs(at: indexPath, isThumbsUp: false)
       }

       func setThumbsUpSelected(_ isThumbsUp: Bool) {
           thumpsUp.image = UIImage(named: isThumbsUp ? "colorThumpsUP" : "thumpsUp")
           thumpsDown.image = UIImage(named: isThumbsUp ? "thumpsDown" : "colorThumpsDown")
       }

       func resetSelection() {
           thumpsUp.image = UIImage(named: "thumpsUp")
           thumpsDown.image = UIImage(named: "thumpsDown")
       }
    
}
