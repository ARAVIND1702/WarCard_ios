//
//  SplashScreenView.swift
//  CardPlay
//
//  Created by GGS-BKS on 18/07/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var  isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        if isActive{
            ContentView()
        }
        else{
            ZStack{
                Image("backgroundplain")
                .ignoresSafeArea()
            
            VStack{
                VStack{
                    
                    Image("back")
                        .font(.system(size:100.0))
                        .foregroundColor(.red)
                    
                    
                    Image("logo")
                        .font(.system(size:80))
                        .foregroundColor(.red)
                        .padding(.top, 20.0)
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 1.8
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
                
            }
                VStack(){
                    
//                    Text("Made By ArRM")
//                        .font(.caption2)
//                        .foregroundColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                    Image("Frame 1")
                        .resizable()
                        .frame(width: 200.0, height: 90.0)

                

                }.offset(y:400)
        
        }
        }
        
     
        }
    }


struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
