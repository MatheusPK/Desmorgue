//
//  Grupo.swift
//  Desmorgue
//
//  Created by Lidiane Chen on 24/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation

class Group{
    var name:String
    var picture:String
    var goal:String
    var members:[Profile]
    var board:Board
    var chat:String?
    var timeline:Timeline
    var log:Log
    
}

class Profile{
    
}

class Board{
    var files:[File]
    var notices:[Notice]
    var tasks:[Task]
}

class Tag{
    var icon:String
    var description:String
    var deadline:Date?
    
}

class Timeline{
    
}

class Log{
    
}

