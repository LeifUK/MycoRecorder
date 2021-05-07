//
//  RecordItemView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 24/04/2021.
//

import SwiftUI

struct RecordTextItem: View
{
    var label: String
    @Binding var text: String
    var editorHeight: CGFloat
    
    var body: some View
    {
        VStack
        {
            Text(label)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 6)
                .padding(.top, 4)
                .padding(.bottom, 4)

            TextEditor(text: $text)
                .foregroundColor(Color.black)
                .padding(.leading, 2)
                .padding(.trailing, 2)
                .padding(.bottom, 2)
                 .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: editorHeight,
                    maxHeight: editorHeight,
                    alignment: .top)
                .offset(y: -8)
                .padding(.bottom, -10)
        }
        .font(.custom("Arial", size: 20))
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        .cornerRadius(5, corners: [.allCorners])
     }
}

struct RecordItemView_Previews: PreviewProvider
{
    @State static var test: String = "Test"
    static var previews: some View
    {
        RecordTextItem(label: "demo", text: $test, editorHeight: 150)
    }
}
