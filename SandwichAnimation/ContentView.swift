//
//  ContentView.swift
//  SandwitchApp
//
//  Created by Iuliana Stecalovici on 3/6/24.
//

import SwiftUI

import SwiftUI

let screenWidth = UIScreen.main.bounds.width - 20

struct ContentView: View {
    @State var isOnScreen = false

    var body: some View {
        ZStack {
            Color(hex: 0xcec4b1)
            Group {
                PlateView()
                SandwitchView()
                    .animation(.spring, value: isOnScreen)
            }
            .rotationEffect(Angle(degrees: isOnScreen ? 0 : 750))
            .offset(y: isOnScreen ? 800 : 0)
        }

        .ignoresSafeArea()
        .onTapGesture {
            withAnimation(Animation.spring.speed(1)) {
                isOnScreen.toggle()
            }
        }
    }
}

struct PlateView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(height: screenWidth - 60)
                .shadow(radius: 20, x: 10, y: 10)

            Circle()
                .frame(height: screenWidth - 150)
                .shadow(radius: 5)
        }
        .foregroundStyle(.white)
    }
}

struct SandwitchView: View {
    var body: some View {
        ZStack {
            BreadSliceView()
            CheeseView()
            SaladView()
            TomatoGroupView()
            BreadSliceView()
        }
    }
}

struct BreadSliceView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: screenWidth / 2.5, height: screenWidth / 3)

            Capsule()
                .frame(width: screenWidth / 2.1, height: screenWidth / 6)
                .offset(x: 0 ,y: -50)

            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(hex: 0xb4864d), style: StrokeStyle(lineWidth: 6))
                .frame(width: screenWidth / 2.5, height: screenWidth / 3)
            Capsule()
                .stroke(Color(hex: 0xb4864d), style: StrokeStyle(lineWidth: 6))
                .frame(width: screenWidth / 2.1, height: screenWidth / 6)
                .offset(x: 0 ,y: -50)

            Rectangle()
                .frame(width: screenWidth / 2.6, height: screenWidth / 4)
                .offset(y: -20)
            Capsule()
                .frame(width: screenWidth / 2.2, height: screenWidth / 6)
                .offset(x: 0 ,y: -48)

            BreadBubbleView()
                .offset(x: 40, y: 30)
        }
        .foregroundStyle(Color(hex: 0xefcba7))
    }
}

struct BreadBubbleView: View {
    var body: some View {
        ZStack {
            Circle()
                .offset(x: -10, y: 10)
            Circle()
                .offset(x: 10, y: 10)
            Circle()
                .offset(x: 0, y: -10)

        }
        .frame(height: 10)
        .foregroundStyle(Color(hex: 0xbb915c))
    }
}

struct CheeseView: View {
    var body: some View {
        Rectangle()
            .foregroundStyle(.yellow)
            .rotationEffect(Angle(degrees: 20))
            .frame(width: screenWidth / 2.5, height: screenWidth / 2.5)
    }
}

struct SaladView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round, dash: [25]))
                .frame(width: screenWidth / 2.8, height: screenWidth / 2.9)

            Rectangle()
                .frame(width: screenWidth / 3, height: screenWidth / 3)
        }
        .rotationEffect(.degrees(50))
        .foregroundStyle(Color(hex: 0x60c57b))
    }
}

struct TomatoGroupView: View {
    var body: some View {
        VStack {
            TomatoView()
                .offset(x: -75)
            TomatoView()
                .offset(x: 50)
        }
    }
}

struct TomatoView: View {
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color(hex: 0xa40001), lineWidth: 6)
                .background(Circle().foregroundColor(Color(hex: 0xce050b)))
                .frame(width: screenWidth / 5, height: screenWidth / 5)
            elipse
                .frame(width: screenWidth / 7, height: screenWidth / 8)
                .foregroundColor(Color(hex: 0xe4a094))
        }
    }

    var elipse: some View {
        HStack(spacing: 3) {
            Ellipse()
            Ellipse()
            Ellipse()
        }
    }
}

extension Color {
    init(hex: Int, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}

#Preview {
    ContentView()
}
