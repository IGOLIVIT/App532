//
//  TabBar.swift
//  App532
//
//  Created by Вячеслав on 5/26/24.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color(.gray).opacity(0.4))
                            .frame(height: 22)
                        
//                        Text(index.rawValue)
//                            .foregroundColor(selectedTab == index ? Color("primary") : Color(.gray))
//                            .font(.system(size: 12, weight: .regular))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 35)
        .background(Color.white)
    }
}

enum Tab: String, CaseIterable {
    
    case Holidays = "Holidays"
    case Guest_Lists = "Guest_Lists"
    case Gifts = "Gifts"
    case Settings = "Settings"
    
}

#Preview {
    ContentView()
}
