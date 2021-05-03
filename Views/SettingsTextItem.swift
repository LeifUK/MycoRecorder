//
//  SettingsTextItem.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 03/05/2021.
//

import SwiftUI

struct SettingsTextItem: View
{
    var label: String
    @Binding var text: String

    var body: some View
    {
        VStack
        {
            Text(label)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .padding(.trailing, 10)
                .padding(.top, 10)

            TextField("Dummy", text: $text)
                .padding(0)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.top, 8)
                .padding(.bottom, 2)
                .offset(y: -8)
        }
        .font(.custom("Arial", size: 18))
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        .cornerRadius(5, corners: [.allCorners])
     }}

struct SettingsTextItem_Previews: PreviewProvider
{
    @State static var test: String = "Test"
    static var previews: some View
    {
        SettingsTextItem(label: "demo", text: $test)
    }}
