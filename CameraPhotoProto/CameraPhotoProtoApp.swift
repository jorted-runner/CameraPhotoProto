//
//  CameraPhotoProtoApp.swift
//  CameraPhotoProto
//
//  Created by Danny Ellis on 2/11/25.
//

import SwiftUI
import SwiftData

@main
struct CameraPhotoProtoApp: App {
    var body: some Scene {
        WindowGroup {
            PhotosListView()
        }
        .modelContainer(for: SampleModel.self)
    }
}
