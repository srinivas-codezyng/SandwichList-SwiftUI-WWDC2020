//
//  SandwichDetail.swift
//  sandwiches
//
//  Created by Srinivas Prabhu G on 25/06/20.
//

import SwiftUI

struct SandwichDetail: View {
    let sandwich:Sandwich
    @State private var zoomed:Bool = false
    
    var body: some View {
        VStack{
            Spacer(minLength:0)
            Image(sandwich.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill:.fit)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            Spacer(minLength:0)
            if sandwich.isSpicy && !zoomed  {
                HStack{
                    Spacer()
                    Label("spicy", systemImage: "flame.fill")
                    Spacer()
                }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .font(Font.headline.smallCaps())
                    .background(Color.red)
                .foregroundColor(.yellow)
                .transition(.move(edge: .bottom))
            }
           
        }
        .navigationTitle(sandwich.name)
        .edgesIgnoringSafeArea(.bottom)
            
    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView{
                SandwichDetail(sandwich: testData[0])
            }
        }
    }
}
