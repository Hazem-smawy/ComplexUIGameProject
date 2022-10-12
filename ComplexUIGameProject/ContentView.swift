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
                    ForEach(data, id: \.id){item in
                        Card(data: item)
                    }
                }
                .padding(.bottom)
            }
            
        }
        .background(LinearGradient(gradient: .init(colors: [.pink,.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.bottom)
    }
}
// MARK: - card View
struct Card: View {
    // MARK: - Property
    var height: CGFloat = UIScreen.main.bounds.height / 3
    // MARK: - Body
    var data: Player
    var body: some View {
        HStack {
            GeometryReader { proxy in
                Image(data.image)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 1.8)
                    .scaleEffect(proxy.frame(in: .global).minY > height * 3 / 4 && proxy.frame(in: .global).minY < height * 3 / 2  ? 1.3 : 0.7)
                    .rotationEffect(.init(degrees: (proxy.frame(in: .global).minY > height * 3 / 4 && proxy.frame(in: .global).minY < height * 3 / 2  ? -5 : 0)))
                    .animation(.easeInOut(duration: 1.3) ,value: proxy.frame(in: .global).minY)
                
            }
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
            .padding(.vertical,5)
            .padding(.trailing)
        }
        .frame(height: 290)
        .background(
            Color.white.opacity(0.3)
                .cornerRadius(25)
            
            // going to rate the view in 3d angle...
                .rotation3DEffect(.init(degrees: 20), axis: (x: 0, y: -1, z: 0))
                .padding(.vertical, 35)
                .padding(.trailing, 25)
        )
        .padding(.horizontal)
    }
}

