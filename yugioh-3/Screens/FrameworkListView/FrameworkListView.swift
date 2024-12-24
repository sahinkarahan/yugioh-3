//
//  FrameworkListView.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 13.12.2024.
//

import SwiftUI

struct FrameworkListView: View {
    
    @StateObject var viewModel = FrameworkListViewModel()

    var body: some View {
        ZStack{
            NavigationStack{
                ScrollView {
                    LazyVGrid(columns: viewModel.columns, spacing: 20) {
                        ForEach(viewModel.frameworks) { framework in
                            FrameworkListCell(framework: framework)
                                //.listRowSeparator(.hidden)
                                .onTapGesture {
                                    viewModel.selectedFramework = framework
                                    viewModel.isShowingDetail = true
                                }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Yu-Gi-Oh Card List")
                .navigationBarTitleDisplayMode(.inline)
                .disabled(viewModel.isShowingDetail)
                
            }
            .task {
                 viewModel.getFrameworks()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                FrameworkDetailView(framework: viewModel.selectedFramework!,
                                     isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    FrameworkListView()
        
}
