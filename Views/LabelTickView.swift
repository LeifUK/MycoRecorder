//
//  LabelTickView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 07/05/2021.
//

import SwiftUI

struct LabelTickView: View
{
    var label: String
    
    var body: some View
    {
        HStack()
        {
            Text(label)
            Spacer()
            Image(systemName: "checkmark")
                .resizable()
                .frame(width: 12, height: 12)
                .padding(.trailing, 8)
        }
    }
}

struct LabelTickView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LabelTickView(label: "Test")
    }
}
