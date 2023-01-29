//
//  OTPVerificationView.swift
//  OTPTextField
//
//  Created by Abdullah Karaboğa on 29.01.2023.
//

import SwiftUI

struct OTPVerificationView: View {

    @State var otpText: String = ""
    @FocusState private var isKeyboardShowing: Bool
    var body: some View {

        VStack {
            Text("Verify OTP")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 0) {

                ForEach(0..<6, id: \.self) { index in
                    OTPTextBox(index)
                }
            }.background(content: {
                TextField("", text: $otpText.limit(6))
                    .frame(width: 1, height: 1)
                    .opacity(0.001)
                    .blendMode(.screen)
                    .focused($isKeyboardShowing)
            })
                .padding(.bottom, 20)
                .padding(.top, 10)


            Button {

            } label: {
                Text("Verify")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(
                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                        .fill(.blue)
                )
            }
                .disableWithOpacity(otpText.count < 6)

        }.padding(.all)
            .frame(maxHeight: .infinity, alignment: .top)

    }

    @ViewBuilder
    func OTPTextBox(_ index: Int) -> some View {

        ZStack {
            if otpText.count > index {

                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let chartToString = String(otpText[charIndex])
                Text(chartToString)

            } else {
                Text("")
            }
        }.frame(width: 45, height: 45)
            .background {

            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(.gray, lineWidth: 0.5)

        }
            .frame(maxWidth: .infinity)

    }

}

struct OTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1)
    }
}

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))

            }

        }
        return self
    }
}
