//
//  RecordItemView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 24/04/2021.
//

import SwiftUI

struct RoundedCorner: Shape
{
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path
    {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View
{
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View
    {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RecordItemView: View
{
    var label: String
    @Binding var text: String
    
    var body: some View
    {
        VStack
        {
            Text(label)
               .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 4)
                .padding(.bottom, 4)
                .background(Color(red: 0.2, green: 0.2, blue: 1))
                .foregroundColor(Color.white)
                .cornerRadius(10, corners: [.topLeft, .topRight])

                TextEditor(text: $text)
                    .foregroundColor(Color.black)
                    .padding(0)
                     .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 150,
                        maxHeight: 150,
                        alignment: .top)
                    .padding(0)
                     .font(.custom("Arial", size: 24))
                    .offset(y: -8)
                    .padding(.bottom, -10)
        }
    }
}

struct RecordItemView_Previews: PreviewProvider
{
    @State static var test: String = "Test"
    static var previews: some View
    {
        RecordItemView(label: "demo", text: $test)
    }
}
