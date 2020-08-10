//
//  File.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation


class File : EventProtocol, FileProtocol, Codable, ObservableObject, Hashable {
    
    private var id = UUID()
    var owner:Profile
    var eventType: EventType
    
    var icon: String = "folder"
    var description: String
    var link: String
    var date: Date
    
    init(owner: Profile, description: String, link: String, date: Date, group: Group){
        self.owner = owner
        self.eventType = .File
        
        self.description = description
        self.link = link
        self.date = date
        
        group.log.append(Event(ownerProfile: owner, event: .File, icon: icon))
    }
    
    static func == (lhs: File, rhs: File) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }

}
