//
//  GuestListsView.swift
//  App532
//
//  Created by Вячеслав on 5/26/24.
//

import SwiftUI

struct GuestListsView: View {
    
    @StateObject var viewModel = GuestListsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
             
                HStack {
                    
                    Text("Guest Lists")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .regular))
                    })
                }
                .padding()
                
                HStack {
                    
                    Spacer()
                    
                    Text("You have added")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Text("\(viewModel.guestlists.count)")
                        .foregroundColor(.red)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Text("guests")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.black.opacity(0.4)))
                .padding(.horizontal)
                
                if viewModel.guestlists.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Image("empty")
                        
                        Text("No any guests")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.guestlists, id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 5, content: {
                                        
                                        Text(index.name ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Text(index.phone ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 12, weight: .regular))
                                    })
                                    
                                    Spacer()
                                    
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            }
                        }
                        .padding()
                    }
                }
            }
            .overlay (
            
                ZStack {
                    
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                        .onTapGesture {
                            
                            viewModel.isAdd = false
                        }
                    
                    VStack(spacing: 20) {
                        
                        Text("Guest")
                            .foregroundColor(.black)
                            .font(.system(size: 23, weight: .semibold))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.name.isEmpty ? 1 : 0)

                            TextField("", text: $viewModel.name)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.black))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Phone")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.phone.isEmpty ? 1 : 0)

                            TextField("", text: $viewModel.phone)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.phonePad)
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.black))
                        
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.isAdd = false
                                
                                viewModel.phone = ""
                                viewModel.name = ""
                                
                            }, label: {
                                
                                Text("Cancel")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 45)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(.black))
                            })
                            
                            Button(action: {
                                
                                viewModel.addGuest()
                                viewModel.fetchGuests()
                                
                                viewModel.isAdd = false
                                
                                viewModel.phone = ""
                                viewModel.name = ""
                                
                            }, label: {
                                
                                Text("Save")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 45)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                            })
                            .opacity(viewModel.phone.isEmpty || viewModel.name.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.name.isEmpty || viewModel.phone.isEmpty ? true : false)
                        }
                        .padding([.vertical])
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white.cornerRadius(15))
                    .padding()
                }
                    .opacity(viewModel.isAdd ? 1 : 0)
            )
        }
        .onAppear {
            
            viewModel.fetchGuests()
        }
    }
}

#Preview {
    GuestListsView()
}
