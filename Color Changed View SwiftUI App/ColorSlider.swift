//
//  ColorSlider.swift
//  Color Changed View SwiftUI App
//
//  Created by Julia on 05.03.2022.
//

import SwiftUI

struct ColorSlider: View {
    @Binding var value: Double
    @Binding var textFieldValue: String
    @State var colorName: String
    @State var sliderColor: Color
    
    var body: some View {
        HStack {
            Text(colorName)
                .frame(width: 51, alignment: .leading)
            Text(String(format: "%.2f", value))
            Slider(value: $value, in: 0...1, step: 0.01, onEditingChanged: { _ in
                textFieldValue = String(format: "%.2f",value)
            }).padding()
                .accentColor(sliderColor)
            TextField("", text: $textFieldValue)
                .keyboardType(.decimalPad)
                .frame(width: 39)
                .overlay(RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 1))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .shadow(color: sliderColor, radius: 3, x: 1, y: 2)
        }
        
        .padding(.horizontal)
        .multilineTextAlignment(.leading)
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: .constant(0.2), textFieldValue: .constant(""), colorName: "", sliderColor: .gray)
    }
}
