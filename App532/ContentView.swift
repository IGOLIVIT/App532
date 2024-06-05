//
//  ContentView.swift
//  App532
//
//  Created by IGOR on 22/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Holidays
    
    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if !status {
                
                VStack(spacing: 0, content: {
                    
                    TabView(selection: $current_tab, content: {
                        
                        HolidaysView()
                            .tag(Tab.Holidays)
                        
                        GuestListsView()
                            .tag(Tab.Guest_Lists)
                        
                        GiftsView()
                            .tag(Tab.Gifts)
                        
                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                .ignoresSafeArea(.all, edges: .bottom)
                
            } else {
                
                Reviewers_1()
            }
        }
    }
}

#Preview {
    ContentView()
}
