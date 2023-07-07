//
//  Practice_CICD_AppCenterApp.swift
//  Practice-CICD-AppCenter
//
//  Created by Rahul Yadav on 06/07/23.
//

import SwiftUI

@main
struct Practice_CICD_AppCenterApp: App {
    
    init(){
        AppCenterManager.config()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
