//
//  NotificationManager.swift
//  LocalNotifications
//
//  Created by 0v0 on 2024/12/31.
//

import Foundation
import UserNotifications

final class NotificationManager {
    static let instance: NotificationManager = NotificationManager()
    private var badgeCount: Int = 0
    // 権限リクエスト
    func requestPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if let error = error {
                    print("Error requesting notification permissions: \(error.localizedDescription)")
                } else {
                    print("Permission granted: \(granted)")
                }
            }
    }
    
    // 通知送信
    func sendNotification() {
        let content = UNMutableNotificationContent()
        badgeCount += 1
        content.title = "タイトル"
        content.subtitle = "サブタイトル"
        content.body = "本文"
        content.sound = .default
        content.badge = NSNumber(value: badgeCount)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "notification01", content: content, trigger: trigger)
        
        // トリガーを指定しない場合は、通知は即座に表示される
        //let request = UNNotificationRequest(identifier: "notification01", content: content, trigger: nil)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully.")
            }
        }
    }
    
    // バッジ数をリセット
    func resetBadgeCount() {
        badgeCount = 0
        UNUserNotificationCenter.current().setBadgeCount(0)
    }
}
