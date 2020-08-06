//
//  Profile.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation


class Profile:Codable, ObservableObject, Hashable{
    //Variáveis de Protocolo
    private var id = UUID()
    
    //Variáveis da Classe
    var userId:Int = 0
    var name:String
    var email: String = "user@gmail.com"
    var picture: String?
    var group: [Group] = []
    public var currentGroup = 0

    
    init(name: String){
        self.name = name
    }
    
    static func == (lhs: Profile, rhs: Profile) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
}
