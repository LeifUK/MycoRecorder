//
//  RecordPickerItem.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 13/05/2021.
//

import SwiftUI

struct RecordPickerItem: View
{
    var label: String
    @State var showEditView: Bool = false
    @Binding var viceCounty: String
    @Binding var viceCountyId: Int

    var body: some View
    {
        VStack
        {
            Text(label)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 6)
                .padding(.top, 4)
                .padding(.bottom, 4)
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))

            HStack()
            {
                Text(viceCounty)
                Spacer()
                Button(
                    action:
                    {
                        showEditView = true
                    },
                    label:
                    {
                        Text("Edit").padding().font(.custom("Arial", size: 18))
                    })
            }
            .padding(.leading, 6)
            .offset(y: -8)
            .padding(.bottom, -10)
        }
        .font(.custom("Arial", size: 20))
        .background(Color.white)
        .cornerRadius(5, corners: [.allCorners])
        .fullScreenCover(isPresented: $showEditView)
        {
            VStack()
            {
                HStack()
                {
                Button(
                    action:
                    {
                        viceCountyId = (ViceCounties as NSDictionary).allKeys(for: viceCounty).first as! Int
                        showEditView = false
                    },
                    label:
                    {
                        Text("Done").padding().font(.custom("Arial", size: 18))
                    })
                    Spacer()
                }
                Picker(selection: $viceCounty, label: Text(""))
                    {
                    ForEach(ViceCounties.values.sorted(), id: \.self)
                        {
                            item in
                            Text(item)
                        }
                    }
                Spacer()
            }

            .background(Color.white)
        }
     }
}

struct RecordPickerItem_Previews: PreviewProvider
{
    @State static var viceCounty: String = "Essex"
    @State static var text = "Essex"
    @State static var viceCountyId = 0
    static var previews: some View
    {
        RecordPickerItem(label: "Hello", viceCounty: $viceCounty, viceCountyId: $viceCountyId)
    }
}
