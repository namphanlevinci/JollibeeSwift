//
//  DetailView.swift
//  JollibeeSwift
//
//  Created by Phan Nhat Nam on 18/12/2022.
//

import SwiftUI

struct DetailView: View {
    var itemDetail:String? = "have no content detail"
    var body: some View {
        VStack{
//            Text("title")
//            Text("Your organization, \(itemDetail!)")
            Image("rin")
                .resizable(resizingMode: .stretch)
                .renderingMode(.some(.original))
                .frame(width:300, height: 300)
                .cornerRadius(20)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(UIColor.green))
        .edgesIgnoringSafeArea(.all)
        .padding(EdgeInsets.init(top: 20, leading: 15, bottom: 0, trailing: 0))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
