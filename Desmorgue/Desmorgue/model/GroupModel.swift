//
//  Group.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 03/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation

class GroupModel:Codable, ObservableObject {
    
    /*private var boardData:[Data] = []
    
    var board: [EventProtocol] {
        get{
            return self.boardData.compactMap{
                (try? $0.convert(to: Task.self)) ?? (try? $0.convert(to: File.self)) ?? (try? $0.convert(to: Notice.self))
            }
        }
        set{
            boardData = (newValue as? [Task])
            (try? $0.newValue(to: load(from: oi))) ?? (try? $0.convert(to: File.self)) ?? (try? $0.convert(to: Notice.self))
        }
    }*/
    
    var taskBoard:[Task] = []
    var fileBoard:[File] = []
    var noticeBoard:[Notice] = []
    
    
    var name:String
    var picture:String = ""
    var goal:String
    var members:[Profile] = []
    var chat:String?
    var timeline:[Task] = []
    var log:[Event] = []
    
    init(name: String, goal: String, owner: Profile) {
        self.name = name
        self.goal = goal
        self.members.append(owner)
    }
    
}
