class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Discover Seizure Detection',
      image: 'assets/images/slider1.png',
      discription: "Seizure Detection help you tracking your child's condition but first need to do some steps"

  ),
  UnbordingContent(
      title: 'Enter Information',
      image: 'assets/images/slider2.png',
      discription: "you need to enter all the required information about you and your child"

  ),
  UnbordingContent(
      title: 'Make Report',
      image: 'assets/images/slider3.png',
      discription: "you can request a report that shows your child's previous seizures and you can share it with the Doctor too"

  ),
];