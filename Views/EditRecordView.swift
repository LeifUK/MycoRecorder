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
    
    var body: some View
    {
        VStack
        {
            HStack(spacing: 50)
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
                Button(
                    action:
                    {
                        actionOnCancel()
                    },
                    label:
                    {
                        Text("Cancel").font(.headline).padding().foregroundColor(Color.red)
                        
                    })
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            RecordView(record: $record)
        }
    }
}

struct EditRecordView_Previews: PreviewProvider
{
    @State static var record = Record()
    
    static var previews: some View
    {
        EditRecordView(actionOnOK: {}, actionOnCancel: {}, record: $record)
    }
}
