//
//  File.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation


class File : EventProtocol, FileProtocol, Codable, ObservableObject {
    var owner:Profile
    var eventType: EventType
    
    var icon: String = "folder"
    var description: String
    var link: String
    var date: Date
    
    init(owner: Profile, description: String, link: String, date: Date){
        self.owner = owner
        self.eventType = .File
        
        self.description = description
        self.link = link
        self.date = date
        
        owner.group[owner.currentGroup].log.append(Event(ownerProfile: owner, event: .File, icon: icon))
    }
}
