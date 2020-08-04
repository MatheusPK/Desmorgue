//
//  HomeView.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 03/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation
import SwiftUI

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



struct Home:View {
    
    
    
    var body: some View{
        ScrollView(.vertical){
            VStack(){
                HomeTop()
                
                Spacer()
                    .frame(height: 25)
                
                HomeMembers()
                
                Spacer()
                    .frame(height: 15)
                
                HomeGoal()
                
                Spacer()
                    .frame(height: 15)
                
                HomeLog()
            }
        }
    }
}



struct HomeTop:View {
    var profile = dao.userProfile
    var group = dao.userProfile.group[dao.userProfile.currentGroup]
    
    var body: some View{
        HStack(){
            if group.picture != ""{
                Button(action: { ContentView().isMenuActive = true}){
                    Image(group.picture)
                        .frame(width: 50, height: 50, alignment: .center)
                }
            }
            else{
                Button(action: {ContentView().isMenuActive = true}){
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(.yellow)
                }
            }
            
            Spacer()
            
            Text(group.name)
                .font(.system(size: 30))
            
            Spacer()
            
            Button(action: {ContentView().profilePage = true}){
                Circle()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.blue)
            }
        }.padding(.horizontal, 15)
    }
}


struct HomeMembers:View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    var membersPictures = getPictures(group: group)
    var membersNames = getNames(group: group)
    var membersCount = group.members.count
    
    
    
    var body: some View{
        HStack(){
            VStack(spacing: 5){
                
                HStack(){
                    Text("Integrantes do Grupo:")
                        .padding(.trailing)
                        .font(.system(size: 25))
                    
                    Spacer()
                }.padding(.leading, 10)
                
                ScrollView(.horizontal){
                    
                    HStack(spacing: 20){
                        ForEach(0...(membersCount-1), id: \.self) {i in
                            VStack(spacing: 0){
                                if self.membersPictures.count != 0{
                                    if self.membersPictures[i] != nil{
                                        Image("\(self.membersPictures[i])")
                                            .frame(width: 50, height: 50)
                                    }
                                    else{
                                        Circle()
                                        .frame(width: 50, height: 50)
                                            .foregroundColor(.pink)
                                    }
                                }
                                else{
                                    Circle()
                                    .frame(width: 50, height: 50)
                                        .foregroundColor(.red)
                                }
                                
                                
                                Text("\(self.membersNames[i])")
                                    .font(.system(size: 18))
                            }
                        }
                    }
                    
                    
                }.padding(.leading, 20)
            }
        }
    }
}



struct HomeGoal:View {
    var group = dao.userProfile.group[dao.userProfile.currentGroup]
    
    
    var body: some View{
        VStack(spacing: 0){
            HStack(){
                Text("Objetivos do Grupo:")
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
                
                Rectangle()
                    .cornerRadius(38)
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 2)
                
                Text("\(group.goal)")
                    .padding(.horizontal, 25)
                    .padding(.vertical, 15)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.leading)
                
                
                
            }
        }
    }
}



struct HomeLog:View {
    var log = dao.userProfile.group[dao.userProfile.currentGroup].log
    
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
            
            
        }
        
    }
}



func getPictures(group: Group) -> [String]{
    var pics:[String] = []
    for member in group.members {
        if member.picture != nil{
            pics.append(member.picture!)
        }
    }
    return pics
}


func getNames(group: Group) -> [String]{
    var names:[String] = []
    for member in group.members {
        names.append(member.name)
    }
    return names
}
