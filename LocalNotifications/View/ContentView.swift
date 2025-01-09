//
//  ContentView.swift
//  LocalNotifications
//
//  Created by 0v0 on 2024/12/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 24) {
            
            // 通知アイコン
            Image(systemName: "bell.badge.fill")
                .font(.system(size: 64))
                .foregroundColor(.blue)
            
            // タイトル
            Text("ローカル通知のテスト")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                
            
            // アクションボタン群
            VStack(spacing: 16) {
                ActionButton(
                    title: "通知を送信",
                    icon: "bell.badge.fill",
                    action: {
                        NotificationManager.instance.sendNotification()
                    }
                )
                
                ActionButton(
                    title: "バッチをリセット",
                    icon: "bell.slash.fill",
                    action: {
                        NotificationManager.instance.resetBadgeCount()
                    }
                )
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
