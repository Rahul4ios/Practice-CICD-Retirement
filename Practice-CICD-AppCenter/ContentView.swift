//
//  ContentView.swift
//  Practice-CICD-AppCenter
//
//  Created by Rahul Yadav on 06/07/23.
//

import SwiftUI
import AppCenterCrashes
import AppCenterAnalytics

struct ContentView: View {
    
    @ObservedObject var viewModel = RetirementCalculatorViewModel()
    
    var body: some View {
        VStack{
            Form {
                Section{
                    TextField("Monthly investment", text: $viewModel.monthlyInvestment)
                    TextField("Current age", text: $viewModel.currentAge)
                    TextField("Retirement age", text: $viewModel.retirementAge)
                    TextField("Interest", text: $viewModel.interest)
                    TextField("Current savings", text: $viewModel.currentSavings)
                }
                Section{
                    Button("Calculate") {
                        //
                        viewModel.trackCalculate()
                        
                        //
                        viewModel.calculate()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 44.0)
                    .background(Color.blue)
                    .cornerRadius(8.0)
                    .foregroundColor(.white)
                }
                Section{
                    if viewModel.message.isEmpty == false{
                        Text(viewModel.message)
                    }
                }
            }
        }
        .onAppear{
            Analytics.trackEvent("navigatedTo_calculate_retirement_amount")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
