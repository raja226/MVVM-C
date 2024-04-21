//
//  LoginViewModel.swift
//  MVVMCPattern
//
//  Created by Administrator on 21/04/24.
//

import Foundation

class LoginViewModel
{
    var userName:String = ""
    var password:String = ""
    
    func login(completion: @escaping(Bool) ->Void )
    {
        let isLogin = !userName.isEmpty && !password.isEmpty
        completion(isLogin)
    }
}
