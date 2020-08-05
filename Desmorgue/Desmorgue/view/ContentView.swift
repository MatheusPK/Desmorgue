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
				VStack(){
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
						}
					}
					.padding(.bottom)
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
        HStack{
            Button(action: {
                self.index = 0
            }) {
                Image("home")
            }
            .foregroundColor(Color.black.opacity(self.index == 0 ? 1:0.2))
			
			
            Spacer(minLength: 0)
			
			
            Button(action: {
                self.index = 1
            }) {
                Image("mural")
            }
            .foregroundColor(Color.black.opacity(self.index == 1 ? 1:0.2))
			
			
            Spacer(minLength: 0)
			
			
            Button(action: {
                self.index = 2
            }) {
                Image("timeline")
            }
            .foregroundColor(Color.black.opacity(self.index == 2 ? 1:0.2))
			
			
            Spacer(minLength: 0)
			
			
            Button(action: {
                self.index = 3
            }) {
                Image("chat")
            }
            .foregroundColor(Color.black.opacity(self.index == 3 ? 1:0.2))
            
        }
        .padding(.horizontal, 40)
        
    }
}
