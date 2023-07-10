//
//  RetirementCalculatorViewModel.swift
//  Practice-CICD-AppCenter
//
//  Created by Rahul Yadav on 10/07/23.
//

import Foundation
import AppCenterAnalytics

class RetirementCalculatorViewModel:ObservableObject{
    
    var monthlyInvestment = ""
    var currentAge = ""
    var retirementAge = ""
    var interest = ""
    var currentSavings = ""
    @Published var message = ""
    
    // MARK: internal utilities
    
    private var monthlyInvestmentScalar:Double{
        Double(monthlyInvestment) ?? 0.0
    }
    
    private var currentAgeScalar:Int{
        Int(currentAge) ?? 0
    }
    
    private var retirementAgeScalar:Int{
        Int(retirementAge) ?? 0
    }
    
    private var interestScalar:Double{
        Double(interest) ?? 0.0
    }
    
    private var currentSavingsScalar:Double{
        Double(currentSavings) ?? 0.0
    }
    
    // MARK: view interactions
    
    func trackCalculate(){
        
        let properties = ["current_age":currentAge,
                          "retirement_age":retirementAge]
        Analytics.trackEvent("calculate_retirement_amount", withProperties: properties)
    }
    
    func calculate(){
        
        let duration:Int = retirementAgeScalar - currentAgeScalar
        let monthlyInvestmentTillRetirement:Double = (monthlyInvestmentScalar * 12) * Double(duration)
        let totalInvestmentTillRetirement:Double = currentSavingsScalar + monthlyInvestmentTillRetirement
        let retirementAmount:Double = totalInvestmentTillRetirement * interestScalar
        
        message = "You are investing Rs. \(currentSavings) and Rs. \(monthlyInvestment) monthly till attainment of \(retirementAge) years. You will be having Rs. \(retirementAmount) as retirement amount."
    }
}
