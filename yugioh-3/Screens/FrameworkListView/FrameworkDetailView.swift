//
//  FrameworkDetailView.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 13.12.2024.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @EnvironmentObject var order: Order
    let framework: Framework
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    FrameworkRemoteImage(urlString: framework.cardImages?.first?.imageUrl ?? "")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 225)
                        .padding(30)
                    
                    VStack {
                        Text(framework.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.bottom, 20)

                        HStack(spacing: 35) {
                            FrameworkInfo(title: "Type", value: framework.type)
                                .frame(maxWidth: .infinity, alignment: .center)
                            FrameworkInfo(title: "Attribute", value: framework.attribute ?? "N/N")
                                .frame(maxWidth: .infinity, alignment: .center)
                            FrameworkInfo(title: "Typing", value: framework.race ?? "N/N")
                                .frame(maxWidth: .infinity, alignment: .center)
                        }

                        Spacer()
                            .frame(height: 20)

                        HStack(spacing: 35) {
                            FrameworkInfo(title: "Level/Rank", value: framework.level?.description ?? "N/N")
                                .frame(maxWidth: .infinity, alignment: .center)
                            FrameworkInfo(title: "ATK", value: framework.atk?.description ?? "N/N")
                                .frame(maxWidth: .infinity, alignment: .center)
                            FrameworkInfo(title: "DEF", value: framework.def?.description ?? "N/N")
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        
                        VStack {
                            Text("Description")
                                .bold()
                                .font(.title3)
                                .padding(.top , 20)
                            Text(framework.desc)
                                .multilineTextAlignment(.center)
                                .font(.body)
                                .padding()
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        order.add(framework)
                        isShowingDetail = false
                    } label: {
                        Text("$\(framework.cardPrices?.first?.cardmarketPrice ?? "0.00") - Add to Order")
                    }
                    //.standartButtonStyle()
                    .modifier(StandartButtonStyle())
                    .padding(.bottom, 30)
                }
                .frame(width: 350)
            }
            .frame(width: 350, height: 580)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button {
                isShowingDetail = false
            } label: {
                XDismissButton()
            }, alignment: .topTrailing)
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetail: .constant(true))
}

struct FrameworkInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text(value)
                .font(.caption2)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
