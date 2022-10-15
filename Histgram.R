#CSV取り込み
AthleteAll <- read.table("athlete_events.csv",
                 sep = ',',
                 header = TRUE,
                 stringsAsFactors = FALSE)
#性別と身長のみ抽出
AthleteHeight <- AthleteAll[,c(3, 5)]
#身長のヒストグラム
hist(AthleteHeight$Height)
#色、分割数を変えてタイトルをつける
hist(AthleteHeight$Height, col="steelblue", breaks=50)


#ライブラリggplot2を使って描く
library(ggplot2)  #ライブラリの読み込み
#変数（データ項目）はaes()の中に、定数は外に書く
ggplot(AthleteHeight)+               #データフレームの指定
  geom_histogram( aes(Height),       #描画の対象となる変数
                  fill="steelblue",  #塗り色の指定
                  alpha=0.8,         #透明度の指定
                  binwidth=1 )       #階級の幅(例では1cm刻み)

#密度プロットを描く
ggplot(AthleteHeight)+                   #データフレームの指定 
  geom_density( aes(Height) ) +          #描画の対象となる変数
  theme(axis.text=element_text(size=12), #文字サイズの指定 
        axis.title=element_text(size=14,face="bold"))


#性別で色分けしてヒストグラムを描く
ggplot(AthleteHeight)+                 #データフレームの指定
  geom_histogram( aes(x   =Height,     #描画の対象となる変数
                      fill=Sex),       #塗り分けの対象となる変数
                  position="identity", #重ねて描くという指定
                  alpha=0.5,           #透明度の指定
                  binwidth=1 )         #階級の幅(例では1cm刻み)

#色を指定することも可能
ggplot(AthleteHeight)+                 #データフレームの指定
  geom_histogram( aes(x   =Height,     #描画の対象となる変数
                      fill=Sex),       #塗り分けの対象となる変数
                  position="identity", #重ねて描くという指定
                  alpha=0.5,           #透明度の指定
                  binwidth=1 )+        #階級の幅(例では1cm刻み)
  #色分けの指定を足す
  #注意：前の行から+でつなげるのを忘れないこと）
  scale_fill_manual( values=c("darkgreen", "orange") )+
  #軸の文字サイズを変更する
  theme(axis.text =element_text(size=12, face="bold"), #軸の数値
        axis.title=element_text(size=14) )             #軸の名称

#性別で色分けして密度プロットを描く
ggplot(AthleteHeight)+              #データフレームの指定
  geom_density( aes(x    =Height,   #描画の対象となる変数
                    color=Sex) )+   #色分けの対象となる変数
  #色分けの指定を足す
  scale_color_manual( values=c("darkgreen", "orange") )

#中を塗ることも可能
ggplot(AthleteHeight)+              #データフレームの指定
  geom_density( aes(x=Height,   #描画の対象となる変数
                    color=Sex,      #色分けの対象となる変数
                    fill =Sex),     #塗り分けの対象となる変数
                    alpha=0.3  )+       #透明度の指定
  #色分けの指定を足す
  scale_color_manual( values=c("darkgreen", "orange") )+
  scale_fill_manual(  values=c("darkgreen", "orange") )+
  #軸の文字サイズとタイトルのフォントを変更する
  theme(axis.text =element_text(size=12, face="bold"), #軸の数値
        axis.title=element_text(size=14) )             #軸の名称

