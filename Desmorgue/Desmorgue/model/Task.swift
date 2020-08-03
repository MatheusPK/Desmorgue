//
//  Task.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation

class Task : Activity, TaskProtocol {
    var icon: String = ""
    var title: String
    var description: String
    var deadline: Date
    var date: Date
    
    
    init(owner: Profile, event: EventType, title: String, description: String, deadline: Date, date: Date){
        self.title = title
        self.description = description
        self.deadline = deadline
        self.date = date
        super.init(owner: owner, event: event)
        owner.group[owner.currentGroup].timeline.append(self)
        owner.group[owner.currentGroup].log.append(Event(ownerProfile: owner, event: .Task))
    }
}
