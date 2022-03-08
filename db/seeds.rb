User.create!(name: 'aaa', email: 'aaa@example.com', password: 'aaaaaa', password_confirmation: 'aaaaaa')
puts 'ユーザーAを作成しました'

['2級工業簿記', '2級商業簿記', '3級簿記'].each do |name|
  Level.create!(name: name)
end
puts 'レベルを作成しました'

secondIndustrialChapters = [
  {
    id: 1,
    title: '工業簿記とは',
    lessons: [
      { id: 1, title: '工業簿記とは' },
      { id: 2, title: '工業簿記の全体の流れ' },
      { id: 3, title: '原価計算とは' },
      { id: 4, title: '仕掛品と製品' },
    ],
  },
  {
    id: 2,
    title: '材料費',
    lessons: [
      { id: 1, title: '直接材料費と間接材料費' },
      { id: 2, title: '材料勘定の記入' },
      { id: 3, title: '材料の消費単価' },
      { id: 4, title: '材料の消費数量' },
      { id: 5, title: '棚卸減耗費' },
      { id: 6, title: '予定消費単価' },
    ],
  },
  {
    id: 3,
    title: '労務費',
    lessons: [
      { id: 1, title: '直接労務費と間接労務費' },
      { id: 2, title: '賃率勘定の記入' },
      { id: 3, title: '予定賃率' },
    ],
  },
  {
    id: 4,
    title: '経費',
    lessons: [
      { id: 1, title: '直接経費と間接経費' },
      { id: 2, title: '賃金勘定の記入' },
    ],
  },
  {
    id: 5,
    title: '製造間接費',
    lessons: [
      { id: 1, title: '製造間接費とは' },
      { id: 2, title: '予定配賦率とは' },
      { id: 3, title: '予定配賦率の原価差異の分析' },
    ],
  },
  {
    id: 6,
    title: '勘定の記入と財務諸表',
    lessons: [
      { id: 1, title: '勘定記入のまとめ' },
      { id: 2, title: '製造原価報告書' },
      { id: 3, title: '損益計算書と貸借対照表' },
      { id: 4, title: '原価差異がある場合の財務諸表' },
    ],
  },
  {
    id: 7,
    title: '製造間接費の部門別計算',
    lessons: [
      { id: 1, title: '製造間接費の第一次集計（部門個別費と部門共通費）' },
      { id: 2, title: '製造間接費の第二次集計（直接配賦法と相互配賦法）' },
      { id: 3, title: '製品への配賦（実際配賦と予定配賦）' },
    ],
  },
  {
    id: 8,
    title: '個別原価計算',
    lessons: [
      { id: 1, title: '個別原価計算とは' },
      { id: 2, title: '製造指図書と原価計算表' },
      { id: 3, title: '個別原価計算（仕損品）' },
      { id: 4, title: '原価計算表と勘定元帳との関係' },
      { id: 5, title: '個別原価計算（仕訳）' },
    ],
  },
  {
    id: 9,
    title: '総合原価計算１',
    lessons: [
      { id: 1, title: '総合原価計算とは' },
      { id: 2, title: '仕掛品の解き方' },
      { id: 3, title: '仕掛品の計算（先入先出法）' },
      { id: 4, title: '仕掛品の計算（平均法）' },
      { id: 5, title: '材料の追加投入（作業の途中に投入）' },
      { id: 6, title: '材料の追加投入（平均的に投入）' },
    ],
  },
  {
    id: 10,
    title: '総合原価計算２',
    lessons: [
      { id: 1, title: '仕損と減損とは' },
      { id: 2, title: '仕損１完成品原価に含めて処理' },
      { id: 3, title: '仕損２完成品原価と月末仕掛品原価に含めて処理' },
      { id: 4, title: ' 仕損３発生点が不明の場合' },
      { id: 5, title: '副産物と作業屑' },
    ],
  },
  {
    id: 11,
    title: '総合原価計算の種類',
    lessons: [
      { id: 1, title: '工程別総合原価計算' },
      { id: 2, title: '組別総合原価計算' },
      { id: 3, title: '等級別総合原価計算' },
    ],
  },
  {
    id: 12,
    title: '標準原価計算',
    lessons: [
      { id: 1, title: '標準原価計算とは' },
      { id: 2, title: '標準原価計算カード' },
      { id: 3, title: 'シングル・プラン' },
      { id: 4, title: 'パーシャル・プラン' },
      { id: 5, title: '原価差異の分析とは' },
      { id: 6, title: '原価差異の分析（材料費）' },
      { id: 7, title: '原価差異の分析（労務費）' },
      { id: 8, title: '原価差異の分析（製造間接費）' },
      { id: 9, title: '実際原価計算の原価差異の分析' },
    ],
  },
  {
    id: 13,
    title: '直接原価計算',
    lessons: [
      { id: 1, title: '直接原価計算とは' },
      { id: 2, title: 'CVP分析（基礎）' },
      { id: 3, title: 'CVP分析（応用）' },
      { id: 4, title: 'CVP分析（損益分岐点比率と安全余裕率）' },
      { id: 5, title: '直接原価計算の損益計算書' },
      { id: 6, title: '固定費調整' },
    ],
  },
  {
    id: 14,
    title: '本社工場会計',
    lessons: [
      { id: 1, title: '本社工場会計とは' },
      { id: 2, title: '本社と工場の仕訳' },
    ],
  },
]

