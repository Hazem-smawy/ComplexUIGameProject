//
//  ContentView.swift
//  ComplexUIGameProject
//
//  Created by hazem smawy on 10/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
            
            
                .navigationBarTitle("", displayMode:  .inline)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    var body: some View {
        VStack {
            HStack {
                Text("Your Player")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.title)
                        .foregroundColor(.white)
                }

            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing:10){
                    ForEach(data){item in
                        Card(data: item)
                    }
                }
                .padding(.bottom)
            }
            
        }
        .background(LinearGradient(gradient: .init(colors: [.orange,.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.bottom)
    }
}
// MARK: - card View
struct Card: View {
    var data: Player
    var body: some View {
        HStack {
            Image(data.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 1.8)
            
            Spacer()
            
            VStack ( spacing: 20) {
                //option 1
                Spacer(minLength: 0)
                Image(systemName: "bolt.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        ZStack {
                            data.color
                            
                            Circle()
                                .stroke(Color.black.opacity(0.5),lineWidth: 5)
                            
                            Circle()
                                .trim(from: 0, to: data.powers[0])
                                .stroke(.white, lineWidth: 5)
                        }
                            .rotationEffect(.init(degrees: -90))
                    )
                    .clipShape(Circle())
                
                //option 2
                Image(systemName: "suit.heart.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        ZStack {
                            data.color
                            
                            Circle()
                                .stroke(Color.black.opacity(0.5),lineWidth: 5)
                            
                            Circle()
                                .trim(from: 0, to: data.powers[1])
                                .stroke(.white, lineWidth: 5)
                        }
                            .rotationEffect(.init(degrees: -90))
                    )
                    .clipShape(Circle())
                
                //option 3
                Image(systemName: "hammer.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        ZStack {
                            data.color
                            
                            Circle()
                                .stroke(Color.black.opacity(0.5),lineWidth: 5)
                            
                            Circle()
                                .trim(from: 0, to: data.powers[2])
                                .stroke(.white, lineWidth: 5)
                        }
                            .rotationEffect(.init(degrees: -90))
                    )
                    .clipShape(Circle())
                
                Spacer(minLength: 0)
                
                NavigationLink(destination: DetailView(data: data)) {
                    Text("See Details")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 25)
                        .background(Capsule().stroke(.white, lineWidth: 2))
                        
                }
                .offset(y: -30)
            }
            .padding(.trailing)
        }
        .frame(height: 290)
        .background(
            Color.white.opacity(0.2)
                .cornerRadius(25)
            
            // going to rate the view in 3d angle...
                .rotation3DEffect(.init(degrees: 20), axis: (x: 0, y: -1, z: 0))
                .padding(.vertical, 35)
                .padding(.trailing, 25)
        )
        .padding(.horizontal)
    }
}
// MARK: - Detail View

struct DetailView :View {
    // MARK: - Property
    
    @Environment(\.presentationMode) var present
    // MARK: - Body
    var data:Player
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button {
                        self.present.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        Image(systemName: "circle.grid.2x2.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    }


                }
                
                Text("Overview")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding()
            
            Image(data.image)
                .resizable()
                .frame(width:UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 2)
                .background(Color.white.opacity(0.2))
                .cornerRadius(30)
            
            Text(data.name)
                .fontWeight(.bold)
                .font(.system(size: 50))
                .foregroundColor(.white)
                .padding(.top)
            
            Text("Super smash bros ultimate\ncillagers from the animal crossing series. \nThis troops fight most effictively in large group.")
                .multilineTextAlignment(.center)
                .foregroundColor(.white.opacity(0.8))
               
            
            HStack(spacing: 20){
                Button {
                    //
                } label: {
                    Text("Add Favourite")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                        .background(Capsule().stroke(.white, lineWidth: 2))
                }
                
                Button {
                    //
                } label: {
                    Text("Play Now")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                        .background(.pink)
                        .clipShape(Capsule())
                }

            }
            .padding(.top, 30)
            Spacer()
            
            
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            
        )
    }
}


// MARK: - data
struct Player: Identifiable {
    var id: Int
    var powers:[CGFloat]
    var image: String
    var name: String
    var color: Color
}

var data :[Player] = [
    .init(id: 0, powers: [0.2,0.5,0.9], image: "1", name: "Bomb Raider", color: .purple.opacity(0.5)),
    .init(id: 1, powers: [0.3,0.5,0.6], image: "2", name: "Pekka", color: .orange.opacity(0.5)),
    .init(id: 2, powers: [0.5,0.4,0.8], image: "3", name: "Barberian", color: .pink.opacity(0.5)),
    .init(id: 3, powers: [0.2,0.5,0.9], image: "4", name: "Bomb Raider", color: .blue.opacity(0.5)),
    .init(id: 4, powers: [0.3,0.5,0.6], image: "5", name: "Pekka", color: .green.opacity(0.5))

]

