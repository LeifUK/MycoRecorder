//
//  SettingsView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 02/05/2021.
//

import SwiftUI

struct SettingsView: View
{
    @State var dataFile: String = Settings.dataFile
    {
        // Not called!
        // Presumably a bug
        didSet
        {
            if (!dataFile.isAlphaNumeric)
            {
                dataFile = oldValue
            }
        }
    }
    @State var defaultCollector: String = Settings.defaultCollector
    var actionOnOK: () -> Void
    var actionOnCancel: () -> Void
    @State var warningMessage = ""

    var body: some View
    {
        VStack(spacing: 0)
        {
            HStack()
            {
                Button(
                    action:
                    {
                        if (dataFile.isAlphaNumeric)
                        {
                            Settings.dataFile = self.dataFile
                            Settings.defaultCollector = self.defaultCollector
                            actionOnOK()
                        }
                        else
                        {
                            warningMessage = "The Data File Name may contain only alphanumeric characters"
                        }
                    },
                    label:
                    {
                        Text("Done").padding().font(.custom("Arial", size: 18))
                    })
                Spacer()
                Button(
                    action:
                    {
                        actionOnCancel()
                    },
                    label:
                    {
                        Text("Cancel").padding().font(.custom("Arial", size: 18))
                    })
            }
            .frame(maxHeight: 40)
            HStack()
            {
                Text("Settings")
                    .padding()
                    .font(.custom("Arial", size: 32))
                Spacer()
            }
            .padding(.top, 0)
            
            SettingsTextItem(label: "Data File Name", text: $dataFile)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.top, 0)
                .padding(.bottom, 00)
            SettingsTextItem(label: "Default Collector", text: $defaultCollector)
                .padding(10)
            Spacer()
            Text(warningMessage).foregroundColor(Color.red)
            Spacer()
        }
        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
    }
}

struct SettingsView_Previews: PreviewProvider
{
    @State static var dataFile = "MycoRecorder"
    @State static var defaultCollector = "John Smith"
    
    static var previews: some View
    {
        SettingsView(actionOnOK: {}, actionOnCancel: {})
    }
}
