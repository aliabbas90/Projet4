//
//  listnoel.swift
//  Projet4
//
//  Created by Lion on 21/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    var listPresent : [Present]
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach(listPresent) { present in
                    HStack {
                        NavigationLink {
                            DetailViewPresent(present: present)
                        } label: {
                           ListLabelNoel(labelNoel: present)
                        }
                        
                    }
                }
                
            }
            .listStyle(.automatic)
            .navigationTitle("Liste de cadeau")
        }
       
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(listPresent: arrayOfPresent)
    }
}
