//
//  UserViewModelOutput.swift
//  ProtocolOriantedUIKit
//
//  Created by Vedat Dokuzkardeş on 15.12.2023.
//

import Foundation

protocol UserViewModelOutput : AnyObject {
    
    func updateView(name: String, email: String, userName: String)
}
