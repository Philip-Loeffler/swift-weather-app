//
//  ContentView.swift
//  weatherApp
//
//  Created by Philip Loeffler on 3/25/21.
// state = you do not directly update the ui, you tell some source of truth some peice of data, which in
 // this case is the boolean "isNight" so we set up our app to handle if "isNight" is true or false.
// the ui is waiting for this change, and when it happens the ui is watching this source of truth, and when it happens your ui reacts to it. this is declarative programming

import SwiftUI

struct ContentView: View {
    
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            //background view takes in a variable named, isNight. we Pass it the state ?isNight from parents,
            //will update according to the parent
            BackgroundView(isNight: $isNight)
            VStack {
              CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 74)
             
                HStack(spacing: 20) {
                    ForEach(WeatherDayData) { weather in
                        WeatherDayView(dayOfWeek: weather.dayOfWeek,
                                       imageName: weather.imageName,
                                       temperature: weather.temperature
                                       
                        )
                                }
                
                }
                Spacer()
                //toggle is changing the isnight boolean
                //it is a control that toggles between on and off states
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}


//this is similar to passing props
//the vars of the struct will recieve params that display your data
struct WeatherDayView : View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
        Text(dayOfWeek)
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.white)
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
        Text("\(temperature)°")
            .font(.system(size: 28, weight: .medium))
            .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    //so this view is a child of the structContent view. So we are passing the isNight variable down the
    //heirarchy to the childen.
    //the binding on the variable means that its always going to be the same as the state variable up top
    @Binding var isNight: Bool
 
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .white]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
