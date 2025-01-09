//
//  AppDelegate.swift
//  LocalNotifications
//
//  Created by 0v0 on 2024/12/31.
//

import Foundation
import NotificationCenter

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        // リクエストのメソッド呼び出し
        NotificationManager.instance.requestPermission()
        
        // UNUserNotificationCenter デリゲートの設定
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }

    // デリゲートメソッド: フォアグラウンドで通知を受信したときの挙動
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        // 通知の表示オプションを設定
        // .badgeを追加することで、バッジをフォアグラウンドでも更新
        completionHandler([.banner, .sound,.badge])
    }

    // デリゲートメソッド: ユーザーが通知をタップしたときの挙動
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        // 通知のペイロードを処理
        let userInfo = response.notification.request.content.userInfo
        print("User tapped notification with info: \(userInfo)")

        // 完了ハンドラを呼び出す
        completionHandler()
    }
}
