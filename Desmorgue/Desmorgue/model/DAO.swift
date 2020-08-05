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
    var profiles:[Profile] = []
    var userProfile: Profile
    
    fileprivate init(){
        self.userProfile = Profile(name: "User")
        self.profiles.append(self.userProfile)
        self.groupMock()
        self.tasksMock()
    }
    
    
    
    func groupMock(){
        let data = DateFormatter()
        data.dateFormat = "dd/MM/yyyy"
        let dataDeadline = data.date(from: "31/12/2020")
        let dataDate = data.date(from: "01/01/2020")
        
        //MOCK GROUP
        self.userProfile.group.append(Group(name: "Meu Grupo", goal: "Nosso objetivo é fazer com que você consiga se organizar em grupo e com isso ter um melhor resultado na sua jornada de Aprendiz!", owner: self.userProfile))
        
        
        self.profilesMock(number: 6)
        
        //MOCK BOARDS
        let task = Task(owner: self.userProfile,title: "Entender a mecânica do app", description: "Esse é mural de Tarefas. O app funciona com uma página inicial, uma sala de chat, uma página com Murais e uma linha do tempo integrada com esse mural de tarefas, isso tudo para que você consiga se organizar em grupo. Sua tarefa é dar uma explorada e nos dizer o que achou!", deadline: dataDeadline!, date: dataDate!)
        let file = File(owner: self.userProfile, description: "Esse é o mural de arquivos, onde você pode compartilhar arquivos importantes com o seu grupo", link: "Nesse campo entra o link onde o download é disponibilizado", date: dataDate!)
        let notice = Notice(owner: self.userProfile, title: "Tarefa nova adicionada! Confere lá", description: "Esse é o mural de avisos! Dê uma olhada também no seu mural de Tarefas.", date: dataDate!)
        
        
        self.userProfile.group[userProfile.currentGroup].noticeBoard.append(notice)
        self.userProfile.group[userProfile.currentGroup].taskBoard.append(task)
        self.userProfile.group[userProfile.currentGroup].fileBoard.append(file)

    }
    
    func profilesMock(number: Int){
        let group = userProfile.group[userProfile.currentGroup]
        for i in 1...number-1{
            let newUser = Profile(name: "User \(i + 1)")
            group.members.append(newUser)
            group.log.append(Event(ownerProfile: newUser, event: .Joined, icon: newUser.picture))
        }
    }
    
    func tasksMock() {
        let data = DateFormatter()
        data.dateFormat = "dd/MM/yyyy"
        let datas:[String] = ["01/07/2018", "25/06/2020", "17/09/2020", "25/10/2020"]
        let dataDate = data.date(from: "01/01/2020")
        for i in 0...3{
            let dataDeadline = data.date(from: datas[i])
            let task = Task(owner: self.userProfile,title: "Tarefa \(i)", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed enim ut sem viverra aliquet eget sit amet. Semper feugiat nibh sed pulvinar proin. Pharetra et ultrices neque ornare aenean euismod elementum nisi quis. ", deadline: dataDeadline!, date: dataDate!)
            userProfile.group[userProfile.currentGroup].taskBoard.append(task)
        }
    }
}
