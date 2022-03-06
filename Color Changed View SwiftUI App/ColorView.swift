//
//  ColorView.swift
//  Color Changed View SwiftUI App
//
//  Created by Julia on 05.03.2022.
//

import SwiftUI

struct ColorView: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        Color(UIColor(red: red, green: green, blue: blue, alpha: 1))
            .frame(width: 355, height: 160)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 4).foregroundColor(.gray))
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: .constant(0.2), green: .constant(0.2), blue: .constant(0.2))
    }
}
