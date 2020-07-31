//
//  Protocols.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation

protocol EventProtocol {
    var owner:Profile {get set}
    var event:EventType {get set}
    
}

enum EventType{
    case Joined
    case Exited
    case Task
    case Notice
    case File
}
