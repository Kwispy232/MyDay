//
//  EventCard.swift
//  MyDay
//
//  Created by Sebastian Mraz on 11/04/2024.
//

import SwiftUI

struct EventCard: View {

    var event: Event
    
    var body: some View {
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
        .listRowBackground(Color.clear)    }
}

#Preview {
    EventCard(event: .mock(title: "mock title"))
}
