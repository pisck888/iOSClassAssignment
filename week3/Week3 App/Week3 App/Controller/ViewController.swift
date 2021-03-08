//
//  ViewController.swift
//  Week3 App
//
//  Created by TSAI TSUNG-HAN on 2021/3/8.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var logInSegmentControl: UISegmentedControl!
  @IBOutlet weak var accountTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var checkTextField: UITextField!
  @IBOutlet weak var checkLable: UILabel!
  
  @IBAction func didChangeSegmentControl(_ sender: UISegmentedControl) {
    if sender.selectedSegmentIndex == 0 {
      disableCheckTextField()
      clearAllTextField()
    }else{
      enableCheckTextField()
      clearAllTextField()
    }
  }
  
  @IBAction func goButton(_ sender: UIButton) {
    //MARK: - login check
    if logInSegmentControl.selectedSegmentIndex == 0{
      switch(accountTextField.text , passwordTextField.text){
      case("appworks_school@gmail.com" , "1234"):
        showAlert(title: "Log in", message: "suceesfully.")
      default:
        showAlert(title: "Error", message: "Login fail")
      }
    //MARK: - signup check
    }else{
      if accountTextField.text == "" {
        showAlert(title: "Error", message: "Account should not be empty.")
      }else if passwordTextField.text == "" {
        showAlert(title: "Error", message: "Password should not be empty.")
      }else if checkTextField.text == "" {
        showAlert(title: "Error", message: "Check Password should not be empty.")
      }else if passwordTextField.text != checkTextField.text {
        showAlert(title: "Error", message: "Your password and confirmation password do not match.")
      }else {
        showAlert(title: "Sign up", message: "suceesfully.")
      }
    }
  }
  
  
  
  func disableCheckTextField(){
    checkLable.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    checkTextField.isEnabled = false
    checkTextField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
  }
  
  func enableCheckTextField(){
    checkLable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    checkTextField.isEnabled = true
    checkTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
  }
  
  func clearAllTextField(){
    accountTextField.text = ""
    passwordTextField.text = ""
    checkTextField.text = ""
  }
  
  func showAlert(title:String, message:String){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    disableCheckTextField()
  }

}

//MARK: - hide the keyboard
extension UIViewController: UITextFieldDelegate{
  open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
}


