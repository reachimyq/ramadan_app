import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  final now = new DateTime.now();
  String formatter = "";
  String currentDay = "";
  String printedDay = "";
  int fastDay = 0;

  String itracker =
      "Today the imam will be reading Surah Baqarah verse 1 onwards\n\nIt is permissible to hold a mushaf during the prayer if you wish";

  String taraweehTime = "21:30";
  String qiyaamTime = "-";

  double fundraisingTotal = 0;
  double activeFundraisingTotal = 0;

  Uri _url = Uri.parse('https://flutter.dev');

  String collectionLink = "https://norburymuslimcentre.com/donate";
  String collectionVid = "https://youtu.be/_-VqoT0nq4k";
  String zakatLink =
      "https://lmsn.notion.site/London-Muslim-Support-Network-1e1e5de6382a4f30a6b61fc4fd55adc0";

  List<List<String>> ptimes = [
    [
      // Wed 22 Mar
      "04:06",
      "12:12",
      "15:28",
      "18:19",
      "19:58",
      "05:15",
      "12:30",
      "16:15",
      "18:24",
      "21:00"
    ],
    [
      // Thu 23 Mar
      "04:03",
      "12:11",
      "15:29",
      "18:21",
      "19:59",
      "04:30",
      "12:30",
      "16:15",
      "18:31",
      "21:00"
    ],
    [
      // Fri 24 Mar
      "04:01",
      "12:11",
      "15:30",
      "18:23",
      "20:00",
      "04:30",
      "Jumah",
      "16:15",
      "18:33",
      "21:00"
    ],
    [
      // Sat 25 Mar
      "03:58",
      "12:11",
      "15:31",
      "18:25",
      "20:01",
      "04:30",
      "12:30",
      "16:15",
      "18:35",
      "21:00"
    ],
    [
      // Sun 26 Mar
      "04:55",
      "13:10",
      "16:32",
      "19:26",
      "21:02",
      "05:30",
      "13:30",
      "18:00",
      "19:36",
      "21:30"
    ],
    [
      // Mon 27 Mar
      "04:53",
      "13:10",
      "16:33",
      "19:28",
      "21:03",
      "05:30",
      "13:30",
      "18:00",
      "19:38",
      "21:30"
    ],
    [
      // Tue 28 Mar
      "04:50",
      "13:10",
      "16:34",
      "19:30",
      "21:04",
      "05:30",
      "13:30",
      "18:00",
      "19:40",
      "21:30"
    ],
    [
      // Wed 29 Mar
      "04:47",
      "13:09",
      "16:35",
      "19:31",
      "21:05",
      "05:20",
      "13:30",
      "18:00",
      "19:41",
      "21:30"
    ],
    [
      // Thu 30 Mar
      "04:45",
      "13:09",
      "16:36",
      "19:33",
      "21:06",
      "05:20",
      "13:30",
      "18:00",
      "19:43",
      "21:30"
    ],
    [
      // Fri 31 Mar
      "04:42",
      "13:09",
      "16:37",
      "19:35",
      "21:08",
      "05:20",
      "Jumah",
      "18:00",
      "19:45",
      "21:30"
    ],
    [
      // Sat 1 Apr
      "04:39",
      "13:09",
      "16:38",
      "19:38",
      "21:09",
      "05:10",
      "13:30",
      "18:00",
      "19:48",
      "21:30"
    ],
    [
      // Sun 2 Apr
      "04:36",
      "13:08",
      "16:39",
      "19:39",
      "21:10",
      "05:10",
      "13:30",
      "18:00",
      "19:49",
      "21:30"
    ],
    [
      // Mon 3 Apr
      "04:33",
      "13:08",
      "16:39",
      "19:40",
      "21:11",
      "05:10",
      "13:30",
      "18:00",
      "19:50",
      "21:30"
    ],
    [
      // Tue 4 Apr
      "04:31",
      "13:08",
      "16:40",
      "19:41",
      "21:12",
      "05:10",
      "13:30",
      "18:00",
      "19:51",
      "21:30"
    ],
    [
      // Wed 5 Apr
      "04:28",
      "13:07",
      "16:41",
      "19:43",
      "21:13",
      "05:10",
      "13:30",
      "18:00",
      "19:53",
      "21:30"
    ],
    [
      // Thu 6 Apr
      "04:25",
      "13:07",
      "16:42",
      "19:45",
      "21:15",
      "05:00",
      "13:30",
      "18:00",
      "19:55",
      "21:30"
    ],
    [
      // Fri 7 Apr
      "04:22",
      "13:07",
      "16:43",
      "19:46",
      "21:16",
      "05:00",
      "Jumah",
      "18:00",
      "19:56",
      "21:30"
    ],
    [
      // Sat 8 Apr
      "04:19",
      "13:07",
      "16:44",
      "19:48",
      "21:17",
      "05:00",
      "13:30",
      "18:00",
      "19:58",
      "21:30"
    ],
    [
      // Sun 9 Apr
      "04:16",
      "13:06",
      "16:44",
      "19:50",
      "21:18",
      "05:00",
      "13:30",
      "18:00",
      "20:00",
      "21:30"
    ],
    [
      // Mon 10 Apr
      "04:13",
      "13:06",
      "16:45",
      "19:51",
      "21:19",
      "05:00",
      "13:30",
      "18:00",
      "20:01",
      "21:30"
    ],
    [
      // Tue 11 Apr
      "04:10",
      "13:06",
      "16:46",
      "19:53",
      "21:20",
      "04:50",
      "13:30",
      "18:00",
      "20:03",
      "21:45"
    ],
    [
      // Wed 12 Apr
      "04:07",
      "13:05",
      "16:47",
      "19:55",
      "21:22",
      "04:50",
      "13:30",
      "18:00",
      "20:05",
      "21:45"
    ],
    [
      // Thu 13 Apr
      "04:04",
      "13:05",
      "16:48",
      "19:57",
      "21:23",
      "04:50",
      "13:30",
      "18:00",
      "20:07",
      "21:45"
    ],
    [
      // Fri 14 Apr
      "04:01",
      "13:05",
      "16:48",
      "19:58",
      "21:24",
      "04:50",
      "Jumah",
      "18:00",
      "20:08",
      "21:45"
    ],
    [
      // Sat 15 Apr
      "03:58",
      "13:05",
      "16:49",
      "20:00",
      "21:25",
      "04:40",
      "13:30",
      "18:00",
      "20:10",
      "21:45"
    ],
    [
      // Sun 16 Apr
      "03:55",
      "13:04",
      "16:50",
      "20:01",
      "21:26",
      "04:40",
      "13:30",
      "18:00",
      "20:11",
      "21:45"
    ],
    [
      // Mon 17 Apr
      "03:52",
      "13:04",
      "16:51",
      "20:03",
      "21:27",
      "04:40",
      "13:30",
      "18:00",
      "20:13",
      "21:45"
    ],
    [
      // Tue 18 Apr
      "03:49",
      "13:04",
      "16:51",
      "20:05",
      "21:28",
      "04:40",
      "13:30",
      "18:00",
      "20:15",
      "21:45"
    ],
    [
      // Wed 19 Apr
      "03:46",
      "13:04",
      "16:52",
      "20:06",
      "21:29",
      "04:40",
      "13:30",
      "18:00",
      "20:16",
      "21:45"
    ],
    [
      // Thu 20 Apr
      "03:42",
      "13:04",
      "16:53",
      "20:08",
      "21:30",
      "04:40",
      "13:30",
      "18:00",
      "20:18",
      "21:45"
    ],
    [
      // Fri 21 Apr
      "03:39",
      "13:03",
      "16:54",
      "20:10",
      "21:31",
      "04:40",
      "Jumah",
      "18:00",
      "20:20",
      "21:45"
    ],
  ];

  List<List<String>> reminders = [
    [
      "يَٓأَيُّهَا ٱلَّذِينَ ءَامَنُوا۟ كُتِبَ عَلَيْكُمُ ٱلصِّيَامُ كَمَا كُتِبَ عَلَى ٱلَّذِينَ مِن قَبْلِكُمْ لَعَلَّكُمْ تَتَّقُونَ",
      "O you who believe, fasting has been prescribed upon you as it was prescribed upon those before you so that you may attain God consciousness",
      "Abu Hurairah said that Prophet Muhammad (ﷺ) said:\n\n'There has come to you Ramadan, a blessed month, which Allah, the Mighty and Sublime, has enjoined you to fast. In it the gates of heavens are opened and the gates of Hell are closed, and every devil is chained up'.",
      "رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِنْ ذُرِّيَّتِي رَبَّنَا وَتَقَبَّلْ دُعَاءِ . رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ",
      "My Lord! Make me steadfast in the Prayer, and also my children, our Lord. And do accept my supplication. Our Lord! Forgive me and my parents — and all the believers — on the day the reckoning arises",
      'https://www.youtube.com/watch?v=oBI24qlEvn8'
    ], // 1
    [
      "اِنَّآ اَنْزَلْنَا عَلَيْكَ الْكِتٰبَ لِلنَّاسِ بِالْحَقِّۚ فَمَنِ اهْتَدٰى فَلِنَفْسِهٖۚ وَمَنْ ضَلَّ فَاِنَّمَا يَضِلُّ عَلَيْهَا ۚوَمَآ اَنْتَ عَلَيْهِمْ بِوَكِيْل",
      "We have sent the Scripture down to you with the Truth for people. Whoever follows the guidance does so for his own soul's benefit",
      "Anas narrated that the Prophet (ﷺ) was asked which fast was most virtuous after Ramadan? He said: 'Sha'ban in honor of Ramadan', He said: 'Which charity is best?' He (pbuh) said: 'Charity in Ramadan'.",
      "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ",
      "Our Lord! Give us good in the world and good in the Hereafter, and save us from the torment of the Fire of Hell",
      "https://youtu.be/kIrzgRaIhak"
    ], // 2
    [
      "ذٰلِكَ الْكِتٰبُ لَا رَيْبَ ۛ فِيْهِ ۛ هُدًى لِّلْمُتَّقِيْنَۙ",
      "“This is the Scripture in which there is no doubt, containing guidance for those who are mindful of God”.",
      "Narrated Abu Huraira, I heard Allah's Messenger (ﷺ) saying regarding Ramadan,\n\n'Whoever prayed at night in it (the month of Ramadan) out of sincere Faith and hoping for a reward from Allah, then all his previous sins will be forgiven'.",
      "رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِنْ ذُرِّيَّتِي رَبَّنَا وَتَقَبَّلْ دُعَاءِ . رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ",
      "My Lord! Make me steadfast in the Prayer, and also my children, our Lord. And do accept my supplication. Our Lord! Forgive me and my parents — and all the believers — on the day the reckoning arises",
      "https://youtu.be/ISvspkpQQoU"
    ], // 3
    [
      "الَّذِيْنَ يَذْكُرُوْنَ اللّٰهَ قِيَامًا وَّقُعُوْدًا وَّعَلٰى جُنُوْبِهِمْ وَيَتَفَكَّرُوْنَ فِيْ خَلْقِ السَّمٰوٰتِ وَالْاَرْضِۚ رَبَّنَا مَا خَلَقْتَ هٰذَا بَاطِلًاۚ سُبْحٰنَكَ فَقِنَا عَذَابَ النَّارِ",
      "who remember God standing, sitting, and lying down, who reflect on the creation of the heavens and earth: ‘Our Lord! You have not created all this without purpose- You are far above that!- so protect us from the torment of the Fire.",
      "Abu Huraira reported, Verily the Messenger of Allah (ﷺ) said\n\n'The five (daily) prayers and from one Friday prayer to the (next) Friday prayer, and from Ramadan to Ramadan are expiations for the (sins) committed in between (their intervals) provided one shuns the major sins'.",
      "رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ وَاجْعَلْنَا لِلْمُتَّقِينَ إِمَامًا",
      "Our Lord! Grant us in our spouses and our children the joy of our eyes. Moreover, make us an exemplar of goodness for the God-fearing",
      "https://youtu.be/7y6NmSKKfIk"
    ], // 4
    [
      "قُلْ يٰعِبَادِيَ الَّذِيْنَ اَسْرَفُوْا عَلٰٓى اَنْفُسِهِمْ لَا تَقْنَطُوْا مِنْ رَّحْمَةِ اللّٰهِ ۗاِنَّ اللّٰهَ يَغْفِرُ الذُّنُوْبَ جَمِيْعًا ۗاِنَّهٗ هُوَ الْغَفُوْرُ الرَّحِيْمُ",
      "Say, ‘[God says], My servants who have harmed yourselves by your own excess, do not despair of God’s mercy. God forgives all sins: He is truly the Most Forgiving, the Most Merciful.",
      "Narrated Ibn `Abbas, The Prophet (ﷺ) was the most generous of all the people, and he used to become more generous in Ramadan when Gabriel met him. Gabriel used to meet him every night during Ramadan to revise the Qur'an with him. Allah's Messenger (ﷺ) then used to be more generous than the fast wind.",
      "بِكَ مِنَ النَّارِ وَمَا قَرَّبَ إِلَيْهَا مِنْ قَوْلٍ أَوْ عَمَلٍ ، وَأَسْأَلُكَ أَنْ تَجْعَلَ كُلَّ قَضَاءٍ قَضَيْتَهُ لِي خَيْرًااللَّهُمَّ إِنِّي أَسْأَلُكَ مِنَ الْخَيْرِ كُلِّهِ عَاجِلِهِ وَآجِلِهِ ، مَا عَلِمْتُ مِنْهُ وَمَا لَمْ أَعْلَمْ ، وَأَعُوذُ بِكَ مِنَ الشَّرِّ كُلِّهِ عَاجِلِهِ وَآجِلِهِ ، مَا عَلِمْتُ مِنْهُ وَمَا لَمْ أَعْلَمْ ، اللَّهُمَّ إِنِّي أَسْأَلُكَ مِنْ خَيْرِ مَا سَأَلَكَ عَبْدُكَ وَنَبِيُّكَ ، وَأَعُوذُ بِكَ مِنْ شَرِّ مَا عَاذَ منه عَبْدُكَ وَنَبِيُّكَ ، اللَّهُمَّ إِنِّي أَسْأَلُكَ الْجَنَّةَ وَمَا قَرَّبَ إِلَيْهَا مِنْ قَوْلٍ أَوْ عَمَلٍ ، وَأَعُوذُ ",
      "O Allah! Indeed, I ask You for every good, all of it, hastened in this world and kept for the Hereafter, whatever I know of it and whatever I do not know. And I seek refuge in You from evil, all of it, hastened in this world and kept for the Hereafter — whatever I know of it and whatever I do not know. O Allah! Indeed, I ask You for the best of what Your Servant and Your Prophet have asked You. And I seek refuge in You from whatever evil Your Servant and Your Prophet have sought refuge from in You. O Allah! Indeed, I ask of You the Garden, and for all the words and deeds that draw one near it. And I seek refuge in You from the Fire, and for all the words and deeds that draw one near it. And I ask that You make every decree that You have decreed for me good.",
      "https://youtu.be/mdO-w7pbLaQ"
    ], // 5
    [
      "اُدْعُ اِلٰى سَبِيْلِ رَبِّكَ بِالْحِكْمَةِ وَالْمَوْعِظَةِ الْحَسَنَةِ وَجَادِلْهُمْ بِالَّتِيْ هِيَ اَحْسَنُۗ اِنَّ رَبَّكَ هُوَ اَعْلَمُ بِمَنْ ضَلَّ عَنْ سَبِيْلِهٖ وَهُوَ اَعْلَمُ بِالْمُهْتَدِيْنَ",
      "[Prophet], call [people] to the way of your Lord with wisdom and good teaching. Argue with them in the most courteous way, for your Lord knows best who has strayed from His way and who is rightly guided.",
      "It was narrated that Ibn 'Umar said, The Messenger of Allah (ﷺ) enjoined the Zakat of Ramadan on everyone, young and old, free and slave, male and female, a Sa of dates or a Sa of barley.",
      "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ ، اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِي دِينِي وَدُنْيَايَ وَأَهْلِي وَمَالِي ، اللَّهُمَّ اسْتُرْ عَوْرَاتِي وَآمِنْ رَوْعَاتِي ، اللَّهُمَّ احْفَظْنِي مِنْ بَيْنِ يَدَيَّ ، وَمِنْ خَلْفِي، وَعَنْ يَمِينِي ، وَعَنْ شِمَالِي ، وَمِنْ فَوْقِي، وَأَعُوذُ بِعَظَمَتِكَ أَنْ أُغْتَالَ مِنْ تَحْتِي",
      "O Allah! Indeed, I ask of You pardon in this world and the Hereafter. O Allah! Indeed, I ask of You pardon and well-being in my religion and my worldly affairs, and my family and my wealth. O Allah! Cover over my vulnerabilities and secure my anxieties. O Allah! Shield me from before me and from behind me, and from my right and from my left, and from above me. And I seek refuge in Your magnificence so that I am not undone from beneath me.",
      "https://youtu.be/mlRbXKhxYFc"
    ], // 6
    [
      "وَاِذْ تَاَذَّنَ رَبُّكُمْ لَىِٕنْ شَكَرْتُمْ لَاَزِيْدَنَّكُمْ وَلَىِٕنْ كَفَرْتُمْ اِنَّ عَذَابِيْ لَشَدِيْدٌ",
      "Remember that He promised, “If you are thankful, I will give you more, but if you are thankless, My punishment is terrible indeed.” ’",
      "Ibn 'Abbas told us, The Messenger of Allah (ﷺ) said to a woman from among the Ansar\n\n'When it is Ramadan, perform 'Umrah then, for 'Umrah during it is equivalent to Hajj'.",
      "رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ",
      "Our Lord, Forgive me, and my parents, and the believers on the Day of Accounting",
      "https://youtu.be/uK1pX6wlUhA"
    ], // 7
    [
      "وَاِذَا سَاَلَكَ عِبَادِيْ عَنِّيْ فَاِنِّيْ قَرِيْبٌ ۗ اُجِيْبُ دَعْوَةَ الدَّاعِ اِذَا دَعَانِۙ فَلْيَسْتَجِيْبُوْا لِيْ وَلْيُؤْمِنُوْا بِيْ لَعَلَّهُمْ يَرْشُدُوْ",
      "[Prophet], if My servants ask you about Me, I am near. I respond to those who call Me, so let them respond to Me, and believe in Me, so that they may be guided.",
      "'Amr bin Al-'As reported, the Messenger of Allah (ﷺ) said\n\n'The difference between our observance of Sawm (fasting) and that of the people of the Scriptures is Suhur (predawn meal in Ramadan)'.",
      "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْجُبْنِ، وَأَعُوذُ بِكَ أَنْ أُرَدَّ إِلَى أَرْذَلِ الْعُمُرِ، وَأَعُوذُ بِكَ مِنْ فِتْنَةِ الدُّنْيَا، وَأَعُوذُ بِكَ مِنْ عَذَابِ الْقَبْرِ",
      "O Allah! I seek refuge in You from cowardice. O Allah, I seek refuge in You from being brought back to a bad stage of the age, I seek refuge in You from trials of this world and from the torment of the grave.",
      "https://youtu.be/uDiVuVpjgtA"
    ], // 8
    [
      "وَلَمَنْ صَبَرَ وَغَفَرَ اِنَّ ذٰلِكَ لَمِنْ عَزْمِ الْاُمُوْرِ",
      "though if a person is patient and forgives, this is one of the greatest things",
      "Sahl reported God’s messenger (ﷺ) as saying\n\n'The people will continue to prosper as long as they hasten the breaking of the fast'.",
      "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ عَذَابِ جَهَنَّمَ وَمِنْ عَذَابِ الْقَبْرِ وَمِنْ فِتْنَةِ الْمَحْيَا وَالْمَمَاتِ وَمِنْ شَرِّ فِتْنَةِ الْمَسِيحِ الدَّجَّالِ",
      "O Allah! I seek refuge in you from the torment of hell, from the torment of the grave, from the trial of life and death and from the evil of the trial of Masih al-Dajjal.",
      "https://youtu.be/TVt-Dd31Nn4"
    ], // 9
    [
      "وَلَقَدْ نَصَرَكُمُ اللّٰهُ بِبَدْرٍ وَّاَنْتُمْ اَذِلَّةٌ ۚ فَاتَّقُوا اللّٰهَ لَعَلَّكُمْ تَشْكُرُوْنَ",
      "God helped you at Badr when you were very weak. Be mindful of God, so that you may be grateful.",
      "It was narrated from Abu Salamah bin Abdur-Rahman that he asked Aishah, the Mother of the Believers, about how the Messenger of Allah (ﷺ) used to pray in Ramadan. She said: The Messenger of Allah (ﷺ) did not pray more than eleven rak'ahs during Ramadan or at any other time. He would pray four, and do not ask how beautiful or how long they were. Then he would pray four, and do not ask how beautiful or how long they were. Then he would pray three. Aishah said: I said: 'O Messenger of Allah (ﷺ), do you sleep before you pray witr?' He said: 'O Aishah, my eyes sleep but my heart does not'.",
      "رَبِّ تَقَبَّلْ تَوْبَتِي وَاغْسِلْ حَوْبَتِي وَأَجِبْ دَعْوَتِي وَثَبِّتْ حُجَّتِي وَاهْدِ قَلْبِي وَسَدِّدْ لِسَانِي وَاسْلُلْ سَخِيمَةَ قَلْبِي",
      "My Lord, accept my repentance, wash away my sin, answer my supplication, clearly establish my evidence, guide my heart, make true my tongue and draw out malice in my breast",
      "https://youtu.be/0gXJEM3VwuY"
    ], // 10
    [
      "فَاِنَّ مَعَ الْعُسْرِ يُسْرًاۙ",
      "So truly where there is hardship there is also ease;",
      "Abu Hurairah narrated that the Messenger of Allah (ﷺ) said\n\n'May the man before whom I am mentioned - and he does not send Salat upon me - be humiliated. And may a man upon whom Ramadan enters and then passes, before he is forgiven, be humiliated. And may a man whose parents reached old age in his presence, and they were not a cause for his entrance to Paradise, be humiliated'.\n\n(Hasan)",
      "الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنِي هَذَا الطَّعَامَ وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ",
      "All praise is due to Allah who has given me food to eat and provided it without any endeavour on my part or any power",
      "https://youtu.be/ujUmcu_Uzv0"
    ], // 11
    [
      "فَاسْتَقِمْ كَمَآ اُمِرْتَ وَمَنْ تَابَ مَعَكَ وَلَا تَطْغَوْاۗ اِنَّهٗ بِمَا تَعْمَلُوْنَ بَصِيْرٌ ",
      "So keep to the right course as you have been commanded, together with those who have turned to God with you. Do not overstep the limits, for He sees everything you do.",
      "Abu Hurairah reported that the Messenger of Allah (ﷺ) said\n\n'Every joint of a person must perform a charity each day that the sun rises: to judge justly between two people is a charity. To help a man with his mount, lifting him onto it or hoisting up his belongings onto it, is a charity. And the good word is a charity. And every step that you take towards the prayer is a charity, and removing a harmful object from the road is a charity'.",
      "اللَّهُمَّ اهْدِنِي لِأَحْسَنِ الْأَعْمَالِ وَأَحْسَنِ الْأَخْلَاقِ لَا يَهْدِي لِأَحْسَنِهَا إِلَّا أَنْتَ وَقِنِي سَيِّئَ الْأَعْمَالِ وَسَيِّئَ الْأَخْلَاقِ لَا يَقِي سَيِّئَهَا إِلَّا أَنْتَ",
      "O Allah, guide me to the best of deeds and the best of manners, for none can guide to the best of them but You. And protect me from bad deeds and bad manners, for none can protect against them but You.",
      "https://youtu.be/jJNL-YKicf4"
    ], // 12
    [
      "اِنَّ رَبَّكَ يَعْلَمُ اَنَّكَ تَقُوْمُ اَدْنٰى مِنْ ثُلُثَيِ الَّيْلِ وَنِصْفَهٗ وَثُلُثَهٗ وَطَاۤىِٕفَةٌ مِّنَ الَّذِيْنَ مَعَكَۗ وَاللّٰهُ يُقَدِّرُ الَّيْلَ وَالنَّهَارَۗ عَلِمَ اَنْ لَّنْ تُحْصُوْهُ فَتَابَ عَلَيْكُمْ فَاقْرَءُوْا مَا تَيَسَّرَ مِنَ الْقُرْاٰنِۗ عَلِمَ اَنْ سَيَكُوْنُ مِنْكُمْ مَّرْضٰىۙ وَاٰخَرُوْنَ يَضْرِبُوْنَ فِى الْاَرْضِ يَبْتَغُوْنَ مِنْ فَضْلِ اللّٰهِ ۙوَاٰخَرُوْنَ يُقَاتِلُوْنَ فِيْ سَبِيْلِ اللّٰهِ ۖفَاقْرَءُوْا مَا تَيَسَّرَ مِنْهُۙ وَاَقِيْمُوا الصَّلٰوةَ وَاٰتُوا الزَّكٰوةَ وَاَقْرِضُوا اللّٰهَ قَرْضًا حَسَنًاۗ وَمَا تُقَدِّمُوْا لِاَنْفُسِكُمْ مِّنْ خَيْرٍ تَجِدُوْهُ عِنْدَ اللّٰهِ ۙهُوَ خَيْرًا وَّاَعْظَمَ اَجْرًاۗ وَاسْتَغْفِرُوا اللّٰهَ ۗاِنَّ اللّٰهَ غَفُوْرٌ رَّحِيْمٌ",
      "[Prophet], your Lord is well aware that you sometimes spend nearly two-thirds of the night at prayer––sometimes half, sometimes a third––as do some of your followers. God determines the division of night and day. He knows that you will not be able to keep a measure of it and He has relented towards all of you, so recite as much of the Quran as is easy for you. He knows that some of you will be sick, some of you travelling through the land seeking God’s bounty, some of you fighting in God’s way: recite as much as is easy for you, keep up the prayer, pay the prescribed alms, and make God a good loan. Whatever good you store up for yourselves will be improved and increased for you. Ask God for His forgiveness, He is most forgiving, most merciful.",
      "On the authority of Abu Hurairah, that the Messenger of Allah (ﷺ) said\n\n'Let him who believes in Allah and the Last Day speak good, or keep silent; and let him who believes in Allah and the Last Day be generous to his neighbour; and let him who believes in Allah and the Last Day be generous to his guest'.",
      "رَبِّ أَوْزِعْنِي أَنْ أَشْكُرَ نِعْمَتَكَ الَّتِي أَنْعَمْتَ عَلَيَّ وَعَلَىٰ وَالِدَيَّ وَأَنْ أَعْمَلَ صَالِحًا تَرْضَاهُ وَأَدْخِلْنِي بِرَحْمَتِكَ فِي عِبَادِكَ الصَّالِحِينَ",
      "O my Lord! Inspire and bestow upon me the power and ability that I may be grateful for Your favours which You have bestowed on me and on my parents, and that I may do good deeds (righteous) that will please You, and admit me by Your mercy among Your righteous servants.",
      "https://youtu.be/tZYSmOeJFwg"
    ], // 13
    [
      "وَاِذْ قَالَ رَبُّكَ لِلْمَلٰۤىِٕكَةِ ِانِّيْ جَاعِلٌ فِى الْاَرْضِ خَلِيْفَةً ۗ قَالُوْٓا اَتَجْعَلُ فِيْهَا مَنْ يُّفْسِدُ فِيْهَا وَيَسْفِكُ الدِّمَاۤءَۚ وَنَحْنُ نُسَبِّحُ بِحَمْدِكَ وَنُقَدِّسُ لَكَ ۗ قَالَ اِنِّيْٓ اَعْلَمُ مَا لَا تَعْلَمُوْنَ",
      "[Prophet], when your Lord told the angels, ‘I am putting a successor on earth,’ they said, ‘How can You put someone there who will cause damage and bloodshed, when we celebrate Your praise and proclaim Your holiness?’ but He said, ‘I know things you do not.’",
      "On the authority of Abu Dharr, some people from amongst the Companions of the Messenger of Allah (ﷺ) said to the Prophet (ﷺ)\n\n'O Messenger of Allah (ﷺ), the affluent have made off with the rewards; they pray as we pray, they fast as we fast, and they give [much] in charity by virtue of their wealth.' He (peace be upon him) said, 'Has not Allah made things for you to give in charity? Truly every tasbeehah [saying subhan-Allah] is a charity, and every takbeerah [saying Allahu akbar] is a charity, and every tahmeedah [saying alhamdulillah] is a charity, and every tahleelah [saying la ilaha illAllah] is a charity. And commanding the good is a charity, and forbidding an evil is a charity, and in the sexual act of each one of you there is a charity.' They said, 'O Messenger of Allah (ﷺ), when one of us fulfills his sexual desire, will he have some reward for that?' He (ﷺ) said: 'Do you not see that if he were to act upon it [his desire] in an unlawful manner, then he would be deserving of punishment? Likewise, if he were to act upon it in a lawful manner, then he will be deserving of a reward'.",
      "رَبِّ اجْعَلْنِي مُقِيمَ الصَّلاَةِ وَمِن ذُرِّيَّتِي رَبَّنَا وَتَقَبَّلْ دُعَاء",
      "O Lord, make me steadfast in prayer, and (also) some of my offspring. O our Lord, accept my prayer.",
      "https://youtu.be/qqiU9GgEgPY"
    ], // 14
    [
      "قَالَ كَذٰلِكَ اَتَتْكَ اٰيٰتُنَا فَنَسِيْتَهَاۚ وَكَذٰلِكَ الْيَوْمَ تُنْسٰى",
      "[Allah] will say, 'Thus did Our signs come to you, and you forgot [i.e., disregarded] them; and thus will you this Day be forgotten'.",
      "On the authority of an-Nawas bin Sam'an, the Prophet (ﷺ) said\n\n'Righteousness is in good character, and wrongdoing is that which wavers in your soul, and which you dislike people finding out about'.",
      "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ مُنْكَرَاتِ الأَخْلاَقِ وَالأَعْمَالِ وَالأَهْوَاءِ",
      "O Allah, I seek refuge in You from evil character, evil actions, and evil desires.",
      "https://youtu.be/zyAPoWyzsqA"
    ], // 15
    [
      "يَمُنُّوْنَ عَلَيْكَ اَنْ اَسْلَمُوْا ۗ قُلْ لَّا تَمُنُّوْا عَلَيَّ اِسْلَامَكُمْ ۚبَلِ اللّٰهُ يَمُنُّ عَلَيْكُمْ اَنْ هَدٰىكُمْ لِلْاِيْمَانِ اِنْ كُنْتُمْ صٰدِقِيْنَ",
      "They think they have done you [Prophet] a favour by submitting. Say, ‘Do not consider your submission a favour to me; it is God who has done you a favour, by guiding you to faith, if you are truly sincere.’",
      "On the authority of Abu Malik al-Harith bin Asim al-Ashari who said: The Messenger of Allah (ﷺ) said\n\n'Purity is half of Iman. Alhamdulillah (praise be to Allah) fills the scales, and subhan-Allah (how far from imperfection is Allah) and Alhamdulillah (praise be to Allah) fill that which is between heaven and earth. And the Salah (prayer) is a light, and charity is a proof, and patience is illumination, and the Qur'an is a proof either for you or against you. Every person starts his day as a vendor of his soul, either freeing it or bringing about its ruin'.",
      "رَّبِّ أَدْخِلْنِي مُدْخَلَ صِدْقٍ وَأَخْرِجْنِي مُخْرَجَ صِدْقٍ وَاجْعَل لِّي مِن لَّدُنكَ سُلْطَانًا نَّصِيرًا",
      "O Lord, cause me to enter a goodly entrance and cause me to exit a goodly exit, and grant me from Yourself a supporting authority.",
      "https://youtu.be/RlYBensjfRY"
    ], // 16
    [
      "يٰٓاَيُّهَا الَّذِيْنَ اٰمَنُوا اجْتَنِبُوْا كَثِيْرًا مِّنَ الظَّنِّۖ اِنَّ بَعْضَ الظَّنِّ اِثْمٌ وَّلَا تَجَسَّسُوْا وَلَا يَغْتَبْ بَّعْضُكُمْ بَعْضًاۗ اَيُحِبُّ اَحَدُكُمْ اَنْ يَّأْكُلَ لَحْمَ اَخِيْهِ مَيْتًا فَكَرِهْتُمُوْهُۗ وَاتَّقُوا اللّٰهَ ۗاِنَّ اللّٰهَ تَوَّابٌ رَّحِيْمٌ",
      "Believers, avoid making too many assumptions- some assumptions are sinful- and do not spy on one another or speak ill of people behind their backs: would any of you like to eat the flesh of your dead brother? No, you would hate it. So be mindful of God: God is ever relenting, most merciful.",
      "On the authority of Sahl bin Sa'ad al-Sa'idi who said: A man came to the Prophet (ﷺ) and said\n\n'O Messenger of Allah (ﷺ), direct me to an act which, if I do it, [will cause] Allah to love me and the people to love me'. So he (peace be upon him) said, 'Renounce the world and Allah will love you, and renounce what people possess and the people will love you'.",
      "اَللّٰھُمَّ إِنِّیْ أَعُوْذُبِکَ مِنْ جَھْدِ الْبَلاَءِ ، وَدَرْکِ الشَّقَاءِ، وَسُوءِ الْقَضَاءِ ، وَشَمَاتَةِ الأَعْدَاءِ",
      "O Allah! Indeed I seek refuge in You from severe trials and hardships, being overtaken by misfortune, a bad fate and the rejoicing of enemies.",
      "https://youtu.be/Febw2kik1ws"
    ], // 17
    [
      "قُلْ يَتَوَفّٰىكُمْ مَّلَكُ الْمَوْتِ الَّذِيْ وُكِّلَ بِكُمْ ثُمَّ اِلٰى رَبِّكُمْ تُرْجَعُوْنَ",
      "Say, ‘The Angel of Death put in charge of you will reclaim you, and then you will be brought back to your Lord.’",
      "It was narrated that ‘Aishah said:The Prophet (ﷺ) used to strive hard (in worship) in the last ten nights of Ramadan as he never did at any other time.",
      "رَّبِّ اغْفِرْ وَارْحَمْ وَأَنتَ خَيْرُ الرَّاحِمِينَ",
      "My Lord! Forgive and have mercy, for You are the best of those who show mercy.",
      "https://youtu.be/IKZ9uS1rEUk"
    ], // 18
    [
      "وَالَّذِيْنَ اٰمَنُوْا وَعَمِلُوا الصّٰلِحٰتِ لَنُكَفِّرَنَّ عَنْهُمْ سَيِّاٰتِهِمْ وَلَنَجْزِيَنَّهُمْ اَحْسَنَ الَّذِيْ كَانُوْا يَعْمَلُوْنَ",
      "We shall certainly blot out the misdeeds of those who believe and do good deeds, and We shall reward them according to the best of their actions.",
      "Narrated `Aisha, Allah's Messenger (ﷺ) used to practice I`tikaf in the last ten nights of Ramadan and used to say\n\n'Look for the Night of Qadr in the last ten nights of the month of Ramadan'",
      "اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ، وَشُكْرِكَ، وَحُسْنِ عِبَادَتِكَ",
      "O Allah, help me remember You, to be grateful to You, and to worship You in an excellent manner",
      "https://youtu.be/zbg5_3Vb5n4"
    ], // 19
    [
      "كَبُرَ مَقْتًا عِنْدَ اللّٰهِ اَنْ تَقُوْلُوْا مَا لَا تَفْعَلُوْنَ",
      "It is most hateful to God that you say things and then do not do them;",
      "On the authority of Abu 'Abdullah al-Nu'man bin Bashir who said: I heard the Messenger of Allah (ﷺ) say\n\n'The halal is clear and the haram is clear, and between them are matters unclear that are unknown to most people. Whoever is wary of these unclear matters has absolved his religion and honor. And whoever indulges in them has indulged in the haram. It is like a shepherd who herds his sheep too close to preserved sanctuary, and they will eventually graze in it. Every king has a sanctuary, and the sanctuary of Allah is what He has made haram. There lies within the body a piece of flesh. If it is sound, the whole body is sound; and if it is corrupted, the whole body is corrupted. Verily this piece is the heart'.",
      "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا",
      "Our Lord, give us in this world [that which is] good and in the Hereafter [that which is] good and protect us from the punishment of the Fire.",
      "https://youtu.be/lUrK4sTKYLc"
    ], // 20
    [
      "يَوْمَ يَبْعَثُهُمُ اللّٰهُ جَمِيْعًا فَيُنَبِّئُهُمْ بِمَا عَمِلُوْاۗ اَحْصٰىهُ اللّٰهُ وَنَسُوْهُۗ وَاللّٰهُ عَلٰى كُلِّ شَيْءٍ شَهِيْدٌ",
      "on the Day when God will raise everyone and make them aware of what they have done. God has taken account of it all, though they may have forgotten: He witnesses everything.",
      "On the authority of Abu Hurairah, The Prophet (ﷺ) said\n\n'Whoever fasted the month of Ramadan out of sincere Faith (i.e. belief) and hoping for a reward from Allah, then all his past sins will be forgiven, and whoever stood for the prayers in the night of Qadr out of sincere Faith and hoping for a reward from Allah, then all his previous sins will be forgiven'.",
      "اللهم إنك عفو تحب العفو فاعفُ عني",
      "O Allah, You are Most Forgiving, and You love forgiveness; so forgive me",
      "https://youtu.be/UJYkwPDwC-Y"
    ], // 21
    [
      "يَّوْمَ يَقُوْمُ النَّاسُ لِرَبِّ الْعٰلَمِيْنَۗ",
      "The Day when mankind will stand before the Lord of the worlds",
      "On the authority of Abu Hamzah Anas bin Malik - the servant of the Messenger of Allah (ﷺ) - that the Prophet (peace and blessings of Allah be upon him) said\n\n'None of you will believe until you love for your brother what you love for yourself'.",
      "رَّبِّ زِدْنِى عِلْمًا",
      "O’My Lord! Increase me in knowledge.",
      "https://youtu.be/_OlZmKsQAYY"
    ], // 22
    [
      "وَاَمَّا الَّذِيْنَ كَفَرُوْا وَكَذَّبُوْا بِاٰيٰتِنَا وَلِقَاۤئِ الْاٰخِرَةِ فَاُولٰۤىِٕكَ فِى الْعَذَابِ مُحْضَرُوْنَ",
      "But as for those who disbelieved and denied Our verses and the meeting of the Hereafter, those will be brought into the punishment [to remain]",
      "On the authority of Abu 'Abdullah al-Nu'man bin Bashir who said: I heard the Messenger of Allah (ﷺ) say\n\n'The halal is clear and the haram is clear, and between them are matters unclear that are unknown to most people. Whoever is wary of these unclear matters has absolved his religion and honor. And whoever indulges in them has indulged in the haram. It is like a shepherd who herds his sheep too close to preserved sanctuary, and they will eventually graze in it. Every king has a sanctuary, and the sanctuary of Allah is what He has made haram. There lies within the body a piece of flesh. If it is sound, the whole body is sound; and if it is corrupted, the whole body is corrupted. Verily this piece is the heart'.",
      "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الأَرْبَعِ مِنْ عِلْمٍ لاَ يَنْفَعُ وَمِنْ قَلْبٍ لاَ يَخْشَعُ وَمِنْ نَفْسٍ لاَ تَشْبَعُ وَمِنْ دُعَاءٍ لاَ يُسْمَعُ",
      "O Allah, I seek refuge in Thee from four things: Knowledge which does not profit, a heart which is not submissive, a soul which has an insatiable appetite, and a supplication which is not heard.",
      "https://youtu.be/_j9wZDIgYuE"
    ], // 23
    [
      "اِنَّ اللّٰهَ لَا يَخْفٰى عَلَيْهِ شَيْءٌ فِى الْاَرْضِ وَلَا فِى السَّمَاۤءِ",
      "Surely, Allah is such that nothing is hidden from Him, neither in the earth nor in the sky.",
      "On the authority of Abu Hurairah who said: The Messenger of Allah (ﷺ) said\n\n'Allah the Almighty is good and accepts only that which is good. And verily Allah has commanded the believers to do that which He has commanded the Messengers. So the Almighty has said: O (you) Messengers! Eat of the tayyibat (good things), and perform righteous deeds [23:51] and the Almighty has said: O you who believe! Eat of the lawful things that We have provided you [2:172]'. Then he (ﷺ) mentioned a man who, having journeyed far, is dishevelled and dusty, and who spreads out his hands to the sky saying, O Lord! O Lord! while his food is haram, his drink is haram, his clothing is haram, and he has been nourished with haram, so how can [his supplication] be answered?",
      "اَللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا, وَ رِزْقًا طَيَّبًا, وَ عَمَلاً مُتَقَبَّل",
      "O Allah! I ask You for knowledge that is of benefit, a good provision and deeds that will be accepted",
      "https://youtu.be/Mq9x7qAX_Fs"
    ], // 24
    [
      "ۨالَّذِيْ خَلَقَ الْمَوْتَ وَالْحَيٰوةَ لِيَبْلُوَكُمْ اَيُّكُمْ اَحْسَنُ عَمَلًاۗ وَهُوَ الْعَزِيْزُ الْغَفُوْرُۙ",
      "who created death and life to test you [people] and reveal which of you does best––He is the Mighty, the Forgiving",
      "On the authority of Ibn Abbas, from the Messenger of Allah (ﷺ) from what he has related from his Lord\n\n'Verily Allah ta’ala has written down the good deeds and the evil deeds, and then explained it [by saying]: Whosoever intended to perform a good deed, but did not do it, then Allah writes it down with Himself as a complete good deed. And if he intended to perform it and then did perform it, then Allah writes it down with Himself as from ten good deeds up to seven hundred times, up to many times multiplied. And if he intended to perform an evil deed, but did not do it, then Allah writes it down with Himself as a complete good deed. And if he intended it [i.e., the evil deed] and then performed it, then Allah writes it down as one evil deed'.",
      "يَا مُقَلِّبَ الْقُلُوبِ ثَبِّتْ قَلْبِى عَلَى دِينِكَ",
      "O Turner of hearts, keep my heart steadfast on Your deen.",
      "https://youtu.be/AnBxSm-7DSo"
    ], // 25
    [
      "اِنَّآ اَرْسَلْنَا نُوْحًا اِلٰى قَوْمِهٖٓ اَنْ اَنْذِرْ قَوْمَكَ مِنْ قَبْلِ اَنْ يَّأْتِيَهُمْ عَذَابٌ اَلِيْمٌ",
      "We sent Noah to his people: ‘Warn your people, before a painful punishment comes to them.’",
      "On the authority of Abdullah ibn Umar, who said: The Messenger of Allah (ﷺ) took me by the shoulder and said\n\n'Be in this world as though you were a stranger or a wayfarer'.",
      "رَبَّنَا ظَلَمْنَا أَنفُسَنَا وَإِن لَّمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الْخَاسِرِينَ",
      "Our Lord! We have wronged ourselves, and if You do not forgive us and not have mercy on us, we shall most surely be among the losers.",
      "https://youtu.be/67i6VH2VLMI"
    ], // 26
    [
      "لَنْ تَنْفَعَكُمْ اَرْحَامُكُمْ وَلَآ اَوْلَادُكُمْ ۛيَوْمَ الْقِيٰمَةِ ۛيَفْصِلُ بَيْنَكُمْۗ وَاللّٰهُ بِمَا تَعْمَلُوْنَ بَصِيْرٌ",
      "Never will your relatives or your children benefit you; the Day of Resurrection He will judge between you. And Allah, of what you do, is Seeing",
      "On the authority of Anas who said: I heard the Messenger of Allah (ﷺ) say, Allah the Almighty has said\n\n‘O Son of Adam, as long as you invoke Me and ask of Me, I shall forgive you for what you have done, and I shall not mind. O Son of Adam, were your sins to reach the clouds of the sky and you then asked forgiveness from Me, I would forgive you. O Son of Adam, were you to come to Me with sins nearly as great as the Earth, and were you then to face Me, ascribing no partner to Me, I would bring you forgiveness nearly as great as it [too].’",
      "فَاطِرَ السَّمَاوَاتِ وَالأرْضِ أَنْتَ وَلِيِّي فِي الدُّنْيَا وَالآخِرَةِ تَوَفَّنِي مُسْلِمًا وَأَلْحِقْنِي بِالصَّالِحِينَ",
      "Creator of the heavens and earth, You are my protector in this world and in the Hereafter. Cause me to die a Muslim and join me with the righteous.",
      "https://youtu.be/uiHhnZ_Cn_Y"
    ], // 27
    [
      "وَالَّذِيْنَ اهْتَدَوْا زَادَهُمْ هُدًى وَّاٰتٰىهُمْ تَقْوٰىهُمْ",
      "God has increased the guidance of those who follow the right path, and given them their awareness [of Him]",
      "On the authority of Abu Muhammad Abdullah bin ’Amr bin al-’Aas who said: The Messenger of Allah (ﷺ) said\n\n'None of you [truly] believes until his desires are subservient to that which I have brought'.",
      "رَبِّ اغْفِرْ لِي وَتُبْ عَلَىَّ إِنَّكَ أَنْتَ التَّوَّابُ الْغَفُورُ",
      "O my Lord, forgive me, and accept my repentance. Verily, You are the Oft- Returning, the Most Forgiving.",
      "https://youtu.be/1TJM_KrN0zE"
    ], // 28
    [
      "وَلَقَدْ جِئْنٰهُمْ بِكِتٰبٍ فَصَّلْنٰهُ عَلٰى عِلْمٍ هُدًى وَّرَحْمَةً لِّقَوْمٍ يُّؤْمِنُوْنَ",
      "And We had certainly brought them a Book which We detailed by knowledge – as guidance and mercy to a people who believe",
      "On the authority of Abu Hurairah who said: The Messenger of Allah (ﷺ) said, Verily Allah ta’ala has said\n\n‘Whosoever shows enmity to a wali (friend) of Mine, then I have declared war against him. And My servant does not draw near to Me with anything more loved to Me than the religious duties I have obligated upon him. And My servant continues to draw near to me with nafil (supererogatory) deeds until I Love him. When I Love him, I am his hearing with which he hears, and his sight with which he sees, and his hand with which he strikes, and his foot with which he walks. Were he to ask [something] of Me, I would surely give it to him; and were he to seek refuge with Me, I would surely grant him refuge'.",
      "اللَّهُمَّ إِنِّي أَسْأَلُكَ مُوْجِبَاتِ رَحْمَتِكَ، وَعَزَائِمَ مَغْفِرَتِكَ، وَالسَّلَامَةَ مِنْ كُلِّ إِثْمٍ، وَالْغَنِيْمَةَ مِنْ كُلِّ بِرٍ، وَالْفَوْزَ بِالجَنَّةِ، وَالنَّجَاةَ مِنَ النَّارِ",
      "O Allah! I beg You for that which incites Your mercy and the means of Your forgiveness, safety from every sin, the benefit from every good deed, success in attaining Jannah and safety from the Fire.",
      "https://youtu.be/m6MOZMpaP1E"
    ], // 29
    [
      "وَاُخْرٰى تُحِبُّوْنَهَاۗ نَصْرٌ مِّنَ اللّٰهِ وَفَتْحٌ قَرِيْبٌۗ وَبَشِّرِ الْمُؤْمِنِيْنَ",
      "And [you will obtain] another [favor] that you love – victory from Allah and an imminent conquest; and give good tidings to the believers",
      "Abu Ayub narrated that the Messenger of Allah (ﷺ) said\n\n'Whoever fasts Ramadan, then follows it with six from Shawwal, then that is (equal in reward) to fasting everyday'.",
      "اَللّٰهُمَّ اَلِّفْ بَيْنَ قُلُوْبِنَا وَأَصْلِحْ ذَاتَ بَيْنِنَا، وَاهْدِنَا سُبُلَ السَّلاَمِ، وَنَجِّنَا مِنَ الظُّلُمَاتِ إِلَى النُّوْرِ",
      "O Allah, join our hearts, reform our matters within us, guide us to the path of peace, bring us from darkness to light.",
      "https://youtu.be/_UomJ4KolFE"
    ], // 30
  ];

  String dt = "14 March";
  String d0 = "22 March";
  String d1 = "23 March";
  String d2 = "24 March";
  String d3 = "25 March";
  String d4 = "26 March";
  String d5 = "27 March";
  String d6 = "28 March";
  String d7 = "29 March";
  String d8 = "30 March";
  String d9 = "31 March";
  String d10 = "1 April";
  String d11 = "2 April";
  String d12 = "3 April";
  String d13 = "4 April";
  String d14 = "5 April";
  String d15 = "6 April";
  String d16 = "7 April";
  String d17 = "8 April";
  String d18 = "9 April";
  String d19 = "10 April";
  String d20 = "11 April";
  String d21 = "12 April";
  String d22 = "13 April";
  String d23 = "14 April";
  String d24 = "15 April";
  String d25 = "16 April";
  String d26 = "17 April";
  String d27 = "18 April";
  String d28 = "19 April";
  String d29 = "20 April";
  String d30 = "21 April";

  String fajrStart = "";
  String fajrJamat = "";
  String dhuhrStart = "";
  String dhuhrJamat = "";
  String asrStart = "";
  String asrJamat = "";
  String maghribStart = "";
  String maghribJamat = "";
  String ishaStart = "";
  String ishaJamat = "";

  String qarabic = "";
  String qenglish = "";
  String hadith = "";
  String darabic = "";
  String denglish = "";
  String video = '';

  int count = 0;

  void initState() {
    super.initState();

    activeFundraisingTotal = 600000 - fundraisingTotal;

    prayerTimes();

    final periodicTimer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        prayerTimes();
        setState(() {
          count = count + 1;

          currentDay = DateFormat('d MMMM').format(now);

          if (printedDay == currentDay) {
          } else {
            setState(() {
              printedDay = currentDay;
            });
          }
        });
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        color: Colors.white,
        child: Container(
          //width: MediaQuery.of(context).size.width * 0.86,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.86,
                height: MediaQuery.of(context).size.height * 0.027,
                child: Row(
                  children: [
                    const AutoSizeText(
                      "Prayer Times",
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans-SemiBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: kalmostBlack,
                      ),
                    ),
                    Spacer(),
                    AutoSizeText(
                      //formatter = DateFormat('d MMMM').format(now)),
                      printedDay,
                      style: const TextStyle(
                        fontFamily: 'PlusJakartaSans-SemiBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: kalmostBlack,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.013,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2819,
                width: MediaQuery.of(context).size.width * 0.86,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                  color: kbeige,
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.028,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.245,
                      width: MediaQuery.of(context).size.width * 0.26,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: kbeige,
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.0604,
                          ),
                          Row(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.0205,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: const AutoSizeText(
                                  'Fajr',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: kdarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.0205,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: const AutoSizeText(
                                  'Dhuhr',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: kdarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.0205,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: const AutoSizeText(
                                  'Asr',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: kdarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.0205,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: const AutoSizeText(
                                  'Maghrib',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: kdarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.0205,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: const AutoSizeText(
                                  'Isha',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: kdarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.245,
                      width: MediaQuery.of(context).size.width * 0.21,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: kdarkBlue,
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.008,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: const AutoSizeText(
                                  'Start',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.027,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: AutoSizeText(
                                  fajrStart,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: AutoSizeText(
                                  dhuhrStart,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: AutoSizeText(
                                  asrStart,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: AutoSizeText(
                                  maghribStart,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: AutoSizeText(
                                  ishaStart,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.245,
                      width: MediaQuery.of(context).size.width * 0.21,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: kalmostBlack,
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.008,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: const AutoSizeText(
                                  'Jamat',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.027,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: AutoSizeText(
                                  fajrJamat,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: AutoSizeText(
                                  dhuhrJamat,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: AutoSizeText(
                                  asrJamat,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: AutoSizeText(
                                  maghribJamat,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0248,
                                child: AutoSizeText(
                                  ishaJamat,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.062,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.023,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.86,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.0947,
                      width: MediaQuery.of(context).size.width * 0.5410,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: kalmostBlack,
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.046,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.024,
                                child: const AutoSizeText(
                                  'Tarawih',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.024,
                                child: AutoSizeText(
                                  taraweehTime,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.046,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.0094,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.046,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.024,
                                child: const AutoSizeText(
                                  'Qiyaam',
                                  style: TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.024,
                                child: AutoSizeText(
                                  qiyaamTime,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.046,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.0947,
                      width: MediaQuery.of(context).size.width * 0.2717,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: kdarkBlue,
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.225,
                                height:
                                    MediaQuery.of(context).size.height * 0.024,
                                child: const Center(
                                  child: AutoSizeText(
                                    'Fast',
                                    style: TextStyle(
                                      fontFamily: 'PlusJakartaSans-SemiBold',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.0094,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.046,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.021,
                                child: AutoSizeText(
                                  '$fastDay',
                                  minFontSize: 12,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.046,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0213,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.86,
                height: MediaQuery.of(context).size.height * 0.027,
                child: const AutoSizeText(
                  'Daily Reminders',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans-SemiBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kalmostBlack,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.013,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.118,
                width: MediaQuery.of(context).size.width * 0.86,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                  color: kbeige,
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0201,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.069,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                //Navigator.of(context).push(_createRoute0());
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    scrollable: true,
                                    title: const Text('Quran Reminder'),
                                    content: Text("$qarabic\n\n$qenglish"),
                                  ),
                                );
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.0651,
                                width:
                                    MediaQuery.of(context).size.width * 0.141,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  color: kalmostBlack,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    width: MediaQuery.of(context).size.width *
                                        0.24,
                                    child:
                                        Image.asset('images/quranwhite.png')),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.0035,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                              child: const AutoSizeText(
                                'Quran',
                                minFontSize: 10,
                                style: TextStyle(
                                  fontFamily: 'PlusJakartaSans-SemiBold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: kalmostBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.0512,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                //Navigator.of(context).push(_createRoute1());
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    scrollable: true,
                                    title: const Text('Hadith Reminder'),
                                    content: Text("$hadith"),
                                  ),
                                );
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.0651,
                                width:
                                    MediaQuery.of(context).size.width * 0.141,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  color: kalmostBlack,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                    width: MediaQuery.of(context).size.width *
                                        0.20,
                                    child:
                                        Image.asset('images/hadithwhite.png')),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.0035,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                              child: const AutoSizeText(
                                'Hadith',
                                minFontSize: 10,
                                style: TextStyle(
                                  fontFamily: 'PlusJakartaSans-SemiBold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: kalmostBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.0512,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                //Navigator.of(context).push(_createRoute2());
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    scrollable: true,
                                    title: const Text('Dua Reminder'),
                                    content: Text("$darabic\n\n$denglish"),
                                  ),
                                );
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.0651,
                                width:
                                    MediaQuery.of(context).size.width * 0.141,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  color: kalmostBlack,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    child: Image.asset('images/duawhite.png')),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.0035,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                              child: const AutoSizeText(
                                'Dua',
                                minFontSize: 10,
                                style: TextStyle(
                                  fontFamily: 'PlusJakartaSans-SemiBold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: kalmostBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.0512,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                //Navigator.of(context).push(_createRoute3());
                                prayerTimes();
                                _launchUrl();
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.0651,
                                width:
                                    MediaQuery.of(context).size.width * 0.141,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  color: kalmostBlack,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    width: MediaQuery.of(context).size.width *
                                        0.24,
                                    child:
                                        Image.asset('images/remindwhite.png')),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.0035,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                              child: const AutoSizeText(
                                'Reminder',
                                minFontSize: 10,
                                style: TextStyle(
                                  fontFamily: 'PlusJakartaSans-SemiBold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: kalmostBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.069,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0142,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0213,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.86,
                height: MediaQuery.of(context).size.height * 0.027,
                child: const AutoSizeText(
                  'Help Purchase Our Masjid',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans-SemiBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kalmostBlack,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.013,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.86,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            // This width is 232 over a total width of 390
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.094,
                              width: MediaQuery.of(context).size.width *
                                  ((fundraisingTotal / 600000) * 0.594),
                              decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.all(
                                //   Radius.circular(4),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.zero,
                                    bottomLeft: Radius.circular(4),
                                    bottomRight: Radius.zero),
                                color: kdarkBlue,
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.094,
                              width: MediaQuery.of(context).size.width *
                                  (((600000 - fundraisingTotal) / 600000) *
                                      0.594),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.zero,
                                    topRight: Radius.circular(4),
                                    bottomLeft: Radius.zero,
                                    bottomRight: Radius.circular(4)
                                    // borderRadius: BorderRadius.all(
                                    //   Radius.circular(4),
                                    ),
                                color: kred,
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.035,
                          left: MediaQuery.of(context).size.height * 0.023,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                _url = Uri.parse(collectionLink);
                                _launchUrl();
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: AutoSizeText(
                                  "£${fundraisingTotal.toInt()} / £600,000",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'PlusJakartaSans-SemiBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        // _url = Uri.parse(collectionVid);
                        // _launchUrl();
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Text('Fundraising Video'),
                            content: Text(
                                "Our video will be up tomorrow inshaa'Allaah. In the meantime, please donate very generously, this masjid needs your support!"),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.094,
                        width: MediaQuery.of(context).size.width * 0.235,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: kdarkBlue,
                          shape: BoxShape.rectangle,
                        ),
                        child: Center(
                          child: Image.asset('images/videowhite.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.029,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.86,
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            //Navigator.of(context).push(_createRoute0());
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Imam Tracker'),
                                content: Text(itracker),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.071,
                            width: MediaQuery.of(context).size.width * 0.20,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              color: kbeige,
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  child: Image.asset('images/tracking.png'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0106,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                          child: const AutoSizeText(
                            'Imam Tracker',
                            minFontSize: 10,
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans-SemiBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: kalmostBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _url = Uri.parse(zakatLink);
                            _launchUrl();
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.071,
                            width: MediaQuery.of(context).size.width * 0.20,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              color: kbeige,
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  child: Image.asset('images/zakatblack.png'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0106,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                          child: const AutoSizeText(
                            'Zakat',
                            minFontSize: 10,
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans-SemiBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: kalmostBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                title: Text('Zakat ul Fitr'),
                                content: Text(
                                    "Further information will be made available about Zakat ul Fitr and how to pay it in due course inshaa'Allah"),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.071,
                            width: MediaQuery.of(context).size.width * 0.20,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              color: kbeige,
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  child: Image.asset('images/zafblack.png'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0106,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                          child: const AutoSizeText(
                            'Zakat ul Fitr',
                            minFontSize: 10,
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans-SemiBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: kalmostBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                scrollable: true,
                                title: Text('FAQs'),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '1. Will there be facilities for sisters to pray Tarawih?\n',
                                      style: TextStyle(
                                          color: kdarkBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Yes there will be prayer facilities for sisters.\n',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text('----------\n'),
                                    Text(
                                      '2. Will there be facilities for children to be taken care of?\n',
                                      style: TextStyle(
                                          color: kdarkBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'No unfortunately not. We would advise not bringing any child under the age of 7 years to the Tarawih prayer. Any children under the age of 14 must be supervised by their parents. Parents should be mindful that people are coming to make the best of this month of worship and they should try to ensure that their children do not make noise and/or cause any disturbance. The masjid cannot take any responsibility for supervising children.\n',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text('----------\n'),
                                    Text(
                                      '3. Are there parking facilities at NMC?\n',
                                      style: TextStyle(
                                          color: kdarkBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Free on-street parking is available on neighbouring residential roads. However, we advise that if you are coming from near by that you walk or take public transport to reduce congestion in the area. Please be respectful of neighbouring residents and refrain from parking in front of private driveways and blocking other vehicles\n',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text('----------\n'),
                                    Text(
                                      '4. Will water be provided for those praying?\n',
                                      style: TextStyle(
                                          color: kdarkBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'We will not be providing bottled water, because we are trying to do our bit to protect the environment from single-use plastic. Please do bring your own reusable and feel free to refill water from the kitchen taps as much as you wish..\n',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text('----------\n'),
                                    Text(
                                      '5. Who will be leading the Tarawih\n',
                                      style: TextStyle(
                                          color: kdarkBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Shaikh Othman Barkouch al-Maghrabi will be leading the whole Tarawih\n',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text('----------\n'),
                                    Text(
                                      '6. Will you be offering Qiyaam al-Layl prayers?\n',
                                      style: TextStyle(
                                          color: kdarkBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Yes, we will be offering Qiyaam prayers at NMC during the last ten nights. Please refer to the app for timings.\n',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text('----------\n'),
                                    Text(
                                      '7. How many rak’ahs will we be performing for Tarawih?\n',
                                      style: TextStyle(
                                          color: kdarkBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'We will be praying 8 rak’ahs for Tarawih insha Allah\n',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text('----------\n'),
                                    Text(
                                      '8. Can I book my place for Tarawih at the masjid?\n',
                                      style: TextStyle(
                                          color: kdarkBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'No unfortunately not. We operate on a first come first serve basis\n',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text('----------\n'),
                                    Text(
                                      '9. Will itikaaf be possible at NMC?\n',
                                      style: TextStyle(
                                          color: kdarkBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Yes there will be facilities for itikaaf, further information will be provided insha Allah.\n',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text('----------\n'),
                                    Text(
                                      '10. Will you be collecting Zakat ul Fitr?\n',
                                      style: TextStyle(
                                          color: kdarkBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Yes there will be further information regarding this during Ramadan\n',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text('----------\n'),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.071,
                            width: MediaQuery.of(context).size.width * 0.20,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              color: kbeige,
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  child: Image.asset('images/faqblack.png'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0106,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                          child: const AutoSizeText(
                            'FAQs',
                            minFontSize: 10,
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans-SemiBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: kalmostBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void prayerTimes() {
    String prayerTime = "";

    int index = 0;

    setState(() {
      currentDay = DateFormat('d MMMM').format(now);

      if (printedDay == currentDay) {
      } else {
        setState(() {
          printedDay = currentDay;
        });
      }
    });

    if (currentDay == "21 March") {
      setState(() {
        fajrStart = ptimes[0][0];
        dhuhrStart = ptimes[0][1];
        asrStart = ptimes[0][2];
        maghribStart = ptimes[0][3];
        ishaStart = ptimes[0][4];
        fajrJamat = ptimes[0][5];
        dhuhrJamat = ptimes[0][6];
        asrJamat = ptimes[0][7];
        maghribJamat = ptimes[0][8];
        ishaJamat = ptimes[0][9];

        fastDay = -1;

        qarabic = reminders[0][0];
        qenglish = reminders[0][1];
        hadith = reminders[0][2];
        darabic = reminders[0][3];
        denglish = reminders[0][4];

        _url = Uri.parse(reminders[0][5]);
      });
    } else if (currentDay == d0) {
      setState(() {
        fajrStart = ptimes[0][0];
        dhuhrStart = ptimes[0][1];
        asrStart = ptimes[0][2];
        maghribStart = ptimes[0][3];
        ishaStart = ptimes[0][4];
        fajrJamat = ptimes[0][5];
        dhuhrJamat = ptimes[0][6];
        asrJamat = ptimes[0][7];
        maghribJamat = ptimes[0][8];
        ishaJamat = ptimes[0][9];

        fastDay = 0;

        index = 0;

        qarabic = reminders[index][0];
        qenglish = reminders[index][1];
        hadith = reminders[index][2];
        darabic = reminders[index][3];
        denglish = reminders[index][4];

        _url = Uri.parse(reminders[index][5]);
      });
    } else if (currentDay == d1) {
      fajrStart = ptimes[1][0];
      dhuhrStart = ptimes[1][1];
      asrStart = ptimes[1][2];
      maghribStart = ptimes[1][3];
      ishaStart = ptimes[1][4];
      fajrJamat = ptimes[1][5];
      dhuhrJamat = ptimes[1][6];
      asrJamat = ptimes[1][7];
      maghribJamat = ptimes[1][8];
      ishaJamat = ptimes[1][9];
      fastDay = 1;

      index = 1;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d2) {
      fajrStart = ptimes[2][0];
      dhuhrStart = ptimes[2][1];
      asrStart = ptimes[2][2];
      maghribStart = ptimes[2][3];
      ishaStart = ptimes[2][4];
      fajrJamat = ptimes[2][5];
      dhuhrJamat = ptimes[2][6];
      asrJamat = ptimes[2][7];
      maghribJamat = ptimes[2][8];
      ishaJamat = ptimes[2][9];
      fastDay = 2;

      index = 2;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d3) {
      fajrStart = ptimes[3][0];
      dhuhrStart = ptimes[3][1];
      asrStart = ptimes[3][2];
      maghribStart = ptimes[3][3];
      ishaStart = ptimes[3][4];
      fajrJamat = ptimes[3][5];
      dhuhrJamat = ptimes[3][6];
      asrJamat = ptimes[3][7];
      maghribJamat = ptimes[3][8];
      ishaJamat = ptimes[3][9];
      fastDay = 3;

      index = 3;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d4) {
      fajrStart = ptimes[4][0];
      dhuhrStart = ptimes[4][1];
      asrStart = ptimes[4][2];
      maghribStart = ptimes[4][3];
      ishaStart = ptimes[4][4];
      fajrJamat = ptimes[4][5];
      dhuhrJamat = ptimes[4][6];
      asrJamat = ptimes[4][7];
      maghribJamat = ptimes[4][8];
      ishaJamat = ptimes[4][9];
      fastDay = 4;

      index = 4;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d5) {
      fajrStart = ptimes[5][0];
      dhuhrStart = ptimes[5][1];
      asrStart = ptimes[5][2];
      maghribStart = ptimes[5][3];
      ishaStart = ptimes[5][4];
      fajrJamat = ptimes[5][5];
      dhuhrJamat = ptimes[5][6];
      asrJamat = ptimes[5][7];
      maghribJamat = ptimes[5][8];
      ishaJamat = ptimes[5][9];
      fastDay = 5;

      index = 5;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d6) {
      fajrStart = ptimes[6][0];
      dhuhrStart = ptimes[6][1];
      asrStart = ptimes[6][2];
      maghribStart = ptimes[6][3];
      ishaStart = ptimes[6][4];
      fajrJamat = ptimes[6][5];
      dhuhrJamat = ptimes[6][6];
      asrJamat = ptimes[6][7];
      maghribJamat = ptimes[6][8];
      ishaJamat = ptimes[6][9];
      fastDay = 6;

      index = 6;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d7) {
      fajrStart = ptimes[7][0];
      dhuhrStart = ptimes[7][1];
      asrStart = ptimes[7][2];
      maghribStart = ptimes[7][3];
      ishaStart = ptimes[7][4];
      fajrJamat = ptimes[7][5];
      dhuhrJamat = ptimes[7][6];
      asrJamat = ptimes[7][7];
      maghribJamat = ptimes[7][8];
      ishaJamat = ptimes[7][9];
      fastDay = 7;

      index = 7;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d8) {
      fajrStart = ptimes[8][0];
      dhuhrStart = ptimes[8][1];
      asrStart = ptimes[8][2];
      maghribStart = ptimes[8][3];
      ishaStart = ptimes[8][4];
      fajrJamat = ptimes[8][5];
      dhuhrJamat = ptimes[8][6];
      asrJamat = ptimes[8][7];
      maghribJamat = ptimes[8][8];
      ishaJamat = ptimes[8][9];
      fastDay = 8;

      index = 8;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d9) {
      fajrStart = ptimes[9][0];
      dhuhrStart = ptimes[9][1];
      asrStart = ptimes[9][2];
      maghribStart = ptimes[9][3];
      ishaStart = ptimes[9][4];
      fajrJamat = ptimes[9][5];
      dhuhrJamat = ptimes[9][6];
      asrJamat = ptimes[9][7];
      maghribJamat = ptimes[9][8];
      ishaJamat = ptimes[9][9];
      fastDay = 9;

      index = 9;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d10) {
      fajrStart = ptimes[10][0];
      dhuhrStart = ptimes[10][1];
      asrStart = ptimes[10][2];
      maghribStart = ptimes[10][3];
      ishaStart = ptimes[10][4];
      fajrJamat = ptimes[10][5];
      dhuhrJamat = ptimes[10][6];
      asrJamat = ptimes[10][7];
      maghribJamat = ptimes[10][8];
      ishaJamat = ptimes[10][9];
      fastDay = 10;

      index = 10;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d11) {
      fajrStart = ptimes[11][0];
      dhuhrStart = ptimes[11][1];
      asrStart = ptimes[11][2];
      maghribStart = ptimes[11][3];
      ishaStart = ptimes[11][4];
      fajrJamat = ptimes[11][5];
      dhuhrJamat = ptimes[11][6];
      asrJamat = ptimes[11][7];
      maghribJamat = ptimes[11][8];
      ishaJamat = ptimes[11][9];
      fastDay = 11;

      index = 11;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d12) {
      fajrStart = ptimes[12][0];
      dhuhrStart = ptimes[12][1];
      asrStart = ptimes[12][2];
      maghribStart = ptimes[12][3];
      ishaStart = ptimes[12][4];
      fajrJamat = ptimes[12][5];
      dhuhrJamat = ptimes[12][6];
      asrJamat = ptimes[12][7];
      maghribJamat = ptimes[12][8];
      ishaJamat = ptimes[12][9];
      fastDay = 12;

      index = 12;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d13) {
      fajrStart = ptimes[13][0];
      dhuhrStart = ptimes[13][1];
      asrStart = ptimes[13][2];
      maghribStart = ptimes[13][3];
      ishaStart = ptimes[13][4];
      fajrJamat = ptimes[13][5];
      dhuhrJamat = ptimes[13][6];
      asrJamat = ptimes[13][7];
      maghribJamat = ptimes[13][8];
      ishaJamat = ptimes[13][9];
      fastDay = 13;

      index = 13;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d14) {
      fajrStart = ptimes[14][0];
      dhuhrStart = ptimes[14][1];
      asrStart = ptimes[14][2];
      maghribStart = ptimes[14][3];
      ishaStart = ptimes[14][4];
      fajrJamat = ptimes[14][5];
      dhuhrJamat = ptimes[14][6];
      asrJamat = ptimes[14][7];
      maghribJamat = ptimes[14][8];
      ishaJamat = ptimes[14][9];
      fastDay = 14;

      index = 14;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d15) {
      fajrStart = ptimes[15][0];
      dhuhrStart = ptimes[15][1];
      asrStart = ptimes[15][2];
      maghribStart = ptimes[15][3];
      ishaStart = ptimes[15][4];
      fajrJamat = ptimes[15][5];
      dhuhrJamat = ptimes[15][6];
      asrJamat = ptimes[15][7];
      maghribJamat = ptimes[15][8];
      ishaJamat = ptimes[15][9];
      fastDay = 15;

      index = 15;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d16) {
      fajrStart = ptimes[16][0];
      dhuhrStart = ptimes[16][1];
      asrStart = ptimes[16][2];
      maghribStart = ptimes[16][3];
      ishaStart = ptimes[16][4];
      fajrJamat = ptimes[16][5];
      dhuhrJamat = ptimes[16][6];
      asrJamat = ptimes[16][7];
      maghribJamat = ptimes[16][8];
      ishaJamat = ptimes[16][9];
      fastDay = 16;

      index = 16;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d17) {
      fajrStart = ptimes[17][0];
      dhuhrStart = ptimes[17][1];
      asrStart = ptimes[17][2];
      maghribStart = ptimes[17][3];
      ishaStart = ptimes[17][4];
      fajrJamat = ptimes[17][5];
      dhuhrJamat = ptimes[17][6];
      asrJamat = ptimes[17][7];
      maghribJamat = ptimes[17][8];
      ishaJamat = ptimes[17][9];
      fastDay = 17;

      index = 17;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d18) {
      fajrStart = ptimes[18][0];
      dhuhrStart = ptimes[18][1];
      asrStart = ptimes[18][2];
      maghribStart = ptimes[18][3];
      ishaStart = ptimes[18][4];
      fajrJamat = ptimes[18][5];
      dhuhrJamat = ptimes[18][6];
      asrJamat = ptimes[18][7];
      maghribJamat = ptimes[18][8];
      ishaJamat = ptimes[18][9];
      fastDay = 18;

      index = 18;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d19) {
      fajrStart = ptimes[19][0];
      dhuhrStart = ptimes[19][1];
      asrStart = ptimes[19][2];
      maghribStart = ptimes[19][3];
      ishaStart = ptimes[19][4];
      fajrJamat = ptimes[19][5];
      dhuhrJamat = ptimes[19][6];
      asrJamat = ptimes[19][7];
      maghribJamat = ptimes[19][8];
      ishaJamat = ptimes[19][9];
      fastDay = 19;

      index = 19;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d20) {
      fajrStart = ptimes[20][0];
      dhuhrStart = ptimes[20][1];
      asrStart = ptimes[20][2];
      maghribStart = ptimes[20][3];
      ishaStart = ptimes[20][4];
      fajrJamat = ptimes[20][5];
      dhuhrJamat = ptimes[20][6];
      asrJamat = ptimes[20][7];
      maghribJamat = ptimes[20][8];
      ishaJamat = ptimes[20][9];
      fastDay = 20;

      index = 20;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d21) {
      fajrStart = ptimes[21][0];
      dhuhrStart = ptimes[21][1];
      asrStart = ptimes[21][2];
      maghribStart = ptimes[21][3];
      ishaStart = ptimes[21][4];
      fajrJamat = ptimes[21][5];
      dhuhrJamat = ptimes[21][6];
      asrJamat = ptimes[21][7];
      maghribJamat = ptimes[21][8];
      ishaJamat = ptimes[21][9];
      fastDay = 21;

      index = 21;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d22) {
      fajrStart = ptimes[22][0];
      dhuhrStart = ptimes[22][1];
      asrStart = ptimes[22][2];
      maghribStart = ptimes[22][3];
      ishaStart = ptimes[22][4];
      fajrJamat = ptimes[22][5];
      dhuhrJamat = ptimes[22][6];
      asrJamat = ptimes[22][7];
      maghribJamat = ptimes[22][8];
      ishaJamat = ptimes[22][9];
      fastDay = 22;

      index = 22;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d23) {
      fajrStart = ptimes[23][0];
      dhuhrStart = ptimes[23][1];
      asrStart = ptimes[23][2];
      maghribStart = ptimes[23][3];
      ishaStart = ptimes[23][4];
      fajrJamat = ptimes[23][5];
      dhuhrJamat = ptimes[23][6];
      asrJamat = ptimes[23][7];
      maghribJamat = ptimes[23][8];
      ishaJamat = ptimes[23][9];
      fastDay = 23;

      index = 23;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d24) {
      fajrStart = ptimes[24][0];
      dhuhrStart = ptimes[24][1];
      asrStart = ptimes[24][2];
      maghribStart = ptimes[24][3];
      ishaStart = ptimes[24][4];
      fajrJamat = ptimes[24][5];
      dhuhrJamat = ptimes[24][6];
      asrJamat = ptimes[24][7];
      maghribJamat = ptimes[24][8];
      ishaJamat = ptimes[24][9];
      fastDay = 24;

      index = 24;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d25) {
      fajrStart = ptimes[25][0];
      dhuhrStart = ptimes[25][1];
      asrStart = ptimes[25][2];
      maghribStart = ptimes[25][3];
      ishaStart = ptimes[25][4];
      fajrJamat = ptimes[25][5];
      dhuhrJamat = ptimes[25][6];
      asrJamat = ptimes[25][7];
      maghribJamat = ptimes[25][8];
      ishaJamat = ptimes[25][9];
      fastDay = 25;

      index = 25;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d26) {
      fajrStart = ptimes[26][0];
      dhuhrStart = ptimes[26][1];
      asrStart = ptimes[26][2];
      maghribStart = ptimes[26][3];
      ishaStart = ptimes[26][4];
      fajrJamat = ptimes[26][5];
      dhuhrJamat = ptimes[26][6];
      asrJamat = ptimes[26][7];
      maghribJamat = ptimes[26][8];
      ishaJamat = ptimes[26][9];
      fastDay = 26;

      index = 26;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d27) {
      fajrStart = ptimes[27][0];
      dhuhrStart = ptimes[27][1];
      asrStart = ptimes[27][2];
      maghribStart = ptimes[27][3];
      ishaStart = ptimes[27][4];
      fajrJamat = ptimes[27][5];
      dhuhrJamat = ptimes[27][6];
      asrJamat = ptimes[27][7];
      maghribJamat = ptimes[27][8];
      ishaJamat = ptimes[27][9];
      fastDay = 27;

      index = 27;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d28) {
      fajrStart = ptimes[28][0];
      dhuhrStart = ptimes[28][1];
      asrStart = ptimes[28][2];
      maghribStart = ptimes[28][3];
      ishaStart = ptimes[28][4];
      fajrJamat = ptimes[28][5];
      dhuhrJamat = ptimes[28][6];
      asrJamat = ptimes[28][7];
      maghribJamat = ptimes[28][8];
      ishaJamat = ptimes[28][9];
      fastDay = 28;

      index = 28;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d29) {
      fajrStart = ptimes[29][0];
      dhuhrStart = ptimes[29][1];
      asrStart = ptimes[29][2];
      maghribStart = ptimes[29][3];
      ishaStart = ptimes[29][4];
      fajrJamat = ptimes[29][5];
      dhuhrJamat = ptimes[29][6];
      asrJamat = ptimes[29][7];
      maghribJamat = ptimes[29][8];
      ishaJamat = ptimes[29][9];
      fastDay = 29;

      index = 29;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    } else if (currentDay == d30) {
      fajrStart = ptimes[30][0];
      dhuhrStart = ptimes[30][1];
      asrStart = ptimes[30][2];
      maghribStart = ptimes[30][3];
      ishaStart = ptimes[30][4];
      fajrJamat = ptimes[30][5];
      dhuhrJamat = ptimes[30][6];
      asrJamat = ptimes[30][7];
      maghribJamat = ptimes[30][8];
      ishaJamat = ptimes[30][9];
      fastDay = 30;

      index = 30;

      qarabic = reminders[index][0];
      qenglish = reminders[index][1];
      hadith = reminders[index][2];
      darabic = reminders[index][3];
      denglish = reminders[index][4];

      _url = Uri.parse(reminders[index][5]);
    }
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  // Route _createRoute0() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => const Qremind(),
  //     transitionDuration: const Duration(seconds: 0),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return child;
  //     },
  //   );
  // }
}
