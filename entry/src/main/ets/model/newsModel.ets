export class NewsModel {
  reason: string
  error_code: number
  result: {
    data: Array<NewsData>
  }
}

export class NewsData {
  uniquekey: string
  title: string
  date: string
  category: string
  author_name: string
  url: string
  thumbnail_pic_s: string
  thumbnail_pic_s02?: string
  thumbnail_pic_s03?: string
  is_content: string

  constructor(_title: string, _date:string,_url:string){
    this.title=_title;
    this.date=_date;
    this.url=_url;
  }
}

export function getTips(){
  return [
    '水獭睡觉时会“牵手”，所以不会飘离对方,而且看上去超级可爱!',
    '蜂鸟是已知的唯一能倒着飞的鸟，它们经常在远离花朵的时候这样做。',
    '海豚会故意逗弄河豚，使它们释放毒素。这些毒素在高剂量下可能是致命的，但也有麻醉作用——并且是一种强有力的致幻剂，海豚似乎很享受这种效果。',
    '世界上最致命的动物不是鲨鱼、熊或老虎，而是更小的动物——蚊子',
    '世界上所有昆虫的总数大约是人类的14亿倍。',
    '迄今为止发现的最大乌贼有50多英尺长，近1吨重。客观地说，它比一辆公共汽车还要大。'
  ]
}

export function getNews(){
  return [
    new NewsData('女子喝白酒死亡同桌3闺蜜担责','2023-12-15 15:25','http://www.mnw.cn/news/shehui/2869678.html'),
    new NewsData('515人送医，102人骨折！北京地铁事故','2023-12-15 14:03:53','https://new.qq.com/rain/a/20231215A04WLD00'),
    new NewsData('我国研发人员全时当量稳居世界首位','2023-12-15 15:13','http://www.mnw.cn/news/china/2869667.html')
  ]
}

