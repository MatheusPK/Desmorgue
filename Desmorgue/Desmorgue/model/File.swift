//
//  File.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation


class File : EventProtocol, FileProtocol, Codable {
    var owner:Profile
    var event: EventType
    
    var icon: String = ""
    var description: String
    var link: String
    var date: Date
    
    init(owner: Profile, event: EventType, description: String, link: String, date: Date){
        self.owner = owner
        self.event = event
        
        self.description = description
        self.link = link
        self.date = date
        
        owner.group[owner.currentGroup].log.append(Event(ownerProfile: owner, event: .File))
    }
}
