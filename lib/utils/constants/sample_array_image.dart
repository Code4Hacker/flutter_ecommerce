class ImageArray {
  static final List<ImageModal> list = [
    ImageModal(path: "assets/watch1.png", description: "The upgraded S6 SiP runs up to 20 percent faster, allowing apps to also launch 20 percent faster, while maintaining the same all-day 18-hour battery life.", category: 'watch', location: 'dodoma', price: '50000', isProduct: 'true', title: 'Redmi Note 4', discount: '1000', type: 'shop'),
    ImageModal(path: "assets/one.jpg", description: "free breakfast and fast wifi (5G), sleep with to beds with nice customer services.", category: 'hotel', location: 'morogoro', price: '50000', isProduct: 'false', title: 'Morena Hotel', discount: '45000', type: 'hotel'),
    ImageModal(path: "assets/watch2.png", description: "The upgraded S6 SiP runs up to 20 percent faster, allowing apps to also launch 20 percent faster, while maintaining the same all-day 18-hour battery life.", category: 'watch', location: 'dodoma', price: '655000', isProduct: 'true', title: 'Apple Watch - series 6', discount: '2000', type: 'shop'),
    ImageModal(path: "assets/two.jpg", description: "The upgraded S6 SiP runs up to 20 percent faster, allowing apps to also launch 20 percent faster, while maintaining the same all-day 18-hour battery life.", category: 'watch', location: 'arusha', price: '50000', isProduct: 'true', title: 'Redmi Note 4', discount: '1000', type: 'shop'),
  ];
}

class ImageModal {
  ImageModal({required this.path,required this.title, required this.description, required this.category, required this.location, required this.isProduct, required this.price, required this.discount, required this.type});
  final String path, title, description, category, location, isProduct, price, discount, type;
}
