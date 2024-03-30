//
//  MyDayView.swift
//  MyDay
//
//  Created by Sebastian Mraz on 30/03/2024.
//

import SwiftUI

struct MyDayView: View {
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(Date.now.formatted(date: .long, time: .omitted))
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.horizontal)
                
                
                ScrollView {
                    VStack(spacing: 16) {
                        eventCard(.mock)
                        eventCard(.mock)
                        eventCard(.mock)
                        eventCard(.mock)
                        eventCard(.mock)
                    }
                    .padding()
                }
                .frame(maxHeight: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 26))
                .background(
                    RoundedRectangle(cornerRadius: 26)
                        .frame(maxHeight: .infinity)
                        .foregroundStyle(Color.lightGreen)
                )
            }
            .background(Color.darkGreen)
            .overlay(alignment: .bottom) {
                customTabBar()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "slider.vertical.3")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.white)
                            .frame(width: 24, height: 24)
                    }
                }
            }
        }
    }
    
}

// MARK: - Components

private extension MyDayView {
    
    func customTabBar() -> some View {
        Rectangle()
            .foregroundStyle(.white)
            .ignoresSafeArea()
            .frame(height: 32)
            .overlay {
                Circle()
                    .foregroundStyle(.white)
                    .frame(height: 72)
                    .offset(y: -4)
            }
            .overlay {
                Button {
                    
                } label: {
                    Circle()
                        .foregroundStyle(Color.darkGreen)
                        .frame(height: 56)
                        .offset(y: -4)
                        .overlay {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .padding(8)
                                .foregroundStyle(.white)
                                .offset(y: -4)
                        }
                }
            }
    }
    
    func eventCard(_ event: Event) -> some View {
//        VStack {
//            Text(event.startTime.formatted(date: .omitted, time: .complete))
//            Text(event.duration)
//            Text(event.title)
//            Text(event.description)
//            
//            Image(systemName: event.icon)
//                
//            
//        }
        
        RoundedRectangle(cornerRadius: 26)
                .foregroundStyle(.white)
                .frame(height: 100)
    
        
    }
    
}

// MARK: - Previews

#Preview {
    MyDayView()
}
