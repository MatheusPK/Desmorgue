//
//  Event.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation




class Event: EventProtocol, Codable, ObservableObject {
    
    //Variáveis do Protocolo
    var owner: Profile
    var eventType: EventType
    
    //Variáveis da Classe
    var description:String
    var icon:String
    var associatedObject:Data?
    
    init(ownerProfile: Profile, event: EventType, icon: String){
        self.owner = ownerProfile
        self.eventType = event
        self.icon = icon
        self.description = owner.name + self.eventType.rawValue
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
