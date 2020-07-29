//
//  Grupo.swift
//  Desmorgue
//
//  Created by Lidiane Chen on 24/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation
import SwiftUI

class Board {
    var files:[File] = []
    var notices:[Notice] = []
    var tasks:[Task] = []
}

class Group {
    var name:String
    var picture:String?
    var goal:String
    var members:[Profile] = []
    var board:Board
    var chat:String?
    var timeline:Timeline
    var log:Log
    
    init(name: String, goal: String, owner: Profile) {
        self.name = name
        self.goal = goal
        self.board = Board()
        self.timeline = Timeline()
        self.log = Log()
        self.members.append(owner)
    }
}

class Profile {
    var id:Int = 0
    var name:String = "User"
    var picture: String
}

class Tag {
    var icon:String
    var description:String
    var deadline:Date?
    var type:boardType
    
    init(type: boardType, description: String) {
        self.type = type
        self.description = description
        self.icon = type.rawValue
    }
}

class File {
    let icon = "file.png"
    var title:String
    var description:String
    var download:String
    var date:Date
    
    init(title: String, description:String, download: String, date: Date) {
        self.title = title
        self.description = description
        self.download = download
        self.date = date
    }
}

class Task {
    let icon = "task.png"
    var title:String
    var description:String?
    var date:Date
    var deadline:Date
    
    init(title: String, description:String, deadline: Date, date: Date) {
        self.title = title
        self.description = description
        self.deadline = deadline
        self.date = date
    }
}

class Notice {
    let icon = "notice.png"
    var title:String
    var description:String?
    var date:Date
    
    init(title: String, description:String, date: Date) {
        self.title = title
        self.description = description
        self.date = date
    }
}

class Timeline:View {
    var nodes:[TimelineNode] = []
    
    func addNode() {
        var deadline = '25/06/2001'
        var title = "birthday"
        var description = "festa boladona e muita braba, comprar bolinho boladao"
        var newNode = TimelineNode(deadline: deadline, title: title, description: description)
        nodes.append(newNode)
    }
    
}

class TimelineNode:View {
    
    var deadline:Date
    var title:String
    var description:String
    var link:String?
    
    init(deadline: Date, title: String, description: String) {
        self.deadline = deadline
        self.title = title
        self.description = description
    }
}

class Log:View {
    var events:[Event] = []
    
    func update(caller: eventType, owner: Profile) {
        var icon:String
        var title:String
        let owner = owner
        if(caller == .UserEvent) {
            icon = owner.picture
            title = "\(owner.name) adicionou uma "
        }
        else {
            
        }
        
        let newEvent = Event(title: title, icon: icon, owner: owner)
        self.events.append(newEvent)
    }
}

class Event {
    var title:String
    var icon:String
    var owner:Profile
    
    init(title: String, icon: String, owner: Profile) {
        
    }
    
    
}

enum boardType {
    case File
    case Notice
    case Task
}

enum eventType {
    case UserEvent // entrada, saida, demorgue
    case GroupEvent // file, task, notice, timeline
}

