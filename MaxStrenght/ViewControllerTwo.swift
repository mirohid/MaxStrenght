//
//  ViewControllerTwo.swift
//  MaxStrenght
//
//  Created by MacMini6 on 24/03/25.
//

import UIKit

class ViewControllerTwo: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var selectionTxtField: UITextField!
    @IBOutlet weak var viewProgressBgImage: UIImageView!
    @IBOutlet weak var startTestBgImg: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    
    let pickerView = UIPickerView()
    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
    
    // Default images (before selection)
    let defaultViewProgressImage = "framelessBg"
    let defaultStartTestImage = "grayBg"
    
    // Images after selection
    let selectedViewProgressImage = "viewColor"
    let selectedStartTestImage = "viewColor2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setupPickerView()
    }
    
    private func setupPickerView() {
           pickerView.delegate = self
           pickerView.dataSource = self

           // Set picker as input for the text field
           selectionTxtField.inputView = pickerView

           // Add toolbar with Done button
           let toolbar = UIToolbar()
           toolbar.sizeToFit()
           let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
           toolbar.setItems([doneButton], animated: false)
           selectionTxtField.inputAccessoryView = toolbar
       }
    
    
    // MARK: - UIPickerView DataSource
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }

       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return options.count
       }

       // MARK: - UIPickerView Delegate
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return options[row]
       }

       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           selectionTxtField.text = options[row]
           
           // Toggle the images when an option is selected
           viewProgressBgImage.image = UIImage(named: selectedViewProgressImage)
           startTestBgImg.image = UIImage(named: selectedStartTestImage)
       }

       @objc func doneTapped() {
           selectionTxtField.resignFirstResponder()
       }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
