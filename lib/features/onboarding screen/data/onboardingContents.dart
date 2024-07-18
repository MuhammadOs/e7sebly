class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "جميع معادلاتك الحسابية",
    image: "assets/img/icons/onboarding_1.png",
    desc: "كل العمليات الحسابيه بقت دلوقتي في مكان واحد وسهل الوصول ليها بدوسه واحده بس",
  ),
  OnboardingContents(
      title: "المعدل التراكمي ",
      image: "assets/img/icons/onboarding_2.png",
      desc: "تقدر تحسب معدلك التراكمي علي حسب جامعتك والمواد بتاعتك"
  ),
  OnboardingContents(
    title: "كتله الجسم وغيرها",
    image: "assets/img/icons/onboarding_3.png",
    desc: " دلوقتي تقدر تحسب كتله جسمك وهنقولك معلومات تفيدك صحياً",
  ),
  OnboardingContents(
    title: "التسبيح والاذكار ",
    image: "assets/img/icons/onboarding_4.png",
    desc: "الاذكار بعد الصلاه المفروضة والتسبيح",
  ),
];
