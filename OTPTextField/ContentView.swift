//
//  ContentView.swift
//  OTPTextField
//
//  Created by Abdullah Karaboğa on 29.01.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        if #available(iOS 15, *) {
            OTPVerificationView()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        } else {
            NavigationStack {
                OTPVerificationView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
