//
//  MyDayView.swift
//  MyDay
//
//  Created by Sebastian Mraz on 30/03/2024.
//

import SwiftUI

struct MyDayView: View {
    
    // MARK: - Properties
    
    @State private var events: [Event] = [
        Event.mock(title: "title1"),
        Event.mock(title: "title2"),
        Event.mock(title: "title3"),
        Event.mock(title: "title4"),
        Event.mock(title: "title5"),
        Event.mock(title: "title6"),
        Event.mock(title: "title7")
    ]
    
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
                
                List {
                    ForEach(events) { event in
                        eventCard(event)
                            .padding(.bottom, events.last == event ? 48 : 0)
                            .padding(.top, events.first == event ? 16 : 0)
                            .padding(.horizontal)
                    }
                    .onMove(perform: move)
                }
                .listStyle(.plain)
                .listRowSpacing(16)
                .scrollIndicators(.hidden)
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
        VStack(alignment: .leading) {
            VStack(alignment: .trailing) {
                Text(event.startTime.formatted(date: .omitted, time: .shortened))
                Text(event.duration)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .foregroundStyle(Color.gray)
            .font(.callout)
            
            Text(event.title)
                .font(.title2)
                .bold()
                .padding(.bottom)
    
            Text(event.description)
            
            HStack(alignment: .bottom) {
                Image(systemName: event.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                
                Toggle(isOn: .constant(true), label: {
                    Image(systemName: "checkmark.square")
                })
                .toggleStyle(iOSCheckboxToggleStyle())
                .frame(height: 24)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
        }
        .padding(26)
        .background {
            RoundedRectangle(cornerRadius: 26)
                .foregroundStyle(.white)
        }
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        .listRowBackground(Color.clear)
    }
    
}

// MARK: - Private

private extension MyDayView {
    
    func move(from source: IndexSet, to destination: Int) {
        events.move(fromOffsets: source, toOffset: destination)
    }
    
}

// MARK: - Previews

#Preview {
    MyDayView()
}
