//
//  URLView.swift
//  vscoder
//
//  Created by Don Browning on 4/26/20.
//  Copyright © 2020 Don Browning. All rights reserved.
//

import SwiftUI

struct URLView: View {
    @EnvironmentObject var settings: UserSettings
    @Binding var showModal: Bool
    @State var name: String = ""
    
    var body: some View {
        VStack {
            Text("Inside Modal View")
                .padding()
            TextField("some text", text:$name)
                .border(Color.black)
            Button("Save") {
                self.settings.url = self.name
                self.showModal.toggle()
            }
        }
    }
}

struct URLView_Previews: PreviewProvider {
    static var previews: some View {
        URLView(showModal: .constant(true))
    }
}
