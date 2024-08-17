//
//  onboardingscreenView.swift
//  shopping-app
//
//  Created by Keshav kumar on 15/08/24.
//

import SwiftUI

struct onboardingscreenView: View 
{
    var body: some View
    {
        NavigationView
        {
            VStack(spacing : 60)
            {
                Image("img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(spacing : 30)
                {
                    Text("Order Your Favourite Fruits")
                        .fontWeight(.bold)
                        .font(.system(.largeTitle))
                        .multilineTextAlignment(.center)
                    Text("Eat Fresh Fruits and lead a healthy lifestyle")
                        .font(.system(.title3))
                        .foregroundColor(.black.opacity(0.8))
                    
                }
                
                NavigationLink(destination: homescreenView())
                {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("6"))
                        .frame(width: 280, height: 60, alignment: .trailing)
                        .overlay(
                            HStack(spacing: 10)
                            {
                                Text("Next")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.black)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                            }
                        )
                }
            }
        }
    }
}

#Preview 
{
    onboardingscreenView()
}
