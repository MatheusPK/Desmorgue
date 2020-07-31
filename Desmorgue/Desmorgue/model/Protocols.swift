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


protocol TaskProtocol {
    var owner:Profile {get set}
}

protocol NoticeProtocol {
    var owner:Profile {get set}
}

protocol FileProtocol {
    var owner:Profile {get set}
}

