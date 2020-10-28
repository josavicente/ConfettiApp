//
//  ContentView.swift
//  ConfettiApp
//
//  Created by Josafat Vicente Pérez on 28/10/2020.
//

import SwiftUI


struct ContentView: View {
    
    @State var showAnimation : Bool = false
    
    var body: some View {
        ZStack{
            
            if self.showAnimation {
                ConfettiBoom(showAnimation: self.$showAnimation)
            }
            VStack{
                Spacer()
                Button(action: {
                    withAnimation {
                        self.showAnimation.toggle()
                    }
                }, label: {
                    HStack{
                        Spacer()
                        Text("Boom 🥳")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                        Spacer()
                    }
                })
                Spacer()
            }
        }
    }
}

struct ConfettiBoom: View {
    
    @Binding var showAnimation : Bool
    
    var body: some View {
        if self.showAnimation{
            Confetti().onTapGesture{
                self.showAnimation.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
