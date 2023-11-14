//
//  AccountView.swift
//  FocusEureka
//
//  Created by yuz_chen on 11/7/23.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @State var isShowPost: Bool = true;
    @State var isShowSchedule: Bool = false;
    
    @State var scheuleViewModel: ScheuleViewModel = ScheuleViewModel()
    
    var body: some View {
        if let currentUser = self.loginViewModel.currentUser {
            NavigationStack{
                ScrollView {
                    VStack() {
                        
                        Text("FocusEureka!!")
                            .font(.system(size: 20))
                            .padding(.top, 10)
                        
                        // user information
                        HStack() {
                            Text(currentUser.initials)
                            // Text("YC")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(.white))
                                .frame(width: 76, height: 76)
                                .background(Color(.systemGray))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(currentUser.fullName)
                                // Text("Yuzhuang Chen")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                
                                Text(currentUser.username)
                                // Text("yuzchen")
                                    .font(.system(size: 18))
                                    .foregroundStyle(Color(.systemGray))
                            }
                            
                            Spacer()
                            
                            NavigationLink(destination: {
                                ProfileView()
                            }, label: {
                                SettingRowView(image: "gear", title: "", tinColor: Color(.systemGray))
                            })
                            
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.bottom, 20)
                    }
                    
                    Section {
                        HStack {
                            Button(action: {
                                self.isShowSchedule = false
                                self.isShowPost = true
                                self.scheuleViewModel.getScheduleData(userId: currentUser.id)
                            }, label: {
                                ZStack {
                                    Text("Post")
                                    if (self.isShowPost) {
                                        Rectangle()
                                            .frame(height: 0.5)
                                            .offset(y: 20)
                                    }
                                }
                            })
                            .frame(width: 150)
                            
                            Button(action: {
                                self.isShowSchedule = true
                                self.isShowPost = false
                            }, label: {
                                ZStack {
                                    Text("Scheule")
                                    if (self.isShowSchedule) {
                                        Rectangle()
                                            .frame(height: 0.5)
                                            .offset(y: 20)
                                    }
                                }
                            })
                            .frame(width: 150)
                        }
                        .foregroundColor(Color(.black))
                    }
                    
                    // content view section
                    Section {
                        if (self.isShowSchedule) {
                            ScheuleView(scheuleViewModel: $scheuleViewModel)
                        }
                    }
                    .padding(.top)
                    .padding()
                    
                    
                } // VStack
            } // ScrollView
        } // NavigationStack
    } // if currentuser
}

#Preview {
    AccountView()
}
