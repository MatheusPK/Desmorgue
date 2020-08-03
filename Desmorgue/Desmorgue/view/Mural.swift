//
//  Mural.swift
//  Desmorgue
//
//  Created by Lidiane Chen on 26/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import SwiftUI

struct Mural: View {
    var body: some View {
        Boardy()
    }
}

struct Mural_Previews: PreviewProvider {
    static var previews: some View {
        Mural()
    }
}

struct Boardy:View {
    @State var index = 1
    @State var offset:CGFloat = 0
    var body: some View{
        VStack(spacing: 0){
            AppBar(index: self.$index, offset: self.$offset)
            Avisos()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AppBar:View {
    @Binding var index:Int
    @Binding var offset: CGFloat
    var body: some View{
        VStack(alignment: .center, content: {
            Text("Mural")
                .font(.title)
                .foregroundColor(.white)
                .padding(.leading)
                .padding(.bottom)
            HStack{
                Button(action: {
                    self.index = 1
                }) {
                    VStack(spacing: 8){
                        HStack(spacing: 12){
                        Image("bino")
                            .foregroundColor(self.index == 1 ? .white: Color.white.opacity(0.7))
                        Text("Avisos")
                            .foregroundColor(self.index == 1 ? .white: Color.white.opacity(0.7))
                        
                    }
                    Capsule()
                        .fill(self.index == 1 ? Color.white: Color.clear)
                        .frame(height: 4)
                    }
                }
                Button(action: {
                    self.index = 2
                }) {
                    VStack(spacing: 8){
                        HStack(spacing: 12){
                            Image("arquivos")
                                .foregroundColor(self.index == 2 ? .white: Color.white.opacity(0.7))
                            Text("Arquivos")
                                .foregroundColor(self.index == 2 ? .white: Color.white.opacity(0.7))
                                   
                        }
                        Capsule()
                            .fill(self.index == 2 ? Color.white: Color.clear)
                            .frame(height: 4)
                    }
                }
                Button(action: {
                    self.index = 3
                }) {
                    VStack(spacing: 8){
                        HStack(spacing: 12){
                            Image("tarefas")
                                .foregroundColor(self.index == 3 ? .white: Color.white.opacity(0.7))
                            Text("Tarefas")
                                .foregroundColor(self.index == 3 ? .white: Color.white.opacity(0.7))
                                   
                        }
                        Capsule()
                            .fill(self.index == 3 ? Color.white: Color.clear)
                            .frame(height: 4)
                    }
                }
            }
        })
            
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
        .padding(.horizontal)
        .padding(.bottom, 8)
            .background(Color.pink)
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

