//
//  ContentView.swift
//  CameraPhotoProto
//
//  Created by Danny Ellis on 2/11/25.
//

import SwiftUI
import SwiftData

struct PhotosListView: View {
    @Query(sort: \SampleModel.name) var samples: [SampleModel]
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        NavigationStack {
            Group {
                if samples.isEmpty {
                    ContentUnavailableView(
                        "No Photos Found",
                        systemImage: "photo"
                    )
                } else {
                    List(samples) { sample in
                        NavigationLink(value: sample) {
                            HStack {
                                Image(
                                    uiImage: sample.image == nil ? Constants.placeholder : sample.image!
                                ).resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(
                                        RoundedRectangle(
                                            cornerRadius: 12
                                        )
                                    )
                                    .padding(.trailing)
                                Text(sample.name)
                                    .font(.title)
                            }
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                modelContext.delete(sample)
                                try? modelContext.save()
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationDestination(for: SampleModel.self) { sample in
                SampleView(sample: sample)
            }
            .navigationTitle(Text("Picker or Camera"))
            .toolbar {
                Button {
                    
                }label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
        }
    }
}

#Preview {
    PhotosListView()
        .modelContainer(SampleModel.preview)
}
