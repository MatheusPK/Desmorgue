//
//  HomeView.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 03/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation
import SwiftUI


let sectionSpacer:CGFloat = 20
let inSectionSpacer:CGFloat = 15




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



struct Home:View {
    var profile = dao.userProfile
    var group = dao.userProfile.group[dao.userProfile.currentGroup]
    
    
    var body: some View{
            VStack(){
                ViewTop(title: group.name)
                
                Spacer()
                    .frame(height: sectionSpacer - 10)
                
                HomeMembers()
                
                Spacer()
                    .frame(height: sectionSpacer)
                
                HomeGoal()
                
                Spacer()
                    .frame(height: sectionSpacer)
                
                HomeLog()
            }
    }
}

struct HomeMembers:View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    @State var members = group.members
    
    
    
    var body: some View{
        HStack(){
            VStack(spacing: 5){
                
                HStack(){
                    Text("Integrantes do Grupo:")
                        .padding(.trailing)
                        .font(.system(size: 25))
                    
                    Spacer()
                }.padding(.leading, 10)
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 20){
                        ForEach(0...(members.count-1), id: \.self) {i in
                            VStack(spacing: 0){
                                if self.members[i].picture != nil{
                                    Image(self.members[i].picture!)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                    }
                                    else{
                                        Image(systemName: "person.crop.square")
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.blue)
                                            .scaleEffect(2.5)
                                            .opacity(0.7)
                                    }
                                Text("\(self.members[i].name)")
                                    .font(.system(size: 16))
                            }
                        }
                        VStack(spacing: 0){
                            
                            Image(systemName: "plus")
                                .scaleEffect(2)
                                .frame(width: 30, height: 30)
                                .padding(.bottom)
                        }
                    }.padding(.horizontal, 20)
                }
            }
        }
    }
}



struct HomeGoal:View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    
    
    var body: some View{
        
        
        
        VStack(spacing: 0){
            
            HStack(){
                
                Text("Objetivo do Grupo:")
                    .padding(.trailing)
                    .font(.system(size: 25))
                
                Spacer()
                
            }.padding(.leading, 10)
            
            Spacer().frame(height:15)
            
            ZStack(){
                
                Rectangle()
                    .cornerRadius(40)
                    .foregroundColor(.black)
                    .padding(.horizontal, 15)
                    .frame(height: 60)
                
                Rectangle()
                    .cornerRadius(38)
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 2)
                    .frame(height: 60)
                
                Text("\(HomeGoal.group.goal)")
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .multilineTextAlignment(.leading)
                
                
                
            }
        }
    }
}



struct HomeLog:View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    @State var log = group.log//.reversed()
    
    
    var body: some View{
            VStack(spacing: 0){
                HStack(){
                    
                    Text("Atividades Recentes:")
                        .padding(.trailing)
                        .font(.system(size: 25))
                    
                    Spacer()
                    
                }.padding(.leading, 10)
                
                Spacer()
                    .frame(height: 15)
                
                ScrollView(.vertical) {
                
                VStack(spacing: 15){
                    
                    ForEach(0...(self.log.count-1), id: \.self) {i in
                        HStack(spacing: 5){
                            
                            if self.log[i].eventType == EventType.File || self.log[i].eventType == EventType.Task || self.log[i].eventType == EventType.Notice {
                                
                                Image(systemName: self.log[i].icon!)
                                    .frame(width: 50, height: 50)
                                    .scaleEffect(2)
                                    .padding(.leading)
                            }
                            else if self.log[i].eventType == EventType.TimelineNode{
                                
                                Image(systemName: "calendar")
                                    .frame(width: 50, height: 50)
                                    .scaleEffect(2)
                                    .padding(.leading)
                            }
                                
                                
                                
                                /*
                                 else if (self.logEvents[i] == EventType.Exited || self.logEvents[i] == EventType.Joined) && self.logIcons[i] != "null"{
                                 Image(self.logIcons[i])
                                 .frame(width: 100, height: 50)
                                 .padding(.leading)
                                 }
                                 else if (self.logEvents[i] == EventType.Exited || self.logEvents[i] == EventType.Joined) && self.logIcons[i] == "null"{
                                 
                                 Image(systemName: "person.crop.square")
                                 .frame(width: 100, height: 50)
                                 .padding(.leading)
                                 }*/
                                
                                
                                
                            else{
                                Image(systemName: "person.crop.square")
                                    .frame(width: 50, height: 50)
                                    .scaleEffect(2)
                                    .padding(.leading)
                            }
                            
                            
                            Text("\(self.log[i].description)")
                            
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
