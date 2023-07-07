//
//  AppCenterManager.swift
//  Practice-CICD-AppCenter
//
//  Created by Rahul Yadav on 06/07/23.
//

import Foundation
import AppCenter
import AppCenterCrashes
import AppCenterAnalytics

class AppCenterManager{
    
    static func config(){
        
        AppCenter.start(withAppSecret: "c55297d9-645f-4c5b-ac7b-fbfbd6b9f39d", services: [Crashes.self, Analytics.self])
    }
}
