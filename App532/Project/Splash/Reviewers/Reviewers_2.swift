//
//  Reviewers_2.swift
//  App532
//
//  Created by Вячеслав on 5/26/24.
//

import SwiftUI

struct Reviewers_2: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("reviewers_2")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Text("Convenient functionality\nand ease of learning")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                VStack {
                    
                    NavigationLink(destination: {
                        
                        Reviewers_3()
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
    Reviewers_2()
}
