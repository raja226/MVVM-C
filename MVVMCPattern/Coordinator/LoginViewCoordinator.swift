//
//  LoginViewCoordinator.swift
//  MVVMCPattern
//
//  Created by Administrator on 21/04/24.
//

import Foundation
import UIKit

class LoginViewCoordinator
{
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start()
    {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            guard let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
                fatalError("Failed to instantiate LoginViewController from storyboard")
            }
            
            // Set coordinator reference
            loginViewController.coordinator = self
            
            // Set the login view controller as the root view controller
            navigationController.setViewControllers([loginViewController], animated: false)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        
//        guard let loginVc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else
//        {
//            return
//        } 
//        
//        // Set coordinator reference
//        loginVc.coordinator = self
//               
//        // Push LoginViewController onto navigation stack
//        navigationController.pushViewController(loginVc, animated: true)
    }
    
    func navigateToForgotPassword() {
        let storyboard = UIStoryboard(name: "ForgotPassword", bundle: nil)
               guard let forgotPasswordVC = storyboard.instantiateInitialViewController() as? ForgotPasswordViewController else {
                   fatalError("Failed to instantiate ForgotPasswordViewController from storyboard")
               }
               navigationController.pushViewController(forgotPasswordVC, animated: true)
       }
       
}
