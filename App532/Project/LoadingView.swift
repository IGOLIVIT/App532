//
//  LoadingView.swift
//  App532
//
//  Created by Вячеслав on 5/26/24.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                
                Image("logo_big")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                
                ProgressView()
            }
        }
    }
}

#Preview {
    LoadingView()
}
