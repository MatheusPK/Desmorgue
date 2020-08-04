
//  Mural.swift
//  Desmorgue
//
//  Created by Lidiane Chen on 26/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import SwiftUI



struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}

struct BoardView:View {
    @State var index = 0
    @State var offset:CGFloat = 0
    var body: some View{
        VStack(spacing: 0){
            
            MuralTop()
            
            Spacer().frame(height: 15)
            
            AppBar(index: self.$index, offset: self.$offset)
            if self.index==0{
                Avisos()
            }
            else if self.index==1{
                Tarefas()
            }
            else if self.index==2{
                Arquivos()
            }
        }
    }
}

struct AppBar:View {
    @Binding var index:Int
    @Binding var offset: CGFloat
    var body: some View{
        VStack(alignment: .center, content: {
            
            HStack{
                Button(action: {
                    self.index = 0
                }) {
                    VStack(spacing: 8){
                        HStack(spacing: 12){
                        Image("bino")
                            .foregroundColor(self.index == 0 ? .black: Color.black.opacity(0.7))
                        Text("Avisos")
                            .foregroundColor(self.index == 0 ? .black: Color.black.opacity(0.7))
                        
                    }
                    Capsule()
                        .fill(self.index == 0 ? Color.black: Color.clear)
                        .frame(height: 4)
                        .padding(.horizontal, 5)
                    }
                }
                Button(action: {
                    self.index = 1
                }) {
                    VStack(spacing: 8){
                        HStack(spacing: 12){
                            Image("arquivos")
                                .foregroundColor(self.index == 1 ? .black: Color.black.opacity(0.7))
                            Text("Arquivos")
                                .foregroundColor(self.index == 1 ? .black: Color.black.opacity(0.7))
                                   
                        }
                        Capsule()
                            .fill(self.index == 1 ? Color.black: Color.clear)
                            .frame(height: 4)
                            .padding(.horizontal, 5)
                    }
                }
                Button(action: {
                    self.index = 2
                }) {
                    VStack(spacing: 8){
                        HStack(spacing: 12){
                            Image("tarefas")
                                .foregroundColor(self.index == 2 ? .black: Color.black.opacity(0.7))
                            Text("Tarefas")
                                .foregroundColor(self.index == 2 ? .black: Color.black.opacity(0.7))
                                   
                        }
                        Capsule()
                            .fill(self.index == 2 ? Color.black: Color.clear)
                            .frame(height: 4)
                            .padding(.horizontal, 5)
                    }
                }
            }
        })
    }
}
struct Avisos: View {
    var body: some View{
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing:0){
                ForEach(1...5,id: \.self){i in
                    Image("p\(i)")
                    .resizable()
                    .frame(height: 190)
                    .cornerRadius(15)
                    .padding(.top)
                    .padding(.horizontal)
                            
                
                }
            }
        }.padding(.bottom, 18)
    }
}
struct Arquivos: View {
    var body: some View{
        GeometryReader{ _ in
                   VStack{
                       Text("oi")
                   }
               }
               .background(Color.white)
    }
}
struct Tarefas: View {
    var body: some View{
        GeometryReader{ _ in
                   VStack{
                       Text("coe")
                   }
               }
               .background(Color.white)
    }
}


struct MuralTop:View {
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
            
            Text("Mural")
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


