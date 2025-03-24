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
        setupTapGestures()  // Setup tap gestures for images
        disableImageClicks()  // Initially make images unclickable
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
    
    
    // Disable interactions before selection
      private func disableImageClicks() {
          viewProgressBgImage.isUserInteractionEnabled = false
          startTestBgImg.isUserInteractionEnabled = false
      }

      // Enable interactions after selection
      private func enableImageClicks() {
          viewProgressBgImage.isUserInteractionEnabled = true
          startTestBgImg.isUserInteractionEnabled = true
      }

      // Setup Tap Gesture Recognizers
      private func setupTapGestures() {
          let startTestTapGesture = UITapGestureRecognizer(target: self, action: #selector(startTestTapped))
          startTestBgImg.addGestureRecognizer(startTestTapGesture)

          let viewProgressTapGesture = UITapGestureRecognizer(target: self, action: #selector(viewProgressTapped))
          viewProgressBgImage.addGestureRecognizer(viewProgressTapGesture)
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
           
           enableImageClicks()
          
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
    
    // MARK: - Navigate to ViewControllerThree when tapping on startTestBgImg
     @objc func startTestTapped() {
         let vc = storyboard?.instantiateViewController(withIdentifier: "ViewControllerFour") as! ViewControllerFour
         self.navigationController?.pushViewController(vc, animated: true)
     }

     // Optional: If you want an action when tapping viewProgressBgImage
     @objc func viewProgressTapped() {
         print("View Progress Tapped!")
     }
 
}
