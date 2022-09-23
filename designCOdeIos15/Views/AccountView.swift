//
//  AccountView.swift
//  designCOdeIos15
//
//  Created by to on 2022/9/21.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    
    var body: some View {
        NavigationView{
            
            List {
                profile

                menu
                
                links
               
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
      
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThickMaterial))
                .background(
//                    HexagonVIew()
//                        .offset(x: -40, y:-80)
                    BlobView()
                        .offset(x: -120, y: -100)
                        .scaleEffect(0.6)
                )
                .background(
                    BlobView()
                        .offset(x: 120, y: 200)
                        .scaleEffect(0.6)
                )
            Text("Logy xiao")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                Text("Canada")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section{
            NavigationLink( destination: ContentView()) {
                Label("Setting", systemImage: "gear")
            }
            NavigationLink{ Text("Billing Page") } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink{ ContentView() } label: {
                Label("help", systemImage: "questionmark")
            }

      
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://apple.com")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true){
                    Button(action: { isDeleted=true} ) {
                      Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
            }
            }
            
            Link(destination: URL(string: "https://youtube.com")!) {
                HStack {
                    Label("Youtube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions{
                pinButton
            }
        }
        .accentColor(.primary)
    }
    
    var pinButton: some View {
        Button(action: {isPinned.toggle()}) {
            if isPinned {
                Label("Delete", systemImage: "pin.slash")
            } else {
                Label("Delete", systemImage: "pin")
            }
        }
        .tint(isPinned ? .blue : .gray)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
