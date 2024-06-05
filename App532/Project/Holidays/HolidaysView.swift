//
//  HolidaysView.swift
//  App532
//
//  Created by Вячеслав on 5/26/24.
//

import SwiftUI

struct HolidaysView: View {
    
    @StateObject var viewModel = HolidaysViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
             
                HStack {
                    
                    Text("Holidays")
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
                    
                    Text("\(viewModel.holidays.count)")
                        .foregroundColor(.red)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Text("holidays")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.black.opacity(0.4)))
                .padding(.horizontal)
                
                if viewModel.holidays.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Image("empty")
                        
                        Text("No any holidays")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.holidays, id: \.self) { index in
                                
                                Image("image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 190)
                                    .cornerRadius(15)
                                    .overlay (
                                    
                                        VStack {
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .leading, spacing: 5, content: {
                                                
                                                Text(index.name ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 16, weight: .regular))
                                                
                                                Text("Today")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 12, weight: .regular))
                                            })
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .background(Color.white.cornerRadius(15).ignoresSafeArea())
                                            .padding(7)
                                        }
                                    )
                            }
                        })
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
                        
                        Text("Holiday")
                            .foregroundColor(.black)
                            .font(.system(size: 23, weight: .semibold))
                        
                        Image("image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 150)
                        
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
                        
                        DatePicker(selection: $viewModel.date, displayedComponents: .date, label: {})
                            .labelsHidden()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.isAdd = false
                                
                                viewModel.image = ""
                                viewModel.name = ""
                                viewModel.date = Date()
                                
                            }, label: {
                                
                                Text("Cancel")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 45)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(.black))
                            })
                            
                            Button(action: {
                                
                                viewModel.addHoliday()
                                viewModel.fetchHolidays()
                                
                                viewModel.isAdd = false
                                
                                viewModel.image = ""
                                viewModel.name = ""
                                viewModel.date = Date()
                                
                            }, label: {
                                
                                Text("Save")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 45)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                            })
                            .opacity(viewModel.name.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.name.isEmpty ? true : false)
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
            
            viewModel.fetchHolidays()
        }
    }
}

#Preview {
    HolidaysView()
}
