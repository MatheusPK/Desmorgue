//
//  Profile.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation


class Profile{
    //Variáveis da Classe
    var id:Int = 0
    var name:String = "User"
    var email: String = "user@gmail.com"
    var picture: String?
    var group: [Group] = []
}
