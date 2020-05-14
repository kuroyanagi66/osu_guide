import UIKit
import SwiftUI
import Combine





class ImageLoader: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()

    var image: Image? {
        willSet {
            objectWillChange.send()
        }
    }

    func load(url: String) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: image)
            }
        }.resume()
    }
}


struct URLImage<Content>: View where Content: View {
    @ObservedObject var imageLoader = ImageLoader()

    private let url: String
    private let content: (_ image: Image) -> Content

    init(url: String, content: @escaping (_ image: Image) -> Content) {
        self.url = url
        self.content = content
    }

    var body: some View {
        ZStack {
            if imageLoader.image != nil {
                content(imageLoader.image!)
            } else {
                content(Image("placeholder"))
            }
        }.onAppear {
            self.imageLoader.load(url: self.url)
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://scontent-nrt1-1.cdninstagram.com/v/t51.2885-15/e35/82655181_465937467627577_1083422606103305720_n.jpg?_nc_ht=scontent-nrt1-1.cdninstagram.com&_nc_cat=101&_nc_ohc=jn3gsbTmwoQAX-UjcP6&oh=79fac2501ebd390570bf737bfc3b6582&oe=5EA4E9CC") {
            $0
        }
    }
}
