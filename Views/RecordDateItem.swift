//
//  RecordDateItem.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 28/04/2021.
//

import SwiftUI

struct RecordDateItem: View
{
    var label: String
    @Binding var date: Date
    @State var readOnly: Bool
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Text(label)
                .font(.custom("Arial", size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 4)
                .padding(.bottom, 4)
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                .cornerRadius(5, corners: [.topLeft, .topRight])

            DatePicker("", selection: $date, displayedComponents: [.date])
                .labelsHidden()
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .leading)
                .padding(0)
                .background(Rectangle().fill(Color.white))
                .cornerRadius(5, corners: [.bottomLeft, .bottomRight])
                .offset(y: -8)
                .padding(.bottom, -10)
                .disabled(readOnly)
         }
     }
}

struct RecordDateItem_Previews: PreviewProvider
{
    @State static var date: Date = Date()
    static var previews: some View
    {
        RecordDateItem(label: "Date", date: $date, readOnly: false)
    }
}
