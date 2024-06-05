//
//  GiftsView.swift
//  App532
//
//  Created by Вячеслав on 5/26/24.
//

import SwiftUI

struct GiftsView: View {
    
    @StateObject var viewModel = GiftsViewModel()
    
    var body: some View {
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
             
                HStack {
                    
                    Text("Gift Lists")
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
                    
                    Text("\(viewModel.gifts.count)")
                        .foregroundColor(.red)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Text("gifts")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.black.opacity(0.4)))
                .padding(.horizontal)
                
                if viewModel.gifts.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Image("empty")
                        
                        Text("No any gifts")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.gifts, id: \.self) { index in
                                
                                HStack {
                                    
                                    Image(index.image ?? "")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                    
                                    VStack(alignment: .leading, spacing: 5, content: {
                                        
                                        Text(index.name ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Text(index.tag ?? "")
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
                        
                        Text("Gift")
                            .foregroundColor(.black)
                            .font(.system(size: 23, weight: .semibold))
                        
                        Menu {
                            
                            ForEach(["gift_1"], id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.image = index
                                    
                                }, label: {
                                    
                                    Image("\(index)")
                                })
                            }
                            
                        } label: {
                            
                            if viewModel.image.isEmpty {
                                
                                Image(systemName: "camera")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 200)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                            } else {
                                
                                Image(viewModel.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 200)
                            }
                        }
                        
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
                            
                            Text("Tag")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.tag.isEmpty ? 1 : 0)

                            TextField("", text: $viewModel.tag)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.black))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Description")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.text.isEmpty ? 1 : 0)

                            TextField("", text: $viewModel.text)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.black))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name of author")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.name_surname.isEmpty ? 1 : 0)

                            TextField("", text: $viewModel.name_surname)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.black))
                        
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.isAdd = false
                                
                                viewModel.tag = ""
                                viewModel.name = ""
                                viewModel.text = ""
                                viewModel.name_surname = ""
                                
                            }, label: {
                                
                                Text("Cancel")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 45)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(.black))
                            })
                            
                            Button(action: {
                                
                                viewModel.addGift()
                                viewModel.fetchGifts()
                                
                                viewModel.isAdd = false
                                
                                viewModel.tag = ""
                                viewModel.name = ""
                                viewModel.text = ""
                                viewModel.name_surname = ""
                                
                            }, label: {
                                
                                Text("Save")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 45)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                            })
                            .opacity(viewModel.name.isEmpty || viewModel.tag.isEmpty || viewModel.text.isEmpty || viewModel.name_surname.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.name.isEmpty || viewModel.tag.isEmpty || viewModel.text.isEmpty || viewModel.name_surname.isEmpty ? true : false)
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
            
            viewModel.fetchGifts()
        }
    }
}

#Preview {
    GiftsView()
}
