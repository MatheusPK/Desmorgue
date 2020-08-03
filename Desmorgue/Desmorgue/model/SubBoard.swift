//
//  SubBoard.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation


class SubBoard{
    var name: String
    var description: String
    var content: [Activity] = []
    var download: String?
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
}
