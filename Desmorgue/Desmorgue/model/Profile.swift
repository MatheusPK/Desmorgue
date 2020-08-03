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
    var currentGroup = 0
    
    func groupMock(){
        let data = DateFormatter()
        data.dateFormat = "dd/MM/yyyy"
        let dataDeadline = data.date(from: "31/12/2020")
        let dataDate = data.date(from: "01/01/2020")
        
        //MOCK GROUP
        self.group.append(Group(name: "Meu Grupo", goal: "Entender e aprender o Desmorgue", owner: self))
        
        
        //MOCK BOARDS
        let task = Task(owner: self, event: .Task,title: "Entender a mecânica do app", description: "Esse é mural de Tarefas. O app funciona com uma página inicial, uma sala de chat, uma página com Murais e uma linha do tempo integrada com esse mural de tarefas, isso tudo para que você consiga se organizar em grupo. Sua tarefa é dar uma explorada e nos dizer o que achou!", deadline: dataDeadline!, date: dataDate!)
        let file = File(owner: self, event: .File, description: "Esse é o mural de arquivos, onde você pode compartilhar arquivos importantes com o seu grupo", link: "Nesse campo entra o link onde o download é disponibilizado", date: dataDate!)
        let notice = Notice(owner: self, event: .Notice, title: "Tarefa nova adicionada! Confere lá", description: "Esse é o mural de avisos! Dê uma olhada também no seu mural de Tarefas.", date: dataDate!)
        
        
        self.group[currentGroup].board.append(notice)
        self.group[currentGroup].board.append(task)
        self.group[currentGroup].board.append(file)

    }
}
