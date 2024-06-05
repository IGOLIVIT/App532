//
//  Reviewers_1.swift
//  App532
//
//  Created by Вячеслав on 5/26/24.
//

import SwiftUI

struct Reviewers_1: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("reviewers_1")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Text("Accurately plan your\nbudget and control")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                VStack {
                    
                    NavigationLink(destination: {
                        
                        Reviewers_2()
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
    Reviewers_1()
}
