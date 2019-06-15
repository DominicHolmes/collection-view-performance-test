//
//  ContentView.swift
//  collection-view-test
//
//  Created by Dominic Holmes on 6/14/19.
//  Copyright © 2019 Dominic Holmes. All rights reserved.
//

import SwiftUI

struct Box: Identifiable {
    let id: Int
    let name: String
}

struct ContentView : View {
    let boxes: [Box] = {
        var temp = [Box]()
        for i in 0 ... 10000 {
            temp.append(Box(id: i, name: "Box \(i)"))
        }
        return temp
    }()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    HStack {
                        ForEach(boxes) { box in
                            VStack {
                                Image("tweaks")
                                    .resizable()
                                    .cornerRadius(12)
                                    .frame(width: 100, height: 100)
                                Text(box.name)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
                .padding(20)
                .navigationBarTitle(Text("Collection Test"))
                
                List(boxes) { box in
                    VStack {
                        Image("tweaks")
                            .resizable()
                            .cornerRadius(12)
                            .frame(width: 100, height: 100)
                        Text(box.name)
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
