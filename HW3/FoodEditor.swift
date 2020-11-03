//
//  FoodEditor.swift
//  w4
//
//  Created by User15 on 2020/10/28.
//

import SwiftUI

struct FoodEditor: View {
    @State private var name=""
    @State private var many=1
  //  @State private var trueheart=true
    var body: some View {
        NavigationView{
            Form {
            TextField("食材名稱", text: $name)
            Stepper("重量  \(many*50)g", value: $many, in: 1...1000)
            //Toggle("真心", isOn: $trueheart)
            }
            .navigationBarTitle("購買清單")
            .toolbar(content: {
                ToolbarItem{
                    Button( "Save"){
                        
                    }
                }
            })
        }
    }
}

struct FoodEditor_Previews: PreviewProvider {
    static var previews: some View {
        FoodEditor()
    }
}

