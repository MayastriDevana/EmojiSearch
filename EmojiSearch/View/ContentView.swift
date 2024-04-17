//
//  ContentView.swift
//  EmojiSearch
//
//  Created by User on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    var emojis : [Emoji] = EmojiProvider.allEmojis()
    
    @State private var searchText: String = ""
    
    var emojiSearchResults: [Emoji]{
        guard !searchText.isEmpty else {
            return emojis }
        
        return emojis.filter { $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationStack {
            List(emojiSearchResults){ emoji in
                EmojiRow(emoji: emoji)
                }
            .navigationTitle("Emoji")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always),
        prompt: "what emoji's that you're looking for?")
            .overlay {
                if emojiSearchResults.isEmpty{
                    ContentUnavailableView.search(text: searchText)
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
