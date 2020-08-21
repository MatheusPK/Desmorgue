//
//  BoardAddPage.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 20/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import SwiftUI

struct BoardAddPage: View {
    var profile = dao.userProfile
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    @Binding var isPresented: Bool
    @State private var title: String = ""
    @State private var description:String = ""
    @State private var deadline = Date()
    var body: some View {
        ScrollView {
            
            VStack {
                ZStack {
                    Rectangle().foregroundColor(.init(UIColor.systemGray5)).edgesIgnoringSafeArea(.top)
                    HStack {
                        Button(action: {
                            self.isPresented = false
                        }) {
                            Text("Fechar")
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            dao.userProfile.group[dao.userProfile.currentGroup].taskBoard.append(Task(owner: self.profile, title: self.title, description: self.description, deadline: self.deadline, date: Date(), group: self.profile.group[self.profile.currentGroup]))
                            self.isPresented = false
                            
                        }) {
                            Text("Confirmar")
                        }
                    }.padding(.horizontal, 10)
                }.frame(height: 50)
                
                Spacer(minLength: 15)
                TextField("Insira o nome da tarefa", text: $title).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1).padding(.horizontal, -5).frame(minHeight: 35))
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Spacer(minLength: 25)
                
                
                
                MultilineTextField("Insira uma descrição para a tarefa", text: $description).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1).padding(.horizontal, -5).frame(minHeight: 70))
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                Spacer(minLength: 25)
                
                
                
                
                Text("Prazo final da tarefa:").padding(.top, 10)
                DatePicker("", selection: $deadline, displayedComponents: .date)
                    .labelsHidden()
                
                
            }
        }
    }
}



