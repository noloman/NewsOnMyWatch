//
//  NewsOnMyWatchApp.swift
//  NewsOnMyWatch WatchKit Extension
//
//  Created by WF06FC on 16/12/2021.
//

import SwiftUI

@main
struct NewsOnMyWatchApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
