//
//  ContentView.swift
//  CardPlay
//
//  Created by GGS-BKS on 18/07/23.
//

import SwiftUI
import PopupView

struct ContentView: View {
    @State var playerCard = "card2"
    @State var cpuCard = "card2"
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var showingPopup = false
    @State private var showAlert = false
    @State var victory = ""
    @State var Title = ""
    let customColor = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2552244679))
    @State var bg = ["background-wood-grain","backgroundplain","background-wood-cartoon","background-cloth"]
    @State var index = 0
    //let customColor = Color(#colorLiteral(red: 0.9978660941, green: 0.9476855397, blue: 0.9179597497, alpha: 1))

//    let customColor = Color(#colorLiteral(red: 0.939758122, green: 0.3447655141, blue: 0.2857017517, alpha: 1))

    var body: some View {
        
        ZStack{
            Image(bg[index])
                .resizable()
                .ignoresSafeArea()
            
            Button{
                if(index==3){
                    index = 0
                }
                else{
                    index = index+1
                }
                print(index)
                
            }
        label: {
            Image("BackgroundChange")
                .resizable()
                .frame(width: 60, height: 60)
                
        }.offset(x:157,y:-370)
            VStack {
                
                Image("logo")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                    
                }
                 
                Spacer()
                Button{
                    deal()
                }
            label: {
                Image("button")
                
            }
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom,10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                        
                    }.foregroundColor(.white)
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom,10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                        
                    }.foregroundColor(.white)
                    
                    Spacer()
                }
                Spacer()
                
            }
            
        }
        .popup(isPresented: $showingPopup) {
            
            Text(Title)
                 .frame(width: 300, height: 450)
                 .background( Color(#colorLiteral(red: 0.9978660941, green: 0.9476855397, blue: 0.9179597497, alpha: 1)))
                 .cornerRadius(20.0)
            if Title == "Victory"{
                Image("trophy")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .offset(y:-75)
                
            } else {
                Image("trophybroken")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .offset(y:-75)
                
            }
            
            Text(Title)
                .offset(y:100)
                .fontWeight(.semibold)
                .font(.system(size: 40))
                .foregroundColor(Color(#colorLiteral(red: 0.939758122, green: 0.3447655141, blue: 0.2857017517, alpha: 1)))
            Text(victory)
                .offset(y:140)
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(.black)
            Button{
                showingPopup = false
            }
        label: {
            Image("Btn")
                .resizable().frame(width: 100,height: 60)
                
            
        }.offset(y:190)
         } customize: {
//             $0.autohideIn(5)
            $0.backgroundColor(customColor)
                 .closeOnTap(false)
         }
        ///zstack end
        
        
    }
    func deal(){
        var playerCardValue = Int.random(in:2...14)
        var cpuCardValie = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        cpuCard = "card" + String(cpuCardValie)
        if playerCardValue > cpuCardValie{
            playerScore+=1
        }
        else{
            cpuScore+=1
        }
        if playerScore == 10 || cpuScore ==  10{
            if playerScore > cpuScore{
                victory = "Player Won the Game"
                Title = "Victory"
                playerScore = 0
                cpuScore = 0
                showingPopup = true

            }
            else{
                victory = "CPU Won the Game "
                Title  = "Defeat"
                playerScore = 0
                cpuScore = 0
                showingPopup = true

            }
           
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
