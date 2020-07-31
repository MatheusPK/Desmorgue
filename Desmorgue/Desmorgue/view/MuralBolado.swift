//
//  MuralBolado.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 31/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation
import SwiftUI


struct MuralBolado_Previews: PreviewProvider {
    static var previews: some View {
        MuralBolado()
    }
}

struct MuralBolado:View{
    @State private var boardIndex = 0
    var boardType = ["Notices", "Tasks", "Files"]

    var body: some View {
        VStack(spacing: 0) {
            HStack(){
                Text("Mural").font(.title).foregroundColor(.black).padding()
            }.padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! - 10)
            
            
            Picker("Boards", selection: $boardIndex) {
                ForEach(0..<boardType.count) { index in
                    Text(self.boardType[index]).tag(index)
                }
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal, (UIApplication.shared.windows.first?.safeAreaInsets.left)! + 50)
            
            
            Spacer()
            
        }.edgesIgnoringSafeArea(.all)
        
    }
    
    
}

