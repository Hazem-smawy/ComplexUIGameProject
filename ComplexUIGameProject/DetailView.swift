//
//  DetailView.swift
//  ComplexUIGameProject
//
//  Created by hazem smawy on 10/11/22.
//

import SwiftUI
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
                .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0, y: 0)
            
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
            LinearGradient(gradient: Gradient(colors: [.orange, .purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            
        )
    }
}
