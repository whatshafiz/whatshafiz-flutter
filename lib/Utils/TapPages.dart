enum TapPages {
  WhatHafiz,
  Yonetmenlikler,
  BizKimiz,
  SSS,
  OgrenciYorumlari,
  EzberTeknikleri,
  Kayit,
  Giris;

  int get pageNum {
    switch (this) {
      case TapPages.WhatHafiz:
        return 0;
      case TapPages.Yonetmenlikler:
        return 1;
      case TapPages.BizKimiz:
        return 2;
      case TapPages.SSS:
        return 3;
      case TapPages.OgrenciYorumlari:
        return 4;
      case TapPages.EzberTeknikleri:
        return 5;
      case TapPages.Kayit:
        return 6;
      case TapPages.Giris:
        return 7;
    }
  }
}
