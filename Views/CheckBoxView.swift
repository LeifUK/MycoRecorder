//
//  CheckBoxView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 05/05/2021.
//

import SwiftUI

struct CheckBoxView: View
{
    @Binding var checked: Bool
    
    var body: some View
    {
        ZStack()
        {
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 21))
                .frame(width: 70, height: 70)
                .foregroundColor(checked ? Color.green : Color.gray.opacity(0.2))
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0, to: 1)
                .fill(checked ? Color.green : Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
            if (checked)
            {
                Image(systemName: "checkmark").foregroundColor(Color.white)
            }
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider
{
    @State static var checked: Bool = true
    
    static var previews: some View
    {
        CheckBoxView(checked: $checked)
    }
}
