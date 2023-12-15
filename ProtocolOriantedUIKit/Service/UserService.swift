//
//  UserService.swift
//  ProtocolOriantedUIKit
//
//  Created by Vedat Dokuzkardeş on 12.12.2023.
//

import Foundation


protocol UserService {
    
    func fethUser(completion : @escaping(Result<User, Error>) -> Void)
}
