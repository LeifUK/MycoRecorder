//
//  View.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 03/05/2021.
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

struct CheckboxToggleStyle: ToggleStyle
{
    func makeBody(configuration: Configuration) -> some View
    {
        HStack()
        {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 22, height: 22)
                .onTapGesture{ configuration.isOn.toggle() }
        }
    }
}

