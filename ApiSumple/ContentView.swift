//
//  ContentView.swift
//  ApiSumple
//
//  Created by 渡邊涼太 on 2024/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showGender:Gender_jadge?
    
    @State private var input_name: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("名前を入力", text: $input_name)
                
                Button{
                    Task{
                        if input_name != ""{
                            //URLをゲットする関数
                            do{
                                showGender = try await getData(name: input_name)
                            }catch{
                                print("error")
                            }
                        }
                    }
                }label:{
                    Text("性別判定")
                }
                
                HStack{
                    if showGender != nil{
                        Text(showGender!.name)
                        Text(showGender!.gender)
                        Text(String(showGender!.probability))
                    }
                }
                
//                .task {
//                    do{
//                        showjoke = try await getData()
//                    }catch{
//                        print("error_content")
//                    }
//                }
            }
        }
    }
}
//#Preview {
//    ContentView()
//}
