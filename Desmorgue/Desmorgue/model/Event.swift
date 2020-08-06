//
//  Event.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation




class Event: EventProtocol, Codable, ObservableObject, Hashable {
    
    //Variáveis do Protocolo
    var owner: Profile
    var eventType: EventType
    private var id = UUID()
    
    //Variáveis da Classe
    var description:String
    var icon:String?
    var associatedObject:Data?
    
    init(ownerProfile: Profile, event: EventType, icon: String?){
        self.owner = ownerProfile
        self.eventType = event
        if icon != nil{
            self.icon = icon!
        }
        else{
            self.icon = nil
        }
        self.description = owner.name + self.eventType.rawValue
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
}


enum EventType : String, Codable{
    case Joined = " entrou no grupo"
    case Exited = " saiu do grupo"
    case Task = " adicionou uma nova tarefa"
    case Notice = " adicionou um novo aviso"
    case File = " adicionou um novo arquivo"
    case TimelineNode = " adicionou um novo evento na linha do tempo"
}
