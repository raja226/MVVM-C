//
//  ViewController.swift
//  MVVMCPattern
//
//  Created by Administrator on 21/04/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    // MARK: - Properties
    var viewModel = LoginViewModel()
    var coordinator: LoginViewCoordinator? // Coordinator reference

    
    // MARK: - View LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction Methods
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        self.view.endEditing(true)
        debugPrint("loginButtonTapped")
        viewModel.userName = userNameTextField.text ?? ""
        viewModel.password = passwordTextField.text ?? ""
        
        viewModel.login { success in
            if success
            {
                print("Login successful")
                
            }else
            {
                print("Login fail")
                
            }
        }
        
    }
    @IBAction func forgotButtonTapped(_ sender: UIButton) {
        debugPrint("forgotButtonTapped")
        // Ensure coordinator is initialized and assigned
            if let coordinator = coordinator {
                coordinator.navigateToForgotPassword()
            } else {
                print("Coordinator is nil")
            }
       
            // Call coordinator method
            //coordinator.navigateToForgotPassword()
    }
    
    // MARK: - Private Methods
    
    private func configureTextFields()
    {
        passwordTextField.delegate = self
        userNameTextField.delegate = self
    }
    
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

