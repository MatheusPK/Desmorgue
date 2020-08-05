//
//  Notice.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation

class Notice : EventProtocol, NoticeProtocol, Codable, ObservableObject {
    var owner:Profile
    var eventType: EventType
    
    var icon: String = "exclamationmark.triangle"
    var title: String
    var description: String
    var date: Date
    
    init(owner: Profile,title: String, description: String, date: Date){
        self.owner = owner
        self.eventType = .Notice
        
        self.title = title
        self.description = description
        self.date = date
        
        owner.group[owner.currentGroup].log.append(Event(ownerProfile: owner, event: .Notice, icon: icon))
    }
    
}
