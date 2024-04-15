
import SwiftUI
import Design
import DefaultNetworkOperationPackage

public struct FeedView: View {
    
    @State private var addPost = false
    
    public var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 10) {
                    ForEach(Post.MOCK_POSTS) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 12)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 32)
                        
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        addPost.toggle()
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color.cyan)
                    }
                }
            }
            .background(.white) //here will be custom color
            .sheet(isPresented: $addPost) {
                
                AddPostView()
            }
        }
    }
}

#Preview {
    FeedView()
}
