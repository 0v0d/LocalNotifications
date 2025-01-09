//
//  ActionButton.swift
//  LocalNotifications
//
//  Created by 0v0 on 2025/01/08.
//

import SwiftUI

struct ActionButton: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .symbolEffect(.pulse)
                
                Text(title)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue)
            }
            .foregroundColor(.white)
        }
        .padding(.horizontal)
    }
}
