//
//  ContentView.swift
//  SpinHub
//
//  Created by johndanial on 1/24/24.
//

import SwiftUI
import AVFoundation
import GameKit

struct ContentView: View {
    
    @State private var rotation1: Double = 0.0
    @State private var rotation2: Double = 0.0
    @State private var rotation3: Double = 0.0
    
    @State private var redSocre = 0.0
    @State private var yellowScore = 0.0
    @State private var blueScore = 0.0
    
    @State private var showingGameCenterView = false
    
    @State private var yellowColerRectangle = Color.yellow
    
    let impactFeedback1 = UIImpactFeedbackGenerator(style: .heavy)
    let impactFeedback2 = UIImpactFeedbackGenerator(style: .medium )
    let impactFeedback3 = UIImpactFeedbackGenerator(style: .light)
   
    
    @State var Spins = 0
    @AppStorage("lifeTimeSpin") var lifeTimeSpins = 0
    @AppStorage("highestScore") var highestScore = 0

    let gradient = Gradient(colors: [.blue, .green, .pink])
    
    let colorsRectangels: [Color] = [.red, .green, .yellow, .cyan, .purple,.pink, .orange, .black, .cyan]
    
    @State private var showColors = false
    
    @State private var updatedHighestScoreValue: Int = 0
    
    
    var body: some View {
        ZStack {
            if showColors {
                colorsRectangels.randomElement()
                    .ignoresSafeArea()
                    .shadow(radius: 5)
                    .shadow(radius: 10)
                    .shadow(radius: 15)
                    .shadow(radius: 20)
                    .shadow(radius: 30)
                    .shadow(radius: 40)
            }
            
            VStack{
                HStack{
                    
                    Toggle(isOn: $showColors){
                    }
                    Spacer()
                    Spacer()
                }
                VStack {
                    HStack{
                        Spacer()
                        VStack {
                            Text("Spins")
                                .bold()
                                .foregroundColor(.pink)
                                .font(.system(size:20))
                            Text ("\(Spins)")
                            //                    Text (Spins, format: .number.notation(.compactName))
                                .foregroundColor(.blue)
                            //                        .bold()
                            //                        .frame(maxWidth: 100, maxHeight: 25)
                            //                        .border(Color.black)
                        }
                        
                        Spacer()
                        VStack {
                            Text("High Score")
                                .bold()
                                .foregroundColor(.pink)
                                .font(.system(size:20))
                            
                            
                            
                            
                            Text("\(highestScore)")
                            
                        }
                        
                        //                Text(highestScore, format: .number.notation(.compactName))
                        
                        Spacer()
                        VStack {
                            Text("Life Time")
                                .bold()
                                .foregroundColor(.pink)
                                .font(.system(size:20))
                            Text(lifeTimeSpins, format: .number.notation(.compactName))
                        }
                        Spacer()
                        
                        
                    }
                    .padding()
                    .padding()
                    .padding()
                    
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        GaugeRow(blueScore: $blueScore, yellowScore: $yellowScore, redScore: $redSocre)
                    }
                }
            Spacer()
                ZStack {
                    
                    
                    //                    if showColors {
                    //                        colorsRectangels.randomElement()
                    //                            .ignoresSafeArea()
                    //                            .shadow(radius: 5)
                    //                            .shadow(radius: 10)
                    //                            .shadow(radius: 15)
                    //                            .shadow(radius: 20)
                    //                            .shadow(radius: 30)
                    //                            .shadow(radius: 40)
                    //                    }
                    if blueScore < 25 {
                        RoundedRectangle(cornerRadius: 22)
                            .fill(Color.blue)
                            .frame(width: 300, height: 300)
//                            .shadow(radius: 5)
//                            .shadow(radius: 10)
//                            .shadow(radius: 15)
                            .rotationEffect(.degrees(rotation1))
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        withAnimation {
                                            let delta = value.translation.width + value.translation.height
                                            rotation1 += Double(delta) * 1.5
                                            
                                            if blueScore <= 25 {
//                                                impactFeedback.prepare()
                                                impactFeedback1.impactOccurred()
                                                Spins += 1
                                                lifeTimeSpins += 1
                                                blueScore += 0.1
                                                
                                                
                                            }
                                        }
                                    }
                                    .onEnded { _ in
                                        withAnimation {
//                                            impactFeedback.prepare()
//                                            impactFeedback.impactOccurred()
                                            // You can add deceleration or stopping logic here if needed
                                        }
                                    }
                            )
                    }
                    
                    else {
                        
                        RoundedRectangle(cornerRadius: 22)
                            .fill(Color.graydark)
                            .frame(width: 300, height: 300)
                        //                            .shadow(radius: 5)
                        //                            .shadow(radius: 10)
                        //                            .shadow(radius: 15)
                            .rotationEffect(.degrees(rotation1))
                    }
                    if yellowScore < 50 {
                        
                        RoundedRectangle(cornerRadius: 22)
                        
                            .fill(yellowColerRectangle)
                            .shadow(radius: 5)
                            .shadow(radius: 10)
                        
                            .frame(width: 200, height: 200)
                            .rotationEffect(.degrees(rotation2))
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        withAnimation {
                                            let delta = value.translation.width + value.translation.height
                                            rotation2 += Double(delta) * 1.5
                                            if yellowScore < 50 {
                                                impactFeedback2.impactOccurred()
                                                Spins += 1
                                                lifeTimeSpins += 1
                                                yellowScore += 0.1
                                            }
                                        }
                                    }
                                    .onEnded { _ in
                                        withAnimation {
                                            // You can add deceleration or stopping logic here if needed
                                        }
                                    }
                            )
                    }
                    else {
                        RoundedRectangle(cornerRadius: 22)
                            .fill(Color.graymid)
                        //                        .shadow(radius: 5)
                        //                        .shadow(radius: 10)
                        
                            .frame(width: 200, height: 200)
                            .rotationEffect(.degrees(rotation2))
                        
                    }
                    if redSocre < 75 {
                        RoundedRectangle(cornerRadius: 22)
                            .fill(Color.red)
                            .frame(width: 100, height: 100)
                        //                    .opacity(0.8)
                        
                            .shadow(radius: 20)
                            .shadow(radius: 30)
                            .shadow(radius: 40)
                            .rotationEffect(.degrees(rotation3))
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        withAnimation {
                                            let delta = value.translation.width + value.translation.height
                                            rotation3 += Double(delta) * 1.5
                                            
                                            if redSocre < 75 {
                                                
                                                impactFeedback3.impactOccurred()
                                                Spins += 1
                                                lifeTimeSpins += 1
                                                redSocre += 0.1
                                            }
                                        }
                                    }
                                    .onEnded { _ in
                                        withAnimation {
                                            // You can add deceleration or stopping logic here if needed
                                        }
                                    }
                            )
                        
                    }
                    
                    
                    else {
                        RoundedRectangle(cornerRadius: 22)
                            .fill(Color.graylight)
                            .frame(width: 100, height: 100)
                        //                    .opacity(0.8)
                        
                            .shadow(radius: 20)
                            .shadow(radius: 30)
                            .shadow(radius: 40)
                            .rotationEffect(.degrees(rotation3))
                    }
                }
               
                Button {
                    redSocre = 0.0
                    yellowScore = 0.0
                    blueScore = 0.0
                    
                rotation1 = 0.0
                rotation2  = 0.0
                rotation3 = 0.0
                    
                } label: {
                    Text("Rest")
                        .padding(20)
                }
                
                Spacer()
                
               
            }
            .onAppear(){
                authenticateUser()
            }
            
            
            
        }
        
        //        .onChange(of: (the value you want to monitor)) { oldValue, newValue in
        //            printHello()
        //
        //        }
       
        
        
        .onChange(of: Spins) { oldSpins, newSpins in
            if newSpins > highestScore {
                highestScore = newSpins }
        }
        
