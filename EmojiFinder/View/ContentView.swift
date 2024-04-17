//
//  ContentView.swift
//  EmojiFinder
//
//  Created by Macbook Pro on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    var emojis: [Emoji] = EmojiProvider.allEmojis()
    // variabel untuk bisa nampilkan sesuai search text nya
    var emojiSearchResults: [Emoji] {
        // guard : merupakan implementasi if doang
        guard !searchText.isEmpty else {
            return emojis
        }
        // bisa menggunakan $0 karena
        // $0 === emoji in emoji
        return emojis.filter { emoji in
            emoji.name.lowercased().contains(searchText.lowercased())
        }
    }
    var body: some View {
        NavigationStack {
            List(emojiSearchResults) { emoji in
                EmojiRow(emoji: emoji)
//                    .listRowSeparator(.hidden)
            }
            .navigationTitle("Emoji")
            // menampilkan bar search dan handle agar tidak hilang
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "What emoji's that you're looking for ?")
            .overlay {
                if emojiSearchResults.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                }
            }
//            .listStyle(.sidebar)
        }
    }
}

#Preview {
    ContentView()
}
