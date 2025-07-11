class CriteriaModel {
  final String title;
  final List<String> points;

  CriteriaModel({required this.title, required this.points});
}

final List<CriteriaModel> dummyCriteriaListArabic = [
  CriteriaModel(
    title: "1. الإنجازات الرياضية:",
    points: [
      "الأداء المتميز في البطولات الكبرى (الأولمبياد، بطولات العالم، البطولات القارية).",
      "تحقيق أرقام قياسية عالمية أو قارية أو وطنية.",
      "الاستمرارية في تحقيق النتائج الإيجابية على مدار العام.",
    ],
  ),
  CriteriaModel(
    title: "2. الروح الرياضية والأخلاق:",
    points: [
      "الالتزام بقواعد اللعب النظيف والمنافسة الشريفة.",
      "احترام المنافسين والحكام والجماهير.",
      "أن يكون قدوة حسنة للشباب والرياضيين الآخرين.",
    ],
  ),
  CriteriaModel(
    title: "3. التأثير والإلهام:",
    points: [
      "مدى تأثير الرياضي في مجتمعه ورياضته.",
      "تشجيع ودعم الآخرين لتحقيق طموحاتهم.",
      "المبادرات المجتمعية والخيرية (إن وجدت).",
    ],
  ),
  CriteriaModel(
    title: "4. معايير خاصة بالمدربين:",
    points: [
      "القدرة على تطوير أداء اللاعبين والفرق.",
      "الابتكار في الخطط التدريبية والتكتيك.",
      "نقل المعرفة والمعلومات لمن يقوم بتدريبهم.",
    ],
  ),
  CriteriaModel(
    title: "5. معايير خاصة بالفرق:",
    points: [
      "الأداء الجماعي المتميز والعمل بروح الفريق.",
      "تحقيق نتائج جماعية بارزة.",
    ],
  ),
];

final List<CriteriaModel> dummyCriteriaListEnglish = [
  CriteriaModel(
    title: "1. Athletic Achievements:",
    points: [
      "Outstanding performance in major championships (Olympics, World Championships, Continental tournaments).",
      "Breaking world, continental, or national records.",
      "Consistency in achieving positive results throughout the year.",
    ],
  ),
  CriteriaModel(
    title: "2. Sportsmanship and Ethics:",
    points: [
      "Commitment to fair play and honest competition.",
      "Respect for opponents, referees, and spectators.",
      "Being a good role model for youth and other athletes.",
    ],
  ),
  CriteriaModel(
    title: "3. Impact and Inspiration:",
    points: [
      "The athlete's influence on their community and sport.",
      "Encouraging and supporting others in reaching their goals.",
      "Community and charitable initiatives (if any).",
    ],
  ),
  CriteriaModel(
    title: "4. Criteria for Coaches:",
    points: [
      "Ability to improve players' and teams' performance.",
      "Innovation in training plans and tactics.",
      "Transferring knowledge and experience to those they train.",
    ],
  ),
  CriteriaModel(
    title: "5. Criteria for Teams:",
    points: [
      "Outstanding team performance and teamwork spirit.",
      "Achieving remarkable collective results.",
    ],
  ),
];
