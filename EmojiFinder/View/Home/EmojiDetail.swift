//
//  EmojiDetail.swift
//  EmojiFinder
//
//  Created by Macbook Pro on 17/04/24.
//

import SwiftUI

struct EmojiDetail: View {
    var emoji: Emoji
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                HeaderView(emoji: emoji)
                HStack {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Emoji Name: \(emoji.name)")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text(emoji.description)
                        InfoBox()
                    }
                    Spacer()
                }
                .padding()
            }
            .ignoresSafeArea()
            .navigationTitle(emoji.name)
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    EmojiDetail(emoji: EmojiProvider.allEmojis().first!)
}
