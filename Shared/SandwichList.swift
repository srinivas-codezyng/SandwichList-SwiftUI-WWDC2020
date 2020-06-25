//
//  ContentView.swift
//  Shared
//
//  Created by Srinivas Prabhu G on 25/06/20.
//

import SwiftUI

struct SandwichList: View {
    @ObservedObject var store : SandwichStore
        
    var body: some View {
        NavigationView{
            List {
                ForEach(store.sandwiches)  { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                .onMove(perform:moveSandwiches)
                .onDelete(perform:deleteSandwiches)
                
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Sandwiches")
            .toolbar {
                #if os(iOS)
                EditButton()
                #endif
                Button("Add",action:makeSandwich)
            }
            
            
            Text("Select a Sandwich")
                        .font(.largeTitle)
        }
    }
    
    func makeSandwich(){
        withAnimation {
            store.sandwiches.append(Sandwich(name: "Baked Bread",imagename:"bakedbread" , ingredientCount: 4, isSpicy: true))
        }
    }
    
    func moveSandwiches(from:IndexSet, to:Int){
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteSandwiches(offsets:IndexSet){
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SandwichList(store:  testStore)
            SandwichList(store:  testStore)
                .preferredColorScheme(.dark)
            SandwichList(store:  testStore)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
    }
}


struct SandwichCell: View {
    
    let sandwich:Sandwich
    
    var body: some View {
        NavigationLink(destination:SandwichDetail(sandwich: sandwich)){
            HStack{
                Image(sandwich.thumbnailName)
                    .cornerRadius(20.0)
                VStack(alignment: .leading) {
                    Text(sandwich.name)
                    Text("\(sandwich.ingredientCount) Ingredients")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(10)
        }
    }
}
