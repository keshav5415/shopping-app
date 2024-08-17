//
//  fruitcardView.swift
//  shopping-app
//
//  Created by Keshav kumar on 16/08/24.
//

import SwiftUI

/*
 The line 'let images: FruitModel = FruitModel(id: 1, title: .apple, image: "apple", price: "$1.99 each", color: "1")' is creating a constant named 'images' of type 'FruitModel'. This constant holds an instance of 'FruitModel' initialized with specific values.
*/
let images : FruitModel = FruitModel(id: 1, title: .apple, image: "apple", price: "$1.99 each", color: "1")



struct fruitcardView: View
{
    /*
     The line 'let fruits: FruitModel' is used to define a constant property 'fruits' within the 'fruitcardView' struct. This property holds an instance of 'FruitModel', which is a data model representing the fruit's details such as 'id', 'title', 'image', 'price', and 'color'.
    */
    /*
    Why is it needed ?
     
    ->Data Binding: 'fruitcardView' needs to display specific information (like the fruit's title, price, image, and color) on the UI. The 'fruits' property provides access to this data within the view.
    ->Reusability: By passing an instance of 'FruitModel' when creating the view, you can reuse the same 'fruitcardView' for different fruits. This makes the view more flexible and reusable for displaying different fruits without changing the view's internal implementation.
     
    */
    let fruits : FruitModel
    /*
     In Swift, the line 'let fruits: FruitModel' declares a constant property named 'fruits' of type 'FruitModel' within a struct that have properties.
    */
    
    var body: some View
    {
        ZStack
        {
            VStack(alignment: .leading, spacing: 5)
            {
                Text(fruits.title.rawValue) // title was using 'enum' , so 'rawvalue'.
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                Text(fruits.price)
                    .font(.title2)
                    .foregroundColor(.black.opacity(0.7))
                Spacer()
                /*
                 we are using this 'Spacer()' to make the text go up by a liitle .
                 You can decorate it your own way !
                */
                /*
                 For example, in a 'VStack', placing a Spacer above or below a view will push that view to the opposite edge of the 'VStack'.
                */
                /*
                 we can also use 'Spacer()' to maintain spacing if we are using it in
                 between 2 'VStack'
                */
                /*
                 if you use a 'Spacer' between two 'VStack' elements, it will push the
                 'VStack' elements away from each other, distributing the available
                 space between them. This can be useful for creating layouts where you
                 want the two 'VStack' elements to be separated by flexible space.
                */
            }
            .padding()
            .frame(width: 175, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color(fruits.color))
            .cornerRadius(30)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: 5)
            
            /*
             'fruits.image' refers to a property of the 'FruitModel' that contains the name of the image associated with that specific fruit. This allows the view to display the correct image for any fruit dynamically, rather than hardcoding "apple".
            */
            Image(fruits.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 110)
                .offset(y: 60)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: 5)

        }
        .frame(width: 175, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        /* not going to do anything , it is just making sure that it remains in this manner , no matter what
        */
    }
}

#Preview 
{
    fruitcardView(fruits: images)
}
