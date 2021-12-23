//
//  ContentView.swift
//  HW8A
//
//  Created by Арслан on 18.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        mainS
    }
    
    @State var showSP = false
    @State var showMP = false
    
    var mainS: some View {
        NavigationView {
            ZStack {
                backGroundI2()
                VStack(spacing: 0) {
                    mainT2(text: "Welcome to the game!", foreG: .white)
                        .padding(.bottom, 450)
                    NavigationLink(isActive: $showSP) {
                        sp()
                    } label: {
                        EmptyView()
                    }
                    
                    Button(action: {showSP = true}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 103/255, green: 80/255, blue: 164/255, opacity: 1))
                                .frame(height: 50)
                            Text("Single player")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                        }
                    })
                        .padding(.bottom, 10)
                    
                    NavigationLink(isActive: $showMP) {
                        mp()
                    } label: {
                        EmptyView()
                    }
                    
                    Button(action: {showMP = true}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 103/255, green: 80/255, blue: 164/255, opacity: 1))
                                .frame(height: 50)
                            Text("Multi player")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                        }
                    })
                }
                .padding([.leading, .trailing], 23)
                .onAppear {
                    showSP = true
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct backGroundI2: View {
    var body: some View {
        Image("BackgroundImage")
            .resizable()
            .frame(width: 390, height: 840)
            .edgesIgnoringSafeArea(.all)
    }
}

struct baseButton2: View {
    var text: String
    
    var body: some View {
        ZStack {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 103/255, green: 80/255, blue: 164/255, opacity: 1))
            .frame(height: 50)
        Text(text)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium))
        }
    }
}

struct mainT2: View {
    var text: String
    var foreG: Color
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .font(.system(size: 54, weight: .bold))
            .foregroundColor(foreG)
    }
}

struct sp: View {
    
    @State var ICMM = false
    @State var chageText = false
    
    @State var bP = false
    @State var bS = false
    @State var bR = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(Color(red: 250/255, green: 250/255, blue: 250/255))
                .frame(width: 390, height: 880)
            VStack(spacing: 0) {
                if !bP && !bR && !bS {
                mainT2(text: "Take your pick", foreG: .black)
                    .padding(.top, 72)
                    .padding(.bottom, 12)
                }
                
                else {
                mainT2(text: "Your pick", foreG: .black)
                    .padding(.top, 72)
                    .padding(.bottom, 12)
                }
                
                Text("Score 0:0")
                    .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
                    .font(.system(size: 17, weight: .medium))
                    .padding(.bottom, 54)

                Button {
                    bP = true
                } label: {
                    buttonM2(emoji: "📃")
                        .padding(.bottom, 24)
                        .opacity(bS == true || bR == true ? 0 : 1)
                }
                
                Button {
                    bS = true
                } label: {
                    buttonM2(emoji: "✂️")
                        .padding(.bottom, 24)
                        .opacity(bP == true || bR == true ? 0 : 1)
                }
                
                Button {
                    bR = true
                } label: {
                    buttonM2(emoji: "🗿")
                        .padding(.bottom, 122)
                        .opacity(bP == true || bS == true  ? 0 : 1)
                }

                    Button {
                        ICMM = true
                    } label: {
                        baseButton2(text: "I changed my mind")
                            .opacity(bP == false && bS == false && bR == false ? 0 : 1)
//                            .opacity(ICMM == true ? 0 : 1)
                    }
                    .offset(y: -80)
                
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Round #1")
                    .font(.system(size: 17, weight: .semibold))
                    .padding([.leading, .trailing], 22)
            }
        }
    }
}

struct mp: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(Color(red: 250/255, green: 250/255, blue: 250/255))
                .frame(width: 390, height: 880)
            VStack(spacing: 0) {
                mainT2(text: "Take your pick", foreG: .black)
                    .padding(.top, 72)
                    .padding(.bottom, 12)
                
                Text("Player 1・Score 0:0")
                    .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
                    .font(.system(size: 17, weight: .medium))
                    .padding(.bottom, 54)
                
                buttonM2(emoji: "📃")
                    .padding(.bottom, 24)
                
                buttonM2(emoji: "✂️")
                    .padding(.bottom, 24)
                
                buttonM2(emoji: "🗿")
                    .padding(.bottom, 122)
                
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Round #1")
                    .font(.system(size: 17, weight: .semibold))
            }
        }
    }
}

struct buttonM2: View {
    let emoji: String
    var body: some View {
        ZStack {
        RoundedRectangle(cornerRadius: 48)
            .fill(Color(red: 243/255, green: 242/255, blue: 248/255))
            .frame(width: 332, height: 128)
            Text(emoji)
                .font(.system(size: 80))
        }
    }
}
