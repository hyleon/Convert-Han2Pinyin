Function Convert-Han2Pinyin
{
    
    Param (
        [String]$str,
        [int]$Mode = 3
    )

    $uri = "https://translate.google.cn/translate_a/single?client=gtx&sl=zh-CN&tl=en&hl=zh-CN&dt=at&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&ie=UTF-8&oe=UTF-8&otf=2&ssel=0&tsel=0&kc=5&tk=708660.820543&q=$str"
    $word = (Invoke-WebRequest -Uri $uri).content | ConvertFrom-Json
    $pinyin = $word[0][-1] | ?{$_}
    
    Switch($Mode)
    {
        1 { return $pinyin }
        2 {
           $pinyin -replace("ā","a1")`
           -replace("á","a2")`
           -replace("ǎ","a3")`
           -replace("à","a4")`
           -replace("ē","e1")`
           -replace("é","e2")`
           -replace("ě","e3")`
           -replace("è","e4")`
           -replace("ō","o1")`
           -replace("ó","o2")`
           -replace("ǒ","o3")`
           -replace("ò","o4")`
           -replace("ī","i1")`
           -replace("í","i2")`
           -replace("ǐ","i3")`
           -replace("ì","i4")`
           -replace("ū","u1")`
           -replace("ú","u2")`
           -replace("ǔ","u3")`
           -replace("ù","u4")`
           -replace("ü","v0")`
           -replace("ǘ","v2")`
           -replace("ǚ","v3")`
           -replace("ǜ","v4")`
           -replace("ń","n2")`
           -replace("ň","n3")`
           -replace("","m2")`
           -replace("\s")
        }
        3 {
           $pinyin -replace("ā","a")`
           -replace("á","a")`
           -replace("ǎ","a")`
           -replace("à","a")`
           -replace("ē","e")`
           -replace("é","e")`
           -replace("ě","e")`
           -replace("è","e")`
           -replace("ō","o")`
           -replace("ó","o")`
           -replace("ǒ","o")`
           -replace("ò","o")`
           -replace("ī","i")`
           -replace("í","i")`
           -replace("ǐ","i")`
           -replace("ì","i")`
           -replace("ū","u")`
           -replace("ú","u")`
           -replace("ǔ","u")`
           -replace("ù","u")`
           -replace("ü","v")`
           -replace("ǘ","v")`
           -replace("ǚ","v")`
           -replace("ǜ","v")`
           -replace("ń","n")`
           -replace("ň","n")`
           -replace("","m")`
           -replace("\s")
        }
    }
}
