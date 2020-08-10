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
        self.userProfile = Profile(name: "Lidiane")
        self.userProfile.picture = "lidi"
        self.profiles.append(self.userProfile)
        self.impre3D()
    }
    
    
    
    func groupMock(){
        let data = DateFormatter()
        data.dateFormat = "dd/MM/yyyy"
        let dataDeadline = data.date(from: "31/12/2020")
        let dataDate = data.date(from: "01/01/2020")
        
        //MOCK GROUP
        self.userProfile.group.append(Group(name: "Meu Grupo", goal: "Nosso objetivo é fazer com que você consiga se organizar em grupo e com isso ter um melhor resultado na sua jornada de Aprendiz!", owner: self.userProfile))
        
        
        self.profilesMock()
        
        //MOCK BOARDS
        let noticeEncontro = Notice(owner: self.userProfile, title: "Encontro Quinta 19:00", description: "Marcamos nosso encontro pra essa quinta 19:00. Vamos decidir nossos horários e como preferios seguir co o grupo", date: dataDate!, group: self.userProfile.group[self.userProfile.currentGroup])
        let task = Task(owner: self.userProfile,title: "Entender a mecânica do app", description: "Esse é mural de Tarefas. O app funciona com uma página inicial, uma sala de chat, uma página com Murais e uma linha do tempo integrada com esse mural de tarefas, isso tudo para que você consiga se organizar em grupo. Sua tarefa é dar uma explorada e nos dizer o que achou!", deadline: dataDeadline!, date: dataDate!, group: self.userProfile.group[self.userProfile.currentGroup])
        let file = File(owner: self.userProfile, description: "Esse é o mural de arquivos, onde você pode compartilhar arquivos importantes com o seu grupo", link: "Nesse campo entra o link onde o download é disponibilizado", date: dataDate!, group: self.userProfile.group[self.userProfile.currentGroup])
        let notice = Notice(owner: self.userProfile, title: "Tarefa nova adicionada! Confere lá", description: "Esse é o mural de avisos! Dê uma olhada também no seu mural de Tarefas.", date: dataDate!, group: self.userProfile.group[self.userProfile.currentGroup])
        
        
        
        self.userProfile.group[userProfile.currentGroup].noticeBoard.append(notice)
        self.userProfile.group[userProfile.currentGroup].noticeBoard.append(noticeEncontro)
        self.userProfile.group[userProfile.currentGroup].taskBoard.append(task)
        self.userProfile.group[userProfile.currentGroup].fileBoard.append(file)
        

    }
    
    func profilesMock(){
        let group = userProfile.group[userProfile.currentGroup]
        let prof2 = Profile(name: "Miranha")
        prof2.picture = "miranha"
        let prof3 = Profile(name: "Evelyn")
        prof3.picture = "evelyn"
        let prof4 = Profile(name: "Salles")
        prof4.picture = "salles"
        
        group.members.append(prof2)
        group.log.insert(Event(ownerProfile: prof2, event: .Joined, icon: prof2.picture), at: 0)
        
        group.members.append(prof3)
        group.log.insert(Event(ownerProfile: prof3, event: .Joined, icon: prof3.picture), at: 0)
        
        group.members.append(prof4)
        group.log.insert(Event(ownerProfile: prof4, event: .Joined, icon: prof4.picture), at: 0)

    }
    
    func tasksMock() {
        let data = DateFormatter()
        data.dateFormat = "dd/MM/yyyy"
        let datas:[String] = ["01/07/2018", "25/06/2020", "17/09/2020", "25/10/2020","25/10/2020","25/10/2020","25/10/2020","25/10/2020"]
        let dataDate = data.date(from: "01/01/2020")
        for dataV in datas {
            let dataDeadline = data.date(from: dataV)
            let task = Task(owner: self.userProfile,title: "Tarefa", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed enim ut sem viverra aliquet eget sit amet. Semper feugiat nibh sed pulvinar proin. Pharetra et ultrices neque ornare aenean euismod elementum nisi quis. ", deadline: dataDeadline!, date: dataDate!, group: self.userProfile.group[self.userProfile.currentGroup])
            userProfile.group[userProfile.currentGroup].taskBoard.append(task)
        }
    }
    
    func impre3D() {
        let grupo = Group(name: "Impressão 3D", goal: "Construir raquete de tenis 3d", owner: self.userProfile)
        self.userProfile.group.append(grupo)
        self.profilesMock()
        
        let data = DateFormatter()
        data.dateFormat = "dd/MM/yyyy"
        
        //tarefas
        let deadline1 = data.date(from: "10/08/2020")
        let data1 = data.date(from: "27/08/2020")
        let task1 = Task(owner: self.userProfile.group[self.userProfile.currentGroup].members[1], title: "Fazer um desenho técnico da raquete", description: "Buscar similares de raquete", deadline: deadline1!, date: data1!, group: self.userProfile.group[self.userProfile.currentGroup])
        
        let deadline2 = data.date(from: "17/08/2020")
        let data2 = data.date(from: "10/08/2020")
        
        let task2 = Task(owner: self.userProfile.group[self.userProfile.currentGroup].members[2], title: "Fazer modelagem 3d da raquete", description: "Escolher o melhor software para modelar", deadline: deadline2!, date: data2!, group: self.userProfile.group[self.userProfile.currentGroup])
        
        let deadline3 = data.date(from: "17/08/2020")
        let data3 = data.date(from: "10/08/2020")
        
        let task3 = Task(owner: self.userProfile.group[self.userProfile.currentGroup].members[3], title: "Primeiros testes de impressão com PLA", description: "verificar melhor temperatura de impressão para os testes", deadline: deadline3!, date: data3!, group: self.userProfile.group[self.userProfile.currentGroup])
        
        let deadline4 = data.date(from: "24/08/2020")
        let data4 = data.date(from: "17/08/2020")
        
        let task4 = Task(owner: self.userProfile.group[self.userProfile.currentGroup].members[0], title: "Testar protótipo com usuários", description: "Verificar a restistência da raquete e a ergonomia", deadline: deadline4!, date: data4!, group: self.userProfile.group[self.userProfile.currentGroup])
        
        grupo.taskBoard.append(task1)
        grupo.taskBoard.append(task2)
        grupo.taskBoard.append(task3)
        grupo.taskBoard.append(task4)
        
        // arquivos
        let file1 = File(owner: self.userProfile.group[self.userProfile.currentGroup].members[2], description: "Pessoal, deem uma olhada na qualidade dessa impressão.", link: "https://www.thingiverse.com/make:535682", date: data2!, group: self.userProfile.group[self.userProfile.currentGroup])
        
        let file2 = File(owner: self.userProfile.group[self.userProfile.currentGroup].members[3], description: "Galera, se liguem nesse aquivo de raquete que eu encontrei, boa referência.", link: "raquetedetenis.3dm", date: data2!, group: self.userProfile.group[self.userProfile.currentGroup])
        
        let data5 = data.date(from: "20/08/2020")
        
        let file3 = File(owner: self.userProfile.group[self.userProfile.currentGroup].members[0], description: "Gnt, olhem esse exemplo de teste com usuario, podemos testar esse método no nosso projeto tbm!", link: "teste.mp4", date: data5!, group: self.userProfile.group[self.userProfile.currentGroup])
        
        grupo.fileBoard.append(file1)
        grupo.fileBoard.append(file2)
        grupo.fileBoard.append(file3)
        
        //avisos
        let dataPadrao = data.date(from: "01/08/2020")
        let notice1 = Notice(owner: self.userProfile.group[self.userProfile.currentGroup].members[1], title: "Encontro 16:00 no ZOOM, as quintas", description: "Alinhamento de ideia", date: dataPadrao!, group: self.userProfile.group[self.userProfile.currentGroup])
        
        let notice2 = Notice(owner: self.userProfile, title: "Palestra sobre ender 3", description: "Dicas para modelar bem na ender 3 e boas práticas", date: dataPadrao!, group: self.userProfile.group[self.userProfile.currentGroup])
        
        grupo.noticeBoard.append(notice1)
        grupo.noticeBoard.append(notice2)
        
    }
}
