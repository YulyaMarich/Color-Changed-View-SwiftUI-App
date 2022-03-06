//
//  ContentView.swift
//  Color Changed View SwiftUI App
//
//  Created by Julia on 23.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var sliderValueRed = 0.0
    @State var sliderValueGreen = 0.0
    @State var sliderValueBlue = 0.0
    
    @State var textFieldValueRed = "0.00"
    @State var textFieldValueGreen = "0.00"
    @State var textFieldValueBlue = "0.00"
    
    @State var showAlert = false
    @FocusState var isInputActive: Bool
    
    var body: some View {
        VStack{
            ColorView(red: $sliderValueRed, green: $sliderValueGreen, blue: $sliderValueBlue)
            ColorSlider(value: $sliderValueRed, textFieldValue: $textFieldValueRed, colorName: "Red:", sliderColor: .red)
            ColorSlider(value: $sliderValueGreen, textFieldValue: $textFieldValueGreen, colorName: "Green:", sliderColor: .green)
            ColorSlider(value: $sliderValueBlue, textFieldValue: $textFieldValueBlue, colorName: "Blue:", sliderColor: .blue)
            Spacer()
        }
        .focused($isInputActive)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Wrong format!"),
                  message: Text("Please enter a value from 0.0 to 1.0"))
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    checkColorValue()
                    isInputActive = false
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
    func checkColorValue() {
        
        if let checkedValueRed = Double(textFieldValueRed), checkedValueRed <= 1,
           let checkedValueGreen = Double(textFieldValueGreen), checkedValueGreen <= 1,
           let checkedValueBlue = Double(textFieldValueBlue), checkedValueBlue <= 1 {
            sliderValueRed = checkedValueRed
            sliderValueGreen = checkedValueGreen
            sliderValueBlue = checkedValueBlue
        } else {
            showAlert = true
            textFieldValueRed = "0.0"
            sliderValueRed = 0.0
            textFieldValueGreen = "0.0"
            sliderValueGreen = 0.0
            textFieldValueBlue = "0.0"
            sliderValueBlue = 0.0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
