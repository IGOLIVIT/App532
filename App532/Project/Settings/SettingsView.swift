//
//  SettingsView.swift
//  App532
//
//  Created by Вячеслав on 5/26/24.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                        
                        Text("Rate App")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    guard let url = URL(string: "https://docs.google.com/document/d/19AWp93zQydnh3LgiSC-QLKp9RIJKNEvo_zF4ZXrCMYU/edit?usp=sharing") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                        
                        Text("Usage Policy")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
