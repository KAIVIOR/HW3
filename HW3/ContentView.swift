//
//  ContentView.swift
//  hw3
//
//  Created by User01 on 2020/11/1.
//
func url(forResource name: String?,withExtension ext: String?)
{
    //-> URL?
}
import MapKit
import SwiftUI
import AVFoundation
func blendMode(_ blendMode: BlendMode)
{
    //-> some View{}
}
struct ContentView: View {
    let formatter = DateFormatter()
    @State private var birthday = Date()
    var roles = ["馬卡龍", "提拉米蘇", "檸檬塔", "藍莓優格塔","生巧克力塔","香草布丁" ]
    let authors = ["馬卡龍", "提拉米蘇", "檸檬塔", "藍莓優格塔","生巧克力塔","香草布丁","焦糖布朗尼","巴斯卡乳酪蛋糕"]
    @State private var selectedIndex = 0
    @State private var selectednumber = 0
    @State private var selectedBlend = 1
    @State private var showEditLover = false
    @State private var number = " "
    @State private var many=1
    @State private var baking_time = 0
    @Environment(\.presentationMode) var presentationMode
    @State var timeRemaining = 100
    @State private var bgColor = Color.white
    @State private var isPresented = false
    @State private var showAlert = false
    @State private var isPlay = false
    let player = AVPlayer(url: URL(string: "https://audio-ssl.itunes.apple.com/itunes-assets/Music1/v4/ab/3e/54/ab3e546a-ceb8-0d53-5169-9f1d6d55586c/mzaf_4788478901280424198.plus.aac.p.m4a")!)
    @State private var showingSheet = false
    @State private var timer:Timer?
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.902782, longitude: 12.496366), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    /*
    let timer=Timer.publish(every: 1, on: .main, in: .common).autoconnect()
 */
    var body: some View {
        TabView {
        GeometryReader { geometry in
        VStack (){
        Image("des")
        .resizable()
        .scaledToFill()
        .frame(width: geometry.size.width, height:
                geometry.size.width / 4 * 3.5)
        //.blendMode(.screen)
        .clipped()
          //  NavigationView {
          
        Form {
        VStack{
            
            Picker(selection: $selectedIndex, label: Text("選擇甜點")) {
                ForEach(roles.indices) { (index) in
                        Text(roles[index])
                     }
                
                
            }
            .pickerStyle(SegmentedPickerStyle())}
            Text("所選擇製作的甜點 \(roles[selectedIndex])")
            DisclosureGroup("甜點選項") {
                       VStack(alignment: .leading) {
                           ForEach(authors.indices) { (index) in
                               Text(authors[index])
                           }
                       }
                   }
            
                   .padding()
            HStack{
                
                Image("forest")
                                .resizable()
                                .scaledToFit()
                            Toggle("播放手心的薔薇", isOn: $isPlay)
                                .onChange(of: isPlay, perform: { value in
                                    if value {
                                        player.play()
                                    } else {
                                        player.pause()
                                    }
                                })
        }
            .padding()
            DatePicker("製作甜點時間", selection: $birthday, displayedComponents: .date)
            DatePicker("製作時間", selection: $birthday, displayedComponents: .hourAndMinute)
            Group{
            HStack {
                        ColorPicker("製作色塊", selection: $bgColor)
                    }
                    .background(bgColor)
            
                Button(action: {
                    self.showingSheet = true
                }) {
                    Text("顯現 Action Sheet")
                }
                .actionSheet(isPresented: $showingSheet) {
                    ActionSheet(title: Text("你想要做啥啊?"), message: Text("只有一個選項"), buttons: [.default(Text("無視 Action Sheet"))])
                }
                Text("隱藏按鈕")
                           .contextMenu {
                               Button(action: {
                                   // change country setting
                               }) {
                                   Text("Choose Country")
                                   Image(systemName: "globe")
                               }

                               Button(action: {
                                   // enable geolocation
                               }) {
                                   Text("Detect Location")
                                   Image(systemName: "location.circle")
                               }
                           }
                    }
            Button(action: {
                 showAlert = true
              }) {
                 HStack {
//                    Image("rabbit")
//                       .renderingMode(.original)
                    Text("你想做甜點嗎                                                                          ")
                 }
              }.alert(isPresented: $showAlert) { () -> Alert in
                 let answer = ["當然想啊", "應該不想吧"].randomElement()!
                 return Alert(title: Text(answer))
              }
            
            
            HStack{
            Image("oven")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height:60)
                //.blendMode(.screen5
                .clipped()
              //  TextField("時間", text: $number)
                Stepper("烘焙時間  \(many)分鐘", value: $many, in: 1...200)
                 }

            HStack{
               // let baking_time = many
               Text("確定時間                                                ")
                Button(action: {
                         print(many)
                      }) {
                         HStack {
                            Text("開始")
                         }
                         .foregroundColor(.white)
                         //.fontWeight(.bold)
                         .font(.title)
                         //.background(Color.blue)
                         .padding()
                         .background(Color.red)
                         .cornerRadius(40)
                         .foregroundColor(Color.white)
                         .padding(10)
                         .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.red,lineWidth: 5))
                    
                      }
            }

                 
        }
            
        }
            
        }
            
        }
        .sheet(isPresented: $showEditLover, content: {
            FoodEditor()


        })
          
            
    
           //     Map(coordinateRegion: $region)
                

                            
//            Color.yellow.tabItem {
//
//
//
//
//
//
//
//
//
//        }
        .tabViewStyle(PageTabViewStyle())
    }
}
    
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

