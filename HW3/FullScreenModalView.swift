//
//  FullScreenModalView.swift
//  hw3
//
//  Created by User01 on 2020/11/2.
//

import SwiftUI

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode

      var body: some View {
          VStack {
              Text("安安！！ 黃色桌布")
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color.yellow)
          .edgesIgnoringSafeArea(.all)
          .onTapGesture {
              presentationMode.wrappedValue.dismiss()
          }
      }
}

struct FullScreenModalView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenModalView()
    }
}
