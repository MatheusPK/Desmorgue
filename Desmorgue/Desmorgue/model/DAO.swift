//
//  DAO.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 04/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation

var dao = (try? DAO.load()) ?? DAO()
class DAO: Codable, ObservableObject {
    var userProfile:Profile
    
    fileprivate init(){
        self.userProfile = Profile()
        self.groupMock()
        self.profilesMock(number: 3)
    }
    
    
    func groupMock(){
        let data = DateFormatter()
        data.dateFormat = "dd/MM/yyyy"
        let dataDeadline = data.date(from: "31/12/2020")
        let dataDate = data.date(from: "01/01/2020")
        
        //MOCK GROUP
        self.userProfile.group.append(Group(name: "Meu Grupo", goal: "Nosso objetivo é fazer com que você consiga se organizar em grupo e com isso ter um melhor resultado na sua jornada de Aprendiz!", owner: self.userProfile))
        
        
        //MOCK BOARDS
        let task = Task(owner: self.userProfile, event: .Task,title: "Entender a mecânica do app", description: "Esse é mural de Tarefas. O app funciona com uma página inicial, uma sala de chat, uma página com Murais e uma linha do tempo integrada com esse mural de tarefas, isso tudo para que você consiga se organizar em grupo. Sua tarefa é dar uma explorada e nos dizer o que achou!", deadline: dataDeadline!, date: dataDate!)
        let file = File(owner: self.userProfile, event: .File, description: "Esse é o mural de arquivos, onde você pode compartilhar arquivos importantes com o seu grupo", link: "Nesse campo entra o link onde o download é disponibilizado", date: dataDate!)
        let notice = Notice(owner: self.userProfile, event: .Notice, title: "Tarefa nova adicionada! Confere lá", description: "Esse é o mural de avisos! Dê uma olhada também no seu mural de Tarefas.", date: dataDate!)
        
        
        self.userProfile.group[userProfile.currentGroup].noticeBoard.append(notice)
        self.userProfile.group[userProfile.currentGroup].taskBoard.append(task)
        self.userProfile.group[userProfile.currentGroup].fileBoard.append(file)

    }
    
    func profilesMock(number: Int){
        let group = userProfile.group[userProfile.currentGroup]
        for _ in 0...number{
            group.members.append(userProfile)
        }
    }
}