export function getTest() {
  return [
    {
      "uniquekey": "730d260deec7619a27846eeb54bd98bf",
      "title": "江西吉安峡江县：寻找11月4日到过津津饭店人员",
      "date": "2023-11-12 06:58:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112065836414678454.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112065836_dc821d823451739be27b2abf9c96bd15_1_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "708c3c0d44d45d65cfb4142031bd08a1",
      "title": "两大博览会同期开幕，上海国际艺术品交易月渐入高潮",
      "date": "2023-11-12 06:57:00",
      "category": "头条",
      "author_name": "解放日报",
      "url": "https://mini.eastday.com/mobile/211112065734927868893.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112065734_56d651c9e1c82e629ccbd6e270af9861_1_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "2f7f15d0f9a725fb4e821d14a8bee2f5",
      "title": "新农合缴费迎来“新政策”？有3类人免交钱，还有1类人需尽快停交",
      "date": "2023-11-12 06:50:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112065030323599018.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112065030_73d75367135ca94f1844aa7d6dc89faf_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112065030_73d75367135ca94f1844aa7d6dc89faf_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112065030_73d75367135ca94f1844aa7d6dc89faf_3_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "44100cbf5c41d422e18d263adf01e134",
      "title": "群众因暴雪受困，白城消防救援官兵深夜紧急救助",
      "date": "2023-11-12 06:42:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112064229087970767.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112064229_e6a411be7b9f11ec057d1ac5d75f7647_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112064229_e6a411be7b9f11ec057d1ac5d75f7647_2_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "f20eb9b8367b9d637323ec2bbe0167b4",
      "title": "经历了1953年以来降雪量最大的恶劣天气！双辽市万众一心全力抗击",
      "date": "2023-11-12 06:42:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112064226446726125.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112064226_d07cc41357deda064a810fdc0ceb2d66_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112064226_d07cc41357deda064a810fdc0ceb2d66_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112064226_d07cc41357deda064a810fdc0ceb2d66_3_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "3a1281ee188c22da5b4d6a93b78926c9",
      "title": "你守护城市，我守护你！柳河县柳爱青年志愿者协会志愿者们为环卫工人送温暖",
      "date": "2023-11-12 06:42:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112064224321559566.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112064224_501b6125c7950aca65dc9c2f7be02592_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112064224_501b6125c7950aca65dc9c2f7be02592_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112064224_501b6125c7950aca65dc9c2f7be02592_3_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "66a11d130c8e9b56ece2600f2d242db2",
      "title": "危险！城市晚报温馨提醒：出行、停车多抬头，远离街头冰溜子",
      "date": "2023-11-12 06:42:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112064219595334957.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112064219_997484f876430331001c85d1484cfb37_1_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "f0081dad21085b527aedebcadc91fb59",
      "title": "漫话山东｜一看标题就知道是山东人",
      "date": "2023-11-12 06:26:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112062625670781352.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112062625_984d01e5b741544ae6fa64374214f988_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112062625_984d01e5b741544ae6fa64374214f988_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112062625_984d01e5b741544ae6fa64374214f988_3_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "5575df90681681a952e9303ba2813023",
      "title": "江苏苏州：当灭火器路遇火情，这不巧了嘛！",
      "date": "2023-11-12 06:26:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112062622402587217.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112062622_181e4a9f74e490a05111927d8b527325_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112062622_181e4a9f74e490a05111927d8b527325_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112062622_181e4a9f74e490a05111927d8b527325_3_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "60290e5328f9218600c443f8bbc5312b",
      "title": "江苏苏州：女子腿卡床缝被困，民警及时上门解救",
      "date": "2023-11-12 06:26:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112062619092832405.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112062619_8dbdc7a29834dd4ceef963769116f692_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112062619_8dbdc7a29834dd4ceef963769116f692_3_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112062619_8dbdc7a29834dd4ceef963769116f692_4_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "5ae38ebde37dd5758fdfb56607409246",
      "title": "江苏苏州：为盗窃破坏监控，蟊贼自作聪明被拍个正着",
      "date": "2023-11-12 06:26:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112062614223550493.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112062614_c012e50d1512b21c9611a87cbbe1b1cd_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112062614_c012e50d1512b21c9611a87cbbe1b1cd_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112062614_c012e50d1512b21c9611a87cbbe1b1cd_3_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "a44ce2725538685cbb0dc39d77e34057",
      "title": "撞护栏逃逸！昌平警方征集现场目击线索",
      "date": "2023-11-12 06:18:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112061811087542409.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112061811_d527eb54dd936aca5a4d9e3caaa522c5_1_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "3b3843f4e2f0bec1f77d0780cfddcbcc",
      "title": "抗美援朝一等功臣何开仲与战友后人跨越71年重逢",
      "date": "2023-11-12 04:58:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112045824156151305.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112045824_a8fe1308cedf5baf5c7b5c49383f3028_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112045824_a8fe1308cedf5baf5c7b5c49383f3028_2_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "a4393741e0e70dc0df8fba0188a5ebf7",
      "title": "绥滨县公安局富强派出所成功救助国家三有保护动物",
      "date": "2023-11-12 03:54:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112035437757468716.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112035437_b071833086c69afccd93c3e24f964bf7_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112035437_b071833086c69afccd93c3e24f964bf7_2_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "2ff321af73f47072aff93e41044e782d",
      "title": "男子每次出手都“满载而归”，结果被民警盯上了！",
      "date": "2023-11-12 03:30:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112033056108957625.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112033056_59b544c96d6b2614df917c6814bba72e_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112033056_59b544c96d6b2614df917c6814bba72e_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112033056_59b544c96d6b2614df917c6814bba72e_3_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "ada197d0f5855a8124a19aaf9915ee61",
      "title": "盲道停车，既不文明也不道德！ | 不文明·随手拍（第26期）",
      "date": "2023-11-12 03:30:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112033050012983956.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112033050_351d90d2ad9f05e89cc50c17550bf9dc_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112033050_351d90d2ad9f05e89cc50c17550bf9dc_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112033050_351d90d2ad9f05e89cc50c17550bf9dc_4_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "c7ddf533d81f24560ee6670b4dd3f501",
      "title": "【民生信息】辽宁疾控发布健康提醒",
      "date": "2023-11-12 01:06:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112010621992881175.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112010621_4eece57903abc779bd462940856f29e9_1_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "c313c2bed93d6ecd5c7e174a949d099a",
      "title": "【战风雪】风雪中的感动",
      "date": "2023-11-12 01:06:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112010616115506968.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112010616_fc1752e081c6235f1aed62972ecdcee2_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112010616_fc1752e081c6235f1aed62972ecdcee2_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112010616_fc1752e081c6235f1aed62972ecdcee2_3_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "20005bdf42c73fff958be0a62c486378",
      "title": "写给未来人看的现世书",
      "date": "2023-11-12 01:06:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112010614073948432.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112010614_8b9746315aa3858e98e7453e6e263e84_1_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "0640297ba917d9a604dbdf8d89422afe",
      "title": "社保在深圳购买费用是多少？在深圳参保需要注意什么？",
      "date": "2023-11-12 00:57:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112005754010510741.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112005754_4871f07083ec4d7cd9555fdd747c478d_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112005754_4871f07083ec4d7cd9555fdd747c478d_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112005754_4871f07083ec4d7cd9555fdd747c478d_3_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "46a5dde4658ab9dc3b93ec715e640592",
      "title": "成都无新增本土病例！购买这些药品需实名登记",
      "date": "2023-11-12 00:57:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112005747913849220.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112005747_0b86f864a00222f59a37197430be78fb_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112005747_0b86f864a00222f59a37197430be78fb_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112005747_0b86f864a00222f59a37197430be78fb_3_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "781163117af1f27151a08338723f6dd1",
      "title": "【我为群众办实事】民警救助发病老人 冬日浓浓关怀暖人心",
      "date": "2023-11-12 00:32:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112003226137332633.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112003226_42659e4fbcad785b74ce551bc3c1c88f_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112003226_42659e4fbcad785b74ce551bc3c1c88f_2_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "6da5d2af4d524338d1ffeeab5064c7d7",
      "title": "宜丰分局快速处置突发交通事故",
      "date": "2023-11-12 00:32:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112003223633428007.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112003223_cf351ad845ea9b1a80d5374603a25948_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112003223_cf351ad845ea9b1a80d5374603a25948_2_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "9cb273d0555b686334de83d81c076c0e",
      "title": "男子顺手牵羊偷盗手机，民警神速破案获赠锦旗",
      "date": "2023-11-12 00:32:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112003214926157130.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112003214_48c19a6457e950db6853bf64a31531c9_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112003214_48c19a6457e950db6853bf64a31531c9_2_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "e4e95f327e3de6c3b61eeb272d7de51e",
      "title": "酒驾逃避检查还拖拽警员 ！凭祥这名驾驶人现在“后悔莫及”了|“身边人身边事”警示行动",
      "date": "2023-11-12 00:32:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112003214077795740.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112003214_3bd4d6a7954cb4d4667041e6d97590c4_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112003214_3bd4d6a7954cb4d4667041e6d97590c4_2_mwpm_03201609.png",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112003214_3bd4d6a7954cb4d4667041e6d97590c4_3_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "f101c66287b93c7c054ce8e500b27754",
      "title": "曝光！张某，15岁；陆某，14岁",
      "date": "2023-11-12 00:24:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112002417353914157.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112002417_237fb0158560a043d5a2631ad0c75d2d_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112002417_237fb0158560a043d5a2631ad0c75d2d_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112002417_237fb0158560a043d5a2631ad0c75d2d_3_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "5436e91037cd4426b4b93ac876b02876",
      "title": "成渝环线高速有交通管制",
      "date": "2023-11-12 00:16:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112001606178998356.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112001606_4cdb810deb973a24caece96b1d0ba7d8_1_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "2b580c45601db0c8642b31bc73f2af36",
      "title": "我为群众办实事 | 昆武交警细致暖心救助“小宝宝”一家",
      "date": "2023-11-12 00:16:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112001603946628108.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112001603_f51d13dcf3041208997c16bef7205dfa_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112001603_f51d13dcf3041208997c16bef7205dfa_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112001603_f51d13dcf3041208997c16bef7205dfa_3_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "26982d348bebdf6bf7ff158154809b55",
      "title": "广州对中小学幼儿园教师违反职业道德行为“零容忍”",
      "date": "2023-11-12 00:16:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112001601716673103.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112001601_16d382ea4b23db0be45dc78db21a6aa4_1_mwpm_03201609.jpeg",
      "is_content": "1"
    },
    {
      "uniquekey": "4d109f3eab45f7d808b3a9d7e9f76d18",
      "title": "【大干四季度 收官全年红】返还群众被骗资金43.1万！汉中公安召开电信网络诈骗赃款返还大会！",
      "date": "2023-11-12 00:07:00",
      "category": "头条",
      "author_name": "人民资讯",
      "url": "https://mini.eastday.com/mobile/211112000755122990322.html",
      "thumbnail_pic_s": "https://dfzximg02.dftoutiao.com/news/20211112/20211112000755_d72dc93ad1f34d03e9c73762e0e33e14_1_mwpm_03201609.jpeg",
      "thumbnail_pic_s02": "https://dfzximg02.dftoutiao.com/news/20211112/20211112000755_d72dc93ad1f34d03e9c73762e0e33e14_2_mwpm_03201609.jpeg",
      "thumbnail_pic_s03": "https://dfzximg02.dftoutiao.com/news/20211112/20211112000755_d72dc93ad1f34d03e9c73762e0e33e14_3_mwpm_03201609.jpeg",
      "is_content": "1"
    }
  ]
}