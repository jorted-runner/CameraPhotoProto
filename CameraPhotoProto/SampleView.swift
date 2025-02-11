//
//  SampleView.swift
//  CameraPhotoProto
//
//  Created by Danny Ellis on 2/11/25.
//

import SwiftUI
import SwiftData

struct SampleView: View {
    let sample: SampleModel
    var body: some View {
        VStack {
            Text(sample.name)
                .font(.largeTitle)
            Image(uiImage: sample.image == nil ? Constants.placeholder : sample.image!)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
        }
        .padding()
    }
}

#Preview {
    let container = SampleModel.preview
    let fetchDescriptor = FetchDescriptor<SampleModel>()
    let sample = try! container.mainContext.fetch(fetchDescriptor)[0]
    return NavigationStack {SampleView(sample: sample)}
}
