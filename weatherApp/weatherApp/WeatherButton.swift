//
//  WeatherButton.swift
//  weatherApp
//
//  Created by Philip Loeffler on 3/26/21.
//

import Foundation
//if something is unique to the screen, good idea to keep it in the same file. since this button would be reused a ton, good idea to put it in its own file
import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(Color.white)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
