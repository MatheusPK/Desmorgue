//
//  DAO.swift
//  Desmorgue
//
//  Created by Matheus Kulick on 04/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation

let dao = DAO()

class DAO {
    static var instance = DAO()
    
    var userProfile:Profile
    
    fileprivate init() {
        self.userProfile = Profile()
        self.userProfile.groupMock()
    }
}
