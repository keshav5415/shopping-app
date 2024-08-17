//
//  homescreenView.swift
//  shopping-app
//
//  Created by Keshav kumar on 15/08/24.
//

import SwiftUI

struct homescreenView: View
{
    var body: some View 
    {
        NavigationView
        {
            VStack(alignment: .leading , spacing: 10)
            {
                HStack
                {
                    Image(systemName: "line.3.horizontal")
                    Spacer()
                    Image(systemName: "cart.badge.plus")
                }
                .font(.system(.title2))
                
                
                Text("Hey!!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text("Find your fruits over here")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black.opacity(0.7))
                
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.gray.opacity(0.4))
                    .overlay(
                        HStack
                        {
                            Image(systemName: "magnifyingglass")
                            Text("search fresh fruits")
                                .foregroundColor(.gray)
                            Spacer()
                        }.padding()
                    )
                    .frame(width: 350, height: 50, alignment: .center)
                
                
                
                Text("Top Selling Fruits")
                    .offset(y : 10)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.black) // foregroundColor will be deprecated in future , so use this !
                
                topsellingView()
                    .offset(y : -30)
                
                
                Text("Stores Nearby You")
                    .offset(y : -30)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.black) // foregroundColor will be deprecated in future , so use this !
                
                nearyouView()
                    .offset(y : -20)

                
                
            }.padding()
        }
    }
}

#Preview 
{
    homescreenView()
}


/*
 ->The '.padding()' modifier is applied to the entire 'VStack', which adds default padding around it. This
 padding ensures that the 'HStack' and any other future views inside the 'VStack' do not touch the edges of
 the screen but have some space around them.
 
 The padding will create a margin between the 'VStack' content and the edges of the view, giving it a more
 balanced and less cramped appearance.
*/


/*
 In iOS development, especially when using SwiftUI, the .padding modifier is used to control the spacing
 around views, ensuring that elements do not touch or get too close to the edges of their container or other
 views. It helps in creating a more visually pleasing and user-friendly interface by adding appropriate
 space around components.
*/
