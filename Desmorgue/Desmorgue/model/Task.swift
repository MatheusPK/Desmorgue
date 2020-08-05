//
//  Task.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation

class Task : EventProtocol, TaskProtocol, Codable, ObservableObject{
    var owner:Profile
    var eventType: EventType
    
    var icon: String = "doc.on.clipboard"
    var title: String
    var description: String
    var deadline: Date
    var date: Date
    
    
    init(owner: Profile, title: String, description: String, deadline: Date, date: Date){
        self.owner = owner
        self.eventType = .Task
        
        self.title = title
        self.description = description
        self.deadline = deadline
        self.date = date
        
        owner.group[owner.currentGroup].timeline.append(self)
        owner.group[owner.currentGroup].log.append(Event(ownerProfile: owner, event: .Task, icon: icon))
    }
}
