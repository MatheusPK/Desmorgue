//
//  Profile.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation


class Profile:Codable, ObservableObject{
    //Variáveis da Classe
    var id:Int = 0
    var name:String
    var email: String = "user@gmail.com"
    var picture: String?
    var group: [Group] = []
    public var currentGroup = 0

    
    init(name: String){
        self.name = name
    }
    
}
