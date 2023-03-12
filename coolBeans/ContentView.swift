//
//  ContentView.swift
//  coolBeans
//
//  Created by Suyash Vashishtha on 02/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menu = Menu()
    @StateObject var history = History()
    @State private var showingAddScreen = false
    
    var totalCaffeine :Int{
        history.servings.map(\.caffeine).reduce(0,+)
    }
    
    var totalCalories :Int{
        history.servings.map(\.calories).reduce(0,+)
    }
    
    
    
    
    
    var body: some View {
        
        NavigationView{
            
            List{
                if history.servings.isEmpty{
                    Button("Add your first Drink !"){
                        showingAddScreen = true
                    }
                    .listRowBackground(Color.black.opacity(0))
                    .buttonStyle(.borderedProminent)
                    .tint(.brown)

                } else {
                    Section("Summary"){
                        HStack{
                            Image(systemName: "bolt.fill").foregroundColor(.green)
                            Text("**Caffeine:** \(totalCaffeine)mg")
                        }
                        
                        HStack{
                            Image(systemName:"flame.fill").foregroundColor(.yellow)
                            Text("**Calories:** \(totalCalories)mg")
                        }

                       
                        
                        
                    }
                    ForEach(history.servings){ serving in
                        HStack{
                            
                            Image(serving.image) .resizable()
                                .scaledToFit()
                                .frame(width: 50.0, height: 50.0)
                                .cornerRadius(10)
                                .padding(.trailing,10)
                            
                            
                            VStack(alignment: .leading){
                                
                                Text(serving.name)
                                    .font(.headline)
                                
                                Text(serving.description)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .padding(.trailing,10)

                                
                            }
                            Spacer()
                           
                        Text("\(serving.caffeine) mg")
                       
                        }
                        .swipeActions{
                            Button(role: .destructive)
                            {
                                withAnimation{history.delete(serving)}
                                
                            }label:{
                                    Label("Delete",systemImage: "trash")
                            }
                            
                            Button{
                                withAnimation{
                                    history.reorder(serving)
                                }
                            }label:{
                                Label("Repeat",systemImage: "repeat")
                            }.tint(.blue)
                        }
                        
                        
                }
                HStack{
                    Image(systemName:"plus").foregroundColor(.brown)
                    Button("Add More Drinks !"){
                        showingAddScreen = true
                    }
                    .foregroundColor(.brown)
                   
                }.padding(.top,20)
                   
            }
        }
        
        .sheet(isPresented:$showingAddScreen,content:MenuView.init)
        .navigationTitle("Cool Beans")
        .toolbar{
            Button{ showingAddScreen = true}
                label:{Label("Add New Drink",systemImage: "plus")}
                .tint(.brown)
            }
        }
            .environmentObject(menu)
            .environmentObject(history)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
