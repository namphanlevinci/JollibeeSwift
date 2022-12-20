//
//  ContentView.swift
//  JollibeeSwift
//
//  Created by Phan Nhat Nam on 18/12/2022.
//

import SwiftUI
import CoreData
import ACarousel

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    private var colorBg: Color = Color(hex: "#E31837")
    private static let screenHeight = UIScreen.main.bounds.height
    private static let screenWidth = UIScreen.main.bounds.width
    
    @State var isSheet:Bool = false
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    private let url:String = "https://demo.sirv.com/nuphar.jpg?w=5000"
    
    init(){
        for familyName in UIFont.familyNames{
            print(familyName)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
                Image("jollibee-background-new-home")
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading){
                    HeaderVIew(isSheet: $isSheet)
                    VStack{
//                        CarouselView()
                        AsyncImage(url: URL(string: url)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .scaledToFit()
                                        
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 350, height: 350)
                    }
                    .frame(width: ContentView.screenWidth, height: ContentView.screenHeight / 2 - 80)
                    VStack{
                        HStack{
                            MenuItemView(menuName: "KHUYẾN MÃI", menuIcon: "tab-new-promotion")
                            MenuItemView(menuName: "THỰC ĐƠN", menuIcon: "tab-new-menu")
                        }.frame(width: ContentView.screenWidth)
                        HStack{
                            MenuItemView(menuName: "ĐƠN HÀNG GẦN ĐÂY", menuIcon: "tab-new-order")
                            MenuItemView(menuName: "CỬA HÀNG", menuIcon: "tab-new-store")
                        }
                    }
                    Spacer()
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(colorBg)
            .ignoresSafeArea(.all)
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct MenuItemView: View{
    
    private let screenHeight = UIScreen.main.bounds.height
    private let screenWidth = UIScreen.main.bounds.width
    
    let menuName:String
    let menuIcon:String
    
    var body: some View{
        RoundedRectangle(cornerRadius: 16)
            .fill(Color(hex: "#D0343E"))
            .frame(
                width: screenWidth / 2 - 15,
                height: screenWidth - 270
            )
            .overlay(
                VStack{
                        Button(action:{}){
                            Image(menuIcon)
                        }
                        Text(menuName)
                            .font(Font.custom("SVN-Merge", size: 17))
                            .foregroundColor(Color.white)
                }
            )
            .shadow(radius: 4)
    }
}


struct HeaderVIew: View{
    @Binding var isSheet:Bool;
    var body: some View{
        HStack(alignment: .center){
            HStack(spacing: 8){
                Button(action: {
                }){
                    Circle()
                        .frame(width: 45, height: 45)
                        .overlay(
                            Image("ic-qr-logo")
                                .resizable()
                                .frame(width: 30, height: 30)
                            ,alignment: .center
                        )
                        .foregroundColor(Color.white)
                        .shadow(radius: 4)
                }
                Text("Khách hàng")
                    .foregroundColor(Color(hex: "#fff"))
                    .font(Font.custom("Roboto", size: 18))
                    .fontWeight(.bold)
                    .frame(height: 30, alignment: .leading)
            }
            
            Spacer()
            HStack(spacing: 14){
                Button(action: {
                    isSheet.toggle()
                }){
                    Image("ic_location")
                    .frame(width: 30,height: 30)
                }.sheet(isPresented: $isSheet) {
                    SheetLocation(isSheet: $isSheet)
                }
                Button(action: {
                }){
                    Image("nav-notify")
                    .frame(width: 30,height: 30)
                }
                Button(action: {
                }){
                    Image("nav-cart")
                    .frame(width: 30,height: 30)
                }
            }
        }
        .padding(EdgeInsets(top: 60, leading: 15, bottom: 30, trailing: 15))
    }
}

struct ItemCarousel: Identifiable {
    let id = UUID()
    let image: Image
}

let roles = ["jollibee-shop","jollibee-shop","jollibee-shop","jollibee-shop","jollibee-shop","jollibee-shop"]

struct CarouselView: View {

    let items: [ItemCarousel] = roles.map { ItemCarousel(image: Image($0)) }

    var body: some View {
        ACarousel(items) { item in
            item.image
                .resizable()
                .scaledToFill()
        }
        .frame(height: 350)
    }
}


struct SheetLocation: View{
    @Binding var isSheet:Bool
    var body: some View{
        Button(action: {
            isSheet.toggle()
        }){
            Text("DissMiss")
        }
    }
}
