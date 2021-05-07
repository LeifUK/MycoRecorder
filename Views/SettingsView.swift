//
//  SettingsView.swift
//  MycoRecorder
//
//  Created by Leif Goodwin on 02/05/2021.
//

import SwiftUI

struct SettingsView: View
{
    enum CurrentView
    {
        case Settings, Error
    }
    
    @State var currentView = CurrentView.Settings
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
    @State var showIdentifier: Bool = Settings.showIdentifier
    @State var showConfirmer: Bool = Settings.showConfirmer
    @State var showGridReference: Bool = Settings.showGridReference
    @State var showViceCounty: Bool = Settings.showViceCounty
    @State var showCap: Bool = Settings.showCap
    @State var showGills: Bool = Settings.showGills
    @State var showPores: Bool = Settings.showPores
    @State var showSpines: Bool = Settings.showSpines
    @State var showHymenium: Bool = Settings.showHymenium
    @State var showStem: Bool = Settings.showStem
    @State var showFruitingBody: Bool = Settings.showFruitingBody
    @State var showMicroscopy: Bool = Settings.showMicroscopy
    @State var showSubstrate: Bool = Settings.showSubstrate
    @State var showAssociatedOrganisms: Bool = Settings.showAssociatedOrganisms
    @State var showSmell: Bool = Settings.showSmell
    @State var showTaste: Bool = Settings.showTaste
    @State var showFlesh: Bool = Settings.showFlesh

    var body: some View
    {
        if (currentView == CurrentView.Settings)
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
                                Settings.showIdentifier = self.showIdentifier
                                Settings.showConfirmer = self.showConfirmer
                                Settings.showViceCounty = self.showViceCounty
                                Settings.showGridReference = self.showGridReference
                                Settings.showCap = self.showCap
                                Settings.showGills = self.showGills
                                Settings.showPores = self.showPores
                                Settings.showSpines = self.showSpines
                                Settings.showHymenium = self.showHymenium
                                Settings.showStem = self.showStem
                                Settings.showFruitingBody = self.showFruitingBody
                                Settings.showMicroscopy = self.showMicroscopy
                                Settings.showSubstrate = self.showSubstrate
                                Settings.showAssociatedOrganisms = self.showAssociatedOrganisms
                                Settings.showSmell = self.showSmell
                                Settings.showTaste = self.showTaste
                                Settings.showFlesh = self.showFlesh
                                actionOnOK()
                            }
                            else
                            {
                                warningMessage = "The Data File Name may contain only alphanumeric characters"
                                currentView = CurrentView.Error
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
                .padding(.bottom, 0)


                ScrollView()
                {
                    SettingsTextItem(label: "Data File Name", text: $dataFile)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.top, 0)
                        .padding(.bottom, 00)
                    SettingsTextItem(label: "Default Collector", text: $defaultCollector)
                        .padding(10)
                        .padding(.trailing, 0)
                     
                    Group()
                    {
                        VStack()
                        {
                            Text("Record Fields")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 16)
                                .padding(.trailing, 10)
                                .padding(.top, 10)
                            Divider()
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                            VStack()
                            {
                                Group()
                                {
                                    LabelTickView(label: "Species")
                                    LabelTickView(label: "Collector")
                                    Toggle(isOn: $showIdentifier){ Text("Identifier") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    Toggle(isOn: $showConfirmer){ Text("Confirmer") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    LabelTickView(label: "Location")
                                    Toggle(isOn: $showViceCounty){ Text("Vice County") }
                                            .toggleStyle(CheckboxToggleStyle())
                                    Toggle(isOn: $showGridReference){ Text("Grid Reference") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    Toggle(isOn: $showCap){ Text("Cap") }
                                        .toggleStyle(CheckboxToggleStyle())
                                }
                                Group()
                                {
                                    Toggle(isOn: $showGills){ Text("Gills") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    Toggle(isOn: $showPores){ Text("Pores") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    Toggle(isOn: $showSpines){ Text("Spines") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    Toggle(isOn: $showHymenium){ Text("Hymenium") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    Toggle(isOn: $showStem){ Text("Stem") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    Toggle(isOn: $showFruitingBody){ Text("Fruiting Body") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    Toggle(isOn: $showMicroscopy){ Text("Microscopy") }
                                        .toggleStyle(CheckboxToggleStyle())
                                }
                                Group()
                                {

                                    Toggle(isOn: $showSubstrate){ Text("Substrate") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    Toggle(isOn: $showAssociatedOrganisms){ Text("Associated Organisms") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    Toggle(isOn: $showSmell){ Text("Smell") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    Toggle(isOn: $showTaste){ Text("Taste") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    Toggle(isOn: $showFlesh){ Text("Flesh") }
                                        .toggleStyle(CheckboxToggleStyle())
                                    LabelTickView(label: "Notes")
                                }
                            }
                            .padding(.leading, 40)
                            .padding(.trailing, 10)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                        }
                    }
                    .font(.custom("Arial", size: 18))
                    .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                    .cornerRadius(5, corners: [.allCorners])
                    .padding(10)
                }
            }
            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
        }
        else
        {
            VStack()
            {
                Spacer()
                Text(warningMessage)
                    .foregroundColor(Color.red)
                Button(
                    action:
                    {
                        currentView = CurrentView.Settings
                    },
                    label:
                    {
                        Text("OK")
                    })
                Spacer()
            }.font(.custom("Arial", size: 18))

        }
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
