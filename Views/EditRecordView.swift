//
//  EditRecordView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 28/04/2021.
//

import SwiftUI

struct EditRecordView: View
{
    var actionOnOK: () -> Void
    var actionOnCancel: () -> Void
    @Binding var record: Record
    @State var dateEditable: Bool
    
    var body: some View
    {
        VStack
        {
            HStack()
            {
                Button(
                    action:
                    {
                        actionOnOK()
                    },
                    label:
                    {
                        Text("Add").font(.headline).padding()
                    })
                Spacer()
                Button(
                    action:
                    {
                        actionOnCancel()
                    },
                    label:
                    {
                        Text("Cancel").font(.headline).padding()
                    })
            }.frame(maxHeight: 40)
            RecordView(record: $record, readOnly: !dateEditable, onDisappear: {})
        }
    }
}

struct EditRecordView_Previews: PreviewProvider
{
    @State static var record = Record()
    
    static var previews: some View
    {
        EditRecordView(actionOnOK: {}, actionOnCancel: {}, record: $record, dateEditable: true)
    }
}