secondCommercialChapters = [
  {
    id: 1,
    title: '売上原価',
    lessons: [
      { id: 1, title: '売上原価（三分法）' },
      { id: 2, title: '売上原価（販売のつど売上原価に振り替える方法）' },
      { id: 3, title: '棚卸減耗損・商品評価額' },
    ],
  },
  {
    id: 2,
    title: '商品売買・サービス集',
    lessons: [
      { id: 1, title: '収益の認識基準' },
      { id: 2, title: '仕入割戻' },
      { id: 3, title: '売上割戻' },
      { id: 4, title: '売上割引・仕入割引' },
      { id: 5, title: '役務収益・役務原価１' },
      { id: 6, title: '役務収益・役務原価２' },
      { id: 7, title: '主たる営業取引' },
    ],
  },
  {
    id: 3,
    title: '外貨建取引',
    lessons: [
      { id: 1, title: '外貨建取引（外国通貨での売上・仕入）' },
      { id: 2, title: '外貨建取引（売掛金と買掛金）' },
      { id: 3, title: '外貨建取引（前受金と前払金）' },
      { id: 4, title: '外貨建取引（決算整理仕訳）' },
      { id: 5, title: '為替予約（振当処理）１' },
      { id: 6, title: '為替予約（振当処理）２' },
    ],
  },
  {
    id: 4,
    title: '手形・債権の譲渡',
    lessons: [
      { id: 1, title: '割引手形' },
      { id: 2, title: '裏書手形' },
      { id: 3, title: '手形の不渡り' },
      { id: 4, title: '手形の期日の延長（手形の更改）' },
      { id: 5, title: '営業外支払手形・営業外受取手形' },
      { id: 6, title: '電子記録債権の割り引き・譲渡' },
      { id: 7, title: '債権の譲渡' },
    ],
  },
  {
    id: 5,
    title: '当座預金の銀行勘定調整表',
    lessons: [
      { id: 1, title: '銀行勘定調整表' },
      { id: 2, title: '連絡未通知' },
      { id: 3, title: '未渡小切手' },
      { id: 4, title: '誤記入' },
      { id: 5, title: '時間外預入' },
      { id: 6, title: '未取立小切手' },
      { id: 7, title: '未取付小切手' },
    ],
  },
  {
    id: 6,
    title: '固定資産',
    lessons: [
      { id: 1, title: '固定資産とは' },
      { id: 2, title: '固定資産の取得（圧縮記帳）' },
      { id: 3, title: '固定資産の取得（割賦購入）' },
      { id: 4, title: '減価償却（定額法）' },
      { id: 5, title: '減価償却（定率法）' },
      { id: 6, title: '減価償却（生産高比率法）' },
      { id: 7, title: '固定資産の売却' },
      { id: 8, title: '減価償却の記帳方法（間接法と直接法）' },
      { id: 9, title: '固定資産の買い替え' },
      { id: 10, title: '固定資産の除却・廃棄' },
      { id: 11, title: '固定資産の火災' },
      { id: 12, title: '建設仮勘定' },
      { id: 13, title: '無形固定資産１（特許権・商標権・のれん）' },
      { id: 14, title: '無形固定資産２（ソフトウェア）' },
      { id: 15, title: 'ソフトウェア勘定' },
    ],
  },
  {
    id: 7,
    title: 'リース取引',
    lessons: [
      { id: 1, title: 'リース取引とは' },
      { id: 2, title: 'オペレーティング・リース取引' },
      { id: 3, title: 'ファイナンス・リース取引' },
      { id: 4, title: 'ファイナンス・リース取引（利子込み法）' },
      { id: 5, title: 'ファイナンス・リース取引（利子抜き法）' },
    ],
  },
  {
    id: 8,
    title: '有価証券',
    lessons: [
      { id: 1, title: '有価証券の種類' },
      { id: 2, title: '売買目的有価証券の取得' },
      { id: 3, title: '売買目的有価証券の売却' },
      { id: 4, title: '売買目的有価証券の時価評価１' },
      { id: 5, title: '売買目的有価証券の時価評価２' },
      { id: 6, title: '満期保有目的債権の取得' },
      { id: 7, title: '満期保有目的債権の償却原価法' },
      { id: 8, title: '子会社株式・関連会社株式の取得' },
      { id: 9, title: 'その他の有価証券の取得と売却' },
      { id: 10, title: 'その他の有価証券の時価評価' },
      { id: 11, title: '端数利息' },
      { id: 12, title: '有価証券のまとめ' },
    ],
  },
  {
    id: 9,
    title: '引当金',
    lessons: [
      { id: 1, title: '引当金の種類' },
      { id: 2, title: '貸倒引当金の一括評価と個別評価' },
      { id: 3, title: '貸倒引当金の表示' },
      { id: 4, title: '商品保証引当金・製品保証引当金' },
      { id: 5, title: '固定資産の修繕引当金' },
      { id: 6, title: '賞与引当金' },
      { id: 7, title: '退職給付引当金' },
    ],
  },
  {
    id: 10,
    title: '純資産',
    lessons: [
      { id: 1, title: '純資産とは' },
      { id: 2, title: '株式会社の設立' },
      { id: 3, title: '増資' },
      { id: 4, title: '剰余金の配分と処分' },
      { id: 5, title: '株式資本の計数の変動' },
    ],
  },
  {
    id: 11,
    title: '税金',
    lessons: [
      { id: 1, title: '法人税等の仕訳' },
      { id: 2, title: '法人税等の計算と課税所得' },
      { id: 3, title: '税効果会計とは' },
      { id: 4, title: '税効果会計（減価償却）' },
      { id: 5, title: '税効果会計（貸倒引当金）' },
      { id: 6, title: '税効果会計（その他の有価証券）' },
      { id: 7, title: 'その他の税金' },
    ],
  },
  {
    id: 12,
    title: 'その他の論点',
    lessons: [
      { id: 1, title: '合併１（現金を渡す場合）' },
      { id: 2, title: '合併２（株式を渡す場合）' },
      { id: 3, title: '合併３（のれん・負ののれん発生益）' },
      { id: 4, title: '研究開発費' },
      { id: 5, title: '保証債務' },
      { id: 6, title: '長期前払費用' },
      { id: 7, title: '月次決算' },
    ],
  },
  {
    id: 13,
    title: '精算表・財務諸表',
    lessons: [
      { id: 1, title: '精算表の形式' },
      { id: 2, title: '精算表（棚卸減耗損などの記入方法）' },
      { id: 3, title: '損益計算書' },
      { id: 4, title: '貸借対照表' },
      { id: 5, title: '株主資本等変動計算表' },
      { id: 6, title: '製造業の財務諸表' },
    ],
  },
  {
    id: 14,
    title: '本支店会計',
    lessons: [
      { id: 1, title: '本支店会計とは' },
      { id: 2, title: '本支店間の取引' },
      { id: 3, title: '支店間の取引１（支店分散計算制度）' },
      { id: 4, title: '支店間の取引２（本店集中計算制度）' },
      { id: 5, title: '決算整理１' },
      { id: 6, title: '決算整理２' },
      { id: 7, title: '本支店合併財務諸表' },
      { id: 8, title: '本店と支店の損益振替' },
    ],
  },
  {
    id: 15,
    title: '連結会計',
    lessons: [
      { id: 1, title: '連結会計とは' },
      { id: 2, title: '支配獲得日の連結会計１' },
      { id: 3, title: '支配獲得日の連結会計２' },
      { id: 4, title: '支配獲得日の連結会計３' },
      { id: 5, title: '連結第１年度の連結会計' },
      { id: 6, title: '連結第２年度の連結会計' },
      { id: 7, title: 'タイムテーブルを使った解き方' },
      { id: 8, title: '連結会計間の取引の消去' },
      { id: 9, title: 'ダウンストリームとアップストリーム' },
      { id: 10, title: '貸倒引当金の調整' },
      { id: 11, title: '未実現利益の消去１（商品）' },
      { id: 12, title: '未実現利益の消去２（土地）' },
      { id: 13, title: '連結精算表' },
      { id: 14, title: '連結財務諸表' },
    ],
  },
]

secondIndustrialChapters.each do |data_chapter|
  level = Level.find_by!(name: '2級工業簿記')
  created_chapter = level.chapters.create!(name: data_chapter[:title])
  data_chapter[:lessons].each do |lesson|
    created_chapter.lessons.create!(name: lesson[:title], level_id: created_chapter.level.id)
  end
end
puts '2級工業簿記のチャプター・レッスンを作成しました'

secondCommercialChapters.each do |data_chapter|
  level = Level.find_by!(name: '2級商業簿記')
  created_chapter = level.chapters.create!(name: data_chapter[:title])
  data_chapter[:lessons].each do |lesson|
    created_chapter.lessons.create!(name: lesson[:title], level_id: created_chapter.level.id)
  end
end
puts '2級商業簿記のチャプター・レッスンを作成しました'