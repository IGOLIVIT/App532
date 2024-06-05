//
//  Users_2.swift
//  App532
//
//  Created by Вячеслав on 5/26/24.
//

import SwiftUI
import StoreKit

struct Users_2: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("users_2")
                .resizable()
                .ignoresSafeArea()
            
            Image("reviewers")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(30)
                
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    NavigationLink(destination: {
                        
                        Users_3()
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Users_2()
}
