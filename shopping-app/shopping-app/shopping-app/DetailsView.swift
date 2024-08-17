//
//  DetailsView.swift
//  shopping-app
//
//  Created by Keshav kumar on 16/08/24.
//


import SwiftUI

/*
 ->  The 'RoundedCornerShape' struct you've written is a custom shape in SwiftUI that allows you to create a rectangle with specific corners rounded to a certain radius. This shape can then be used in various SwiftUI views to achieve custom UI effects. Let’s break down the code piece by piece to understand what each part does.
 
 ->  : Shape: This means that 'RoundedCornerShape' conforms to the 'Shape' protocol, which is a protocol in SwiftUI. By conforming to 'Shape', this struct is required to implement the 'path(in:)' method, which defines the actual shape to be drawn.
 
 ->  let corners: UIRectCorner:
     * 'corners' is a constant property that holds a value of type 'UIRectCorner'.
     * 'UIRectCorner' is an enumeration provided by UIKit that specifies which corners of a rectangle should be rounded. Possible values include '.topLeft', '.topRight', '.bottomLeft', '.bottomRight', or combinations of these using an array like ['.topLeft, .bottomRight'].
 
 ->  'let radius: CGFloat':
     * 'radius' is a constant property that holds a 'CGFloat' value, which represents the radius of the rounded corners. 'CGFloat' is a type that represents floating-point numbers, commonly used for sizes and coordinates in graphics programming.
 
 ->  func path(in rect: CGRect) -> Path
     * This is the method required by the 'Shape' protocol.
     * It takes a 'CGRect' as input, which represents the area in which the shape will be drawn.
     * The method returns a 'Path' object, which is a SwiftUI structure that defines the outline of the shape.

 ->  let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
     * This line creates a 'UIBezierPath' object, which is a UIKit class used to define complex shapes such as lines, curves, and rectangles with rounded corners.
     * 'roundedRect: rect': Specifies that the shape should be a rectangle, with the size and position defined by 'rect'.
     * 'byRoundingCorners': corners: Specifies which corners should be rounded, as indicated by the 'corners' property.
     * 'cornerRadii: CGSize(width: radius, height: radius)': Defines the size of the rounded corners, where both the width and height of the corner radii are set to 'radius'
 
 ->  return Path(path.cgPath)
     * This converts the 'UIBezierPath' object to a 'CGPath', which is a lower-level representation of the shape that can be used in both UIKit and SwiftUI.
     * The 'CGPath' is then wrapped in a SwiftUI 'Path' object, which is returned by the method.
     * This 'Path' object is what SwiftUI will use to draw the shape on the screen.

*/

struct RoundedCornerShape: Shape 
{
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path 
    {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
    
}

struct Counter: View 
{
    @State var count = 0
    
    var body: some View 
    {
        HStack(spacing: 25)
        {
            Button 
            {
                count += 1
            } 
            label:
            {
                Image(systemName: "plus")
            }
            
            Text("\(count)")
                .font(.title)
            
            Button
            {
                if count != 0 
                {
                    count -= 1
                }
            } 
            label:
            {
                Image(systemName: "minus")
            }

        }
        .foregroundColor(.black)
        .frame(width: 130, height: 50)
        .background(Color("bgColor").opacity(0.2))
        .cornerRadius(12)
        .padding()
    }
}


struct DetailsView: View 
{
    /*
     ->'@State :This is a property wrapper in SwiftUI that allows a variable to be mutable (modifiable) within a view. When the value of a @State variable changes, SwiftUI automatically updates the view to reflect the new state.
     
     ->'var fruit: FruitTitle':
     (*) 'fruit' is the name of the variable
     (*) 'FruitTitle' is the type of the variable. This could be an enumeration or another type that represents different kinds of fruits.
    */
    
    @State var fruit: FruitTitle
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: 25)
        {
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .clipShape(RoundedCornerShape.init(corners: [.bottomLeft, .bottomRight], radius: 50))
                .frame(width: .infinity, height: .infinity, alignment: .top)
                .edgesIgnoringSafeArea(.all)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                .overlay(
                    Image("\(fruit.rawValue)")
                        .resizable()
                        .frame(width: 250, height: 250, alignment: .center)
                        .shadow(color: .gray, radius: 5, x: 5, y: 5)
                )
            Spacer()
            Text("\(fruit.rawValue) - Medium")
                .fontWeight(.medium)
                .font(.system(.title))
                .padding(.horizontal)
                .textCase(.uppercase)  // to convert from 'lowercase' to 'uppercase' !
            Text("Each (500g - 700g)")
                .padding(.horizontal)
            Text("Organic agriculture is intended to produce high quality, nutritious food that contributes to preventive health care and well-being. In view of this, it avoids the use of fertilizers, pesticides, animal drugs and food additives that may have adverse health effects.")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
                .lineLimit(6)
                .padding(.horizontal)
            
            HStack
            {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("bgColor"))
                    .opacity(0.15)
                    .overlay(Image(systemName: "hourglass"))
                    .font(.system(size: 40))
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 5)
                {
                    Text("Delivery Time")
                    Text("25-30 Min ")
                }
            }.padding(.horizontal)
            
            HStack
            {
                Text("$1.99")
                    .fontWeight(.medium)
                    .font(.title)
                    .padding(.horizontal)
                Spacer()
                Counter()
            }
            
            Image("bg")
                .resizable()
                .frame(width: 350, height: 50, alignment: .center)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                .overlay(
                    Text("Add to cart")
                        .font(.system(.title3))
                        .fontWeight(.medium)
                )
                .padding(.horizontal)
            
        }
        
    }
}

struct DetailsView_Previews: PreviewProvider 
{
    static var previews: some View 
    {
        DetailsView(fruit: .apple)
    }
}

/*
 The need for 'RoundedCornerShape' in SwiftUI arises when you want more flexibility in
 creating shapes with rounded corners. While 'RoundedRectangle' is a built-in shape that
 allows you to create a rectangle with rounded corners, 'RoundedCornerShape' (a custom shape)
 can offer additional flexibility in some cases. Here's why you might use RoundedCornerShape
 instead of RoundedRectangle:
 
 
 1. Customizable Corner Radius for Each Corner:
 -> 'RoundedRectangle' applies the same corner radius to all corners.
 ->If you need to apply different corner radii to different corners, you would need to create
 a custom shape like 'RoundedCornerShape'.
 
 2. Custom Shape Needs:
 ->If you want to create a shape that isn't a rectangle but still requires rounded corners (for example, a custom polygon or path), you might need a custom shape like 'RoundedCornerShape'.
 
 3. Specific Requirements:
 -> In some cases, your design might have specific requirements that 'RoundedRectangle' can't fulfill. For example, you might want rounded corners only on certain edges of a shape, or you might need a more complex layout that requires custom rounding logic.
*/
