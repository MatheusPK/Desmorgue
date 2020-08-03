//
//  Group.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 03/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation

class Group {
    var name:String
    var picture:String?
    var goal:String
    var members:[Profile] = []
    var board: [Activity] = []
    var chat:String?
    var timeline:[Activity] = []
    var log:[Event] = []
    
    init(name: String, goal: String, owner: Profile) {
        self.name = name
        self.goal = goal
        self.members.append(owner)
    }
    
}
