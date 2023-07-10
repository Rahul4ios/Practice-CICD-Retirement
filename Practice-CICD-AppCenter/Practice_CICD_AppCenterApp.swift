//
//  Practice_CICD_AppCenterApp.swift
//  Practice-CICD-AppCenter
//
//  Created by Rahul Yadav on 06/07/23.
//

import SwiftUI

@main
struct Practice_CICD_AppCenterApp: App {
    
    @State private var didCrashLastSession = false
    
    init(){
        AppCenterManager.config()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .alert("Sorry for the last crash", isPresented: $didCrashLastSession) {
                    Text("Ok")
                }
                .onAppear{
                    checkLastSessionCrashAndApologize()
                }
        }
    }
}

extension Practice_CICD_AppCenterApp{
    
    private func checkLastSessionCrashAndApologize(){
        didCrashLastSession = AppCenterManager.didCrashInLastSession
    }
}
