//
//  ContentView.swift
//  EmojiFinder
//
//  Created by Macbook Pro on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var isRedacted: Bool = true
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
                // untuk subjek navigasi
                NavigationLink {
                    // tujuannya kemana
                    EmojiDetail(emoji: emoji)
                } label: {
                    // apa yang dikliknya
                    if isRedacted {
                        EmojiRow(emoji: emoji)
                            .redacted(reason: .placeholder)
                    } else {
                        EmojiRow(emoji: emoji)
                    }
                }

//                EmojiRow(emoji: emoji)
//                    .listRowSeparator(.hidden)
            }
            .navigationTitle("Emoji")
            .onAppear{
                // aktivitas yg dilakukan background tidak menganggu aktivitas lainnya
                DispatchQueue.main
                    .asyncAfter(deadline: .now() + 2) {
                        isRedacted = false
                    }
            }
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