//        .onChange(of: Spins) { newScore in
//
//            if newScore > highestScore {
//                highestScore = newScore
//            }
//            }
//
        .persistentSystemOverlays(.hidden)
    }
    
    func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
                
                
            }
//            Task{
//                await GKLocalPlayer()
//            }
        }
    }
    
//    func loadLeaderboard(source: Int = 0) async {
//        print(source)
//        print("source")
//        playersList.removeAll()
//        Task{
//            var playersListTemp : [Player] = []
//            let leaderboards = try await GKLeaderboard.loadLeaderboards(IDs: [leaderboardIdentifier])
//            if let leaderboard = leaderboards.filter ({ $0.baseLeaderboardID == self.leaderboardIdentifier }).first {
//                let allPlayers = try await leaderboard.loadEntries(for: .global, timeScope: .allTime, range: NSRange(1...5))
//                if allPlayers.1.count > 0 {
//                    try await allPlayers.1.asyncForEach { leaderboardEntry in
//                        let image = try await leaderboardEntry.player.loadPhoto(for: .small)
//                        //                            leaderboardEntry.player.loadPhoto(for: .normal) { image, error in
//                        playersListTemp.append(Player(name: leaderboardEntry.player.displayName, score:leaderboardEntry.formattedScore, image: image))
//                        //                                print("playersList")
//                        //                                print(playersListTemp)
//                        playersListTemp.sort{
//                            $0.score < $1.score
//                        }
//                        
//                        //                                playersList.sort()
//                        //                                print("playersList")
//                        //                                print(playersListTemp)
//                        //TODO: Place this outside this loop
//                        //                                playersList.sort{
//                        //                                    $0.score < $1.score
//                        //                                }
//                    }
//                }
//            }
//            print("playersList")
//            print(playersListTemp)
//            playersList = playersListTemp
//        }
//    }
//    
    
//    func authenticateUser() {
//        GKLocalPlayer.local.authenticateHandler = { vc, error in
//            guard error == nil else {
//                print(error?.localizedDescription ?? "")
//                return
//            }
//        }
//    }
//    
//    func authenticateUser() {
//        GKLocalPlayer.local.authenticateHandler = { vc, error in
//            guard error == nil else {
//                print(error?.localizedDescription ?? "")
//                return
//            }
//        }
//    }
    
//    func authenticateUser() {
//        let localPlayer = GKLocalPlayer.local
//        localPlayer.authenticateHandler = { vc, error in
//            guard error == nil else {
//                print(error?.localizedDescription ?? "")
//                return
//            }
//        }
//    }

   
}

   
#Preview {
    ContentView()
}


extension Sequence {
    func asyncForEach(
        _ operation: (Element) async throws -> Void
    ) async rethrows {
        for element in self {
            try await operation(element)
        }
    }
}
