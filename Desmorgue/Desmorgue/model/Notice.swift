//
//  Notice.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation

class Notice : Activity, NoticeProtocol {
    var icon: String = ""
    var title: String
    var description: String
    var date: Date
    
    init(owner: Profile, event: EventType,title: String, description: String, date: Date){
        self.title = title
        self.description = description
        self.date = date
        super.init(owner: owner, event: event)
        owner.group[owner.currentGroup].log.append(Event(ownerProfile: owner, event: .Notice))
    }
    
}
