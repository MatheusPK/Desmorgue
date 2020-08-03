//
//  Board.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 03/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation

class Board{
    var name: String
    var description: String
    var content: [Activity] = []
    var download: String?
    
    init(name: String, description: String, content: [Activity]) {
        self.name = name
        self.description = description
    }
    
}
