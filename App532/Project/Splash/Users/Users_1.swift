//
//  Users_1.swift
//  App532
//
//  Created by Вячеслав on 5/26/24.
//

import SwiftUI

struct Users_1: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("users_1")
                .resizable()
                .ignoresSafeArea()
            
            Image("logo_big")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding(.bottom, 102)
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    NavigationLink(destination: {
                        
                        Users_2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                            .padding()
                    })
                }
                .padding([.horizontal, .top])
                .background(Color.white.ignoresSafeArea())
            }
        }
    }
}

#Preview {
    Users_1()
}
