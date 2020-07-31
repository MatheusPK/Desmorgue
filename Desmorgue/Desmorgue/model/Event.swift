//
//  Event.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation




class Event: EventProtocol {
    
    //Variáveis do Protocolo
    var owner: Profile
    var event: EventType
    
    //Variáveis da Classe
    var description:String
    var associatedObject:(Task, File, Notice, Profile)?
    
    init(ownerProfile: Profile, event: EventType){
        self.owner = ownerProfile
        self.event = event
        self.description = owner.name + self.event.rawValue
    }
    
}


enum EventType : String{
    case Joined = "entrou no grupo"
    case Exited = "saiu do grupo"
    case Task = "adicionou uma tarefa"
    case Notice = "adicionou um aviso"
    case File = "adicionou um arquivo"
    case TimelineNode = "adicionou um evento na linha do tempo"
}
