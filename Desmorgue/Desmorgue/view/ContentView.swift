//
//  ContentView.swift
//  Desmorgue
//
//  Created by Lidiane Chen on 24/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
    @State var index = 0
	@State public var isMenuActive:Bool = false
	@State public var profilePage:Bool = false
	
	
	@ObservedObject var profile = dao.userProfile
	
    var body: some View {
		ZStack{
			if !profilePage {
                VStack(spacing: 0){
					ZStack{
						if self.index == 0{
							Color.white.edgesIgnoringSafeArea(.top)
							Home()
						}
						else if self.index == 1{
							Color.white.edgesIgnoringSafeArea(.top)
							BoardView()
						}
						else if self.index == 2{
							Color.white.edgesIgnoringSafeArea(.top)
                            TimelineScollView()
							
						}
						else if self.index == 3{
							Color.white.edgesIgnoringSafeArea(.top)
                            Chat()
						}
					}
                    
					CustomTabs(index: self.$index)
				}
			}
			else{
				ProfileView()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabs: View {
    @Binding var index:Int
    var body: some View{
        ZStack(){
            Rectangle()
                .edgesIgnoringSafeArea(.bottom)
                .frame(height: 50)
                .foregroundColor(.init(UIColor.systemGray5))
                .shadow(color: .black, radius: 1)
            
            HStack{
                Button(action: {
                    self.index = 0
                }) {
                    Image(systemName: "house.fill")
                    .scaleEffect(1.5)
                }
                .foregroundColor(Color.pink.opacity(self.index == 0 ? 1:0.4))
                
                
                Spacer(minLength: 0)
                
                
                Button(action: {
                    self.index = 1
                }) {
                    Image(systemName: "rectangle.3.offgrid.fill")
                    .scaleEffect(1.5)
                }
                .foregroundColor(Color.pink.opacity(self.index == 1 ? 1:0.4))
                
                
                Spacer(minLength: 0)
                
                
                Button(action: {
                    self.index = 2
                }) {
                    Image(systemName: "calendar")
                    .scaleEffect(1.5)
                }
                .foregroundColor(Color.pink.opacity(self.index == 2 ? 1:0.4))
                
                
                Spacer(minLength: 0)
                
                
                Button(action: {
                    self.index = 3
                }) {
                    Image(systemName: "message.fill")
                        .scaleEffect(1.5)
                }
                .foregroundColor(Color.pink.opacity(self.index == 3 ? 1:0.4))
                
            }
            .padding(.horizontal, 40)
        }
        
    }
}
