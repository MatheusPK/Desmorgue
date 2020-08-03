//
//  SubBoard.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 03/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation

class SubBoard{
    var name: String
    var content:[Activity]
    
    
    init(name: String, content: [Activity]) {
        self.name = name
        self.content = content
    }
    
}
